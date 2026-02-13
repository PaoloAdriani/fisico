<#include "../base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro page_body>

    <!-- Page Title
                   ============================================= -->
         <section class="page-title page-title-parallax parallax scroll-detect dark page-title-center include-header bg-overlay-mask" style="padding: 170px 0 100px;">
            <img src="<@ofbizContentUrl>/fi_it/assets/images/fisico_boutique.jpg</@ofbizContentUrl>" class="parallax-bg">
               	<div class="container">
                     <div class="page-title-row">
                   		<div class="page-title-content">
                   			<h1 class="text-uppercase">SS 2025</h1>
                   			<#--<span>Contact Us</span>-->
                   		</div>
                   		<nav aria-label="breadcrumb">
                   			<ol class="breadcrumb">
                   				<li class="breadcrumb-item"><a href="<@ofbizUrl>main</@ofbizUrl>">${SystemLabelMap.Home}</a></li>
                   				<li class="breadcrumb-item"><a href="<@ofbizUrl>main</@ofbizUrl>">Campaign</a></li>
                   				<li class="breadcrumb-item active" aria-current="page">SS 2025</li>
                   			</ol>
                   	    </nav>
                   	</div>
                </div>
         </section><!-- .page-title end -->

         <section id="slider" class="slider-element mt-3">
         	<div class="masonry-thumbs grid-container row row-cols-6" data-big="3" data-lightbox="gallery">
         	    <#list 1..21 as i>
                    <a class="grid-item" href="<@ofbizContentUrl>/fi_it/assets/images/campaign/adv2025/adv25_${i}.jpg</@ofbizContentUrl>" data-lightbox="gallery-item">
                        <div class="grid-inner">
                            <img src="<@ofbizContentUrl>/fi_it/assets/images/campaign/adv2025/adv25_${i}.jpg</@ofbizContentUrl>" alt="Gallery Thumb 1">
                            <div class="bg-overlay">
                                <div class="bg-overlay-content dark">
                                    <span class="overlay-trigger-icon bg-light text-dark" data-hover-animate="zoomIn" data-hover-animate-out="zoomOut" data-hover-speed="400"><i class="uil uil-play"></i></span>
                                </div>
                            </div>
                        </div>
                    </a>
                </#list>
         	</div>
        </section>




</#macro>

<@display_page/>