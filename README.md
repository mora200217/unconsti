# Prototipo de Aplicación Web: Proceso Constituyente - Universidad Nacional de Colombia

Este repositorio contiene el código fuente de un prototipo de aplicación web que tiene como propósito visibilizar y facilitar la participación de la comunidad universitaria en el proceso constituyente de la Universidad Nacional de Colombia. A través de esta plataforma, los usuarios podrán acceder a la información clave del proceso, interactuar con los documentos oficiales y expresar sus ideas en un espacio de discusión colaborativa.

## Descripción

El proceso constituyente es un proyecto esencial para la reforma de los estatutos de la Universidad Nacional, y este prototipo busca proporcionar una interfaz accesible y amigable para que la comunidad universitaria pueda informarse y participar activamente. La plataforma está diseñada para ser interactiva, permitiendo la visualización del cronograma, documentos oficiales, y discusiones en foros.

## Objetivos

- **Facilitar el acceso** a los documentos y recursos relacionados con el proceso constituyente.
- **Proporcionar un espacio** para la discusión y colaboración de la comunidad universitaria.
- **Fomentar la participación** activa en las decisiones sobre la reforma de los estatutos universitarios.
- **Mostrar un esquema visual** del proceso constituyente y los actores involucrados.

## Quickstart

Clona este repositorio:

   ```bash
   git clone https://github.com/mora200217/unconsti.git
   cd unconsti
   ```
Instala las dependencias requqeridas. 
> Se usó yarn como gestor de paquetes pero es libre de usar el gestor que desees. Poner atención a no generar conflictos entre gestores.

Crea un archivo `.env` en el `root` del proyecto, con las variables de entorno. 
```.env
PORT=3000
DATABASE_URI=
PAYLOAD_SECRET=
PAYLOAD_PUBLIC_SERVER_URL=http://localhost:3000
NEXT_PUBLIC_SERVER_URL=http://localhost:3000
NEXT_PUBLIC_IS_LIVE=
PAYLOAD_PUBLIC_DRAFT_SECRET=
NEXT_PRIVATE_DRAFT_SECRET=
REVALIDATION_KEY=demo-revalation-key
NEXT_PRIVATE_REVALIDATION_KEY=demo-revalation-key
```
Corre el servidor del proyecto 
```
  yarn dev 
```

Y listo! Tienes el proyecto corriendo. 

## Contribuciones
Las contribuciones son bienvenidas. Si deseas colaborar, sigue estos pasos:

Haz un fork del proyecto.
Crea una rama con una nueva característica o mejora (git checkout -b nueva-caracteristica).
Realiza los cambios y haz un commit (git commit -m 'Añadir nueva característica').
Envía tus cambios al repositorio original (git push origin nueva-caracteristica).
Crea un pull request.



   
