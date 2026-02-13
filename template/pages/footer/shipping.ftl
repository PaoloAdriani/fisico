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
               			<h1 class="text-uppercase">${SystemLabelMap.Shipping}</h1>
               			<#--<span>Contact Us</span>-->
               		</div>
               		<nav aria-label="breadcrumb">
               			<ol class="breadcrumb">
               				<li class="breadcrumb-item"><a href="<@ofbizUrl>main</@ofbizUrl>">${SystemLabelMap.Home}</a></li>
               				<li class="breadcrumb-item active" aria-current="page">${SystemLabelMap.Shipping}</li>
               			</ol>
               	    </nav>
               	</div>
            </div>
     </section><!-- .page-title end -->

</#macro>

<@display_page/>