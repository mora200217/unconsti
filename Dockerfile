# Utiliza la imagen base de Node.js
FROM node:18.8-alpine AS base

# Define variables ARG que se pasarán durante la construcción
ARG PORT
ARG DATABASE_URI
ARG PAYLOAD_SECRET
ARG PAYLOAD_PUBLIC_SERVER_URL
ARG NEXT_PUBLIC_SERVER_URL
ARG NEXT_PUBLIC_IS_LIVE
ARG PAYLOAD_PUBLIC_DRAFT_SECRET
ARG NEXT_PRIVATE_DRAFT_SECRET
ARG REVALIDATION_KEY
ARG NEXT_PRIVATE_REVALIDATION_KEY
# ARG USER_EMAIL
# ARG USER_PASS
# Crea una etapa para construir la aplicación
FROM base AS builder

# Define el directorio de trabajo
WORKDIR /home/node/app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Copia todo el código fuente al contenedor
COPY . .

# Instala las dependencias y construye el proyecto
RUN npm install

# Construir el proyecto Next.js
RUN npm run build

# Crea una etapa para el entorno de producción
FROM base AS runtime

# Configura las variables de entorno utilizando ARG y ENV
ENV NODE_ENV=production
ENV PAYLOAD_CONFIG_PATH=dist/payload/payload.config.js
ENV PORT=${PORT}
ENV DATABASE_URI=${DATABASE_URI}
ENV PAYLOAD_SECRET=${PAYLOAD_SECRET}
ENV PAYLOAD_PUBLIC_SERVER_URL=${PAYLOAD_PUBLIC_SERVER_URL}
ENV NEXT_PUBLIC_SERVER_URL=${NEXT_PUBLIC_SERVER_URL}
ENV NEXT_PUBLIC_IS_LIVE=${NEXT_PUBLIC_IS_LIVE}
ENV PAYLOAD_PUBLIC_DRAFT_SECRET=${PAYLOAD_PUBLIC_DRAFT_SECRET}
ENV NEXT_PRIVATE_DRAFT_SECRET=${NEXT_PRIVATE_DRAFT_SECRET}
ENV REVALIDATION_KEY=${REVALIDATION_KEY}
ENV NEXT_PRIVATE_REVALIDATION_KEY=${NEXT_PRIVATE_REVALIDATION_KEY}
# ARG USER_EMAIL=${USER_EMAIL}
# ARG USER_PASS=${USER_PASS}
# Define el directorio de trabajo
WORKDIR /home/node/app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala solo las dependencias de producción
RUN npm install --only=production

# Copia los archivos construidos desde la etapa de construcción
COPY --from=builder /home/node/app/dist ./dist
COPY --from=builder /home/node/app/build ./build

# Copia el directorio .next desde la etapa de construcción
COPY --from=builder /home/node/app/.next ./.next

# Copia la carpeta media
COPY --from=builder /home/node/app/media ./media

# Copia la carpeta public
COPY --from=builder /home/node/app/public ./public

# Expone el puerto
EXPOSE 3000

# Define el comando para iniciar la aplicación
CMD ["node", "dist/server.js"]