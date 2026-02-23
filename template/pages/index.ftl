<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro add_page_head_after_head_tag>

    <style type="text/css">

         .swiper-slide {
            position: relative;
         }

        .slide-link {
            position: absolute;
            inset: 0;
            z-index: 2;
        }

        .swiper-slide-bg {

            position: absolute;
            inset: 0;
            z-index: 1;
        }

        .slider-caption {
            position: relative;
            z-index: 3;
            pointer-events: none;
        }

        .swiper-slide-bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

    </style>
</#macro>

<#macro page_body>

    <#include "homepage/sliderTopBikini.ftl" />
    <#include "homepage/sliderSlipBikini.ftl" />
    <#include "homepage/sliderSwimsuit.ftl" />
    <#include "homepage/sliderBeachwear.ftl" />
    <#include "homepage/sliderCrystals.ftl" />
    <#include "homepage/sliderFitness.ftl" />

</#macro>

<@display_page/>