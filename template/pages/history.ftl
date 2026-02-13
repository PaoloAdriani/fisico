<#include "base.ftl" />

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
                            <h1 class="text-uppercase">History</h1>
                            <#--<span>Contact Us</span>-->
                        </div>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<@ofbizUrl>main</@ofbizUrl>">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">History</li>
                            </ol>
                        </nav>
                    </div>
               </div>
        </section><!-- .page-title end -->

    <section id="content">
    	<div class="content-wrap">
            <div class="masonry-thumbs grid-container row row-cols-3" data-lightbox="gallery">
            	<a class="grid-item" href="<@ofbizContentUrl>/fi_it/assets/images/history/h_1.jpg</@ofbizContentUrl>" data-lightbox="gallery-item"><img src="<@ofbizContentUrl>/fi_it/assets/images/history/h_1.jpg</@ofbizContentUrl>" alt="Gallery Thumb 1"></a>
            	<a class="grid-item" href="<@ofbizContentUrl>/fi_it/assets/images/history/h_2.jpg</@ofbizContentUrl>" data-lightbox="gallery-item"><img src="<@ofbizContentUrl>/fi_it/assets/images/history/h_2.jpg</@ofbizContentUrl>" alt="Gallery Thumb 2"></a>
            	<a class="grid-item" href="<@ofbizContentUrl>/fi_it/assets/images/history/h_3.jpg</@ofbizContentUrl>" data-lightbox="gallery-item"><img src="<@ofbizContentUrl>/fi_it/assets/images/history/h_3.jpg</@ofbizContentUrl>" alt="Gallery Thumb 3"></a>
            </div>

            <div class="container mt-6">
            	<div class="row col-mb-50 mb-0">
            		<div class="col-md-4">
            			<h4>${HistoryLabelMap.FashionShow}</h4>
            			<p>${HistoryLabelMap.FashionShowDescription}</p>
            		</div>
            		<div class="col-md-4">
            			<h4>${HistoryLabelMap.Innovations}</h4>
            			<p>${HistoryLabelMap.InnovationsDescription}</p>
                    </div>
                    <div class="col-md-4">
                        <h4>${HistoryLabelMap.PretaPorter}</h4>
                        <p>${HistoryLabelMap.PretaPorterDescription}</p>
                    </div>
                </div>
            </div>
    	</div>
    </section>


</#macro>

<@display_page/>