<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>



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
            background-size: cover;
            background-position: center;
            z-index: 1;
        }

        .slider-caption {
            position: relative;
            z-index: 3;
            pointer-events: none;
        }

    </style>


<#macro page_body>

    <#include "sliderTopBikini.ftl" />
    <#include "sliderSlipBikini.ftl" />
    <#include "sliderSwimsuit.ftl" />
    <#include "sliderBeachwear.ftl" />
    <#include "sliderCrystals.ftl" />
    <#include "sliderFitness.ftl" />

</#macro>

<@display_page/>