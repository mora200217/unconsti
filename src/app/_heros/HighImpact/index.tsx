import React, { Fragment } from 'react'

import { Page } from '../../../payload/payload-types'
import { Gutter } from '../../_components/Gutter'
import { CMSLink } from '../../_components/Link'
import Image from 'next/image'
import { Media } from '../../_components/Media'
import RichText from '../../_components/RichText'
import Hand from '../../../../media/hand.png'

import classes from './index.module.scss'

export const HighImpactHero: React.FC<Page['hero']> = ({ richText, media, links }) => {
  return (
    <Gutter className={classes.hero}>

<div className="row justify-content-center align-items-center w-100">
  <div className={["col-12 col-md-5 px-2 m-0", classes.title_block, "text-center text-md-start"].join(" ")}>
    <br />
    
    <h1><strong>UN</strong> Constituyente</h1> {/* Larger title */}
    <p>Aprende como va el proceso para reconstruir la universidad. Es un trabajo de todxs.</p>
    <p>Infórmate. Opina. <strong>Participa.</strong></p>
  </div>

  <div className="col-md-7 d-flex justify-content-md-end justify-content-center">
    <div className="d-flex flex-column d-none d-md-flex">
      <span className={`${classes.bluebar} `}></span> {/* Hidden on small screens */}
      <Image
        className={classes.hand}
        src={Hand}
        width={500}
        height={500}
        alt="Picture of the hand"
      />
    </div>
  </div>
</div>
    </Gutter>
  )
}
