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
    				<h1 class="text-uppercase">Get in Touch</h1>
    				<span>Contact Us</span>
    			</div>
    			<nav aria-label="breadcrumb">
    				<ol class="breadcrumb">
    					<li class="breadcrumb-item">
    					    <#--<a href="#">Home</a>-->
    					     <a href="<@ofbizUrl>main</@ofbizUrl>" class="linktext">${uiLabelMap.CommonMain}</a>
    					 </li>
    					  <#if session.getAttribute("_BREAD_CRUMB_TRAIL_")??>
                             <#assign crumbs = Static["org.apache.ofbiz.product.category.CategoryWorker"].getTrail(request)/>
                             <#list crumbs as crumb>
                                  <#if catContentWrappers?? && catContentWrappers[crumb]??>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <a href="<@ofbizCatalogUrl currentCategoryId=crumb previousCategoryId=previousCategoryId!""/>" class="<#if crumb_has_next>linktext<#else>buttontextdisabled</#if>">
                                            <#if catContentWrappers[crumb].get("CATEGORY_NAME", "html")??>
                                                ${catContentWrappers[crumb].get("CATEGORY_NAME", "html")}
                                            <#elseif catContentWrappers[crumb].get("DESCRIPTION", "html")??>
                                                ${catContentWrappers[crumb].get("DESCRIPTION", "html")}
                                            <#else>
                                                ${crumb}
                                            </#if>
                                        </a>
                                        <#if crumb_has_next> &gt;</#if>
    					            </li>
    					          </#if>
    					     </#list>
    					  </#if>
    				</ol>
    			</nav>
    		</div>
    </section><!-- .page-title end -->


    <section id="content">
    	<div class="content-wrap pb-0">
    		<div class="container">
    			<div class="row justify-content-between">
    				<div class="col-lg-4 col-md-6">
    					<h2 class="h1 fw-bold mb-4">${StoresLabelMap.Capri}</h2>
    					<p>Presso La Parisienne</p>
    					<h4>
    						Piazza Umberto I Nr. 7<br>
    						Capri (NA) <br>80073<br>
    					</h4>
    					<abbr title="Phone Number"><strong>Phone:</strong></abbr> +390818377750<br>
    					<abbr title="Email Address"><strong>Email:</strong></abbr> laparisienne@libero.it<br>
    				</div>
    				<div class="col-lg-7 col-md-6 mt-4 mt-md-0">
    					<img src="<@ofbizContentUrl>/fi_it/assets/store/images/contact/1.jpg</@ofbizContentUrl>" alt="image">
    				</div>
    			</div>
    			<div class="clear my-5"></div>
    			<div class="row justify-content-between mb-4">
                    				<div class="col-lg-4 col-md-6">
                    					<h2 class="h1 fw-bold mb-4">Forte dei Marmi</h2>
                    					<p>Presso GentryPortofino</p>
                    					<h4>
                    						Via Stagio Stagi 40<br>
                    						Forte dei Marmi (LU) <br>55042<br>
                    					</h4>
                    					<abbr title="Phone Number"><strong>Phone:</strong></abbr> +3905841974197<br>

                    				</div>
                    				<div class="col-lg-7 col-md-6 mt-4 mt-md-0">
                    					<img src="<@ofbizContentUrl>/fi_it/assets/store/images/contact/1.jpg</@ofbizContentUrl>" alt="image">
                    				</div>
                    			</div>
                <div class="clear my-5"></div>
                    			<div class="row justify-content-between mb-4">
                                    				<div class="col-lg-4 col-md-6">
                                    					<h2 class="h1 fw-bold mb-4">Napoli</h2>
                                    					<p>Presso MA VIE</p>
                                    					<h4>
                                    						Via Carlo Poerio 35<br>
                                    						Napoli (NA) <br>80122<br>
                                    					</h4>


                                    				</div>
                                    				<div class="col-lg-7 col-md-6 mt-4 mt-md-0">
                                    					<img src="<@ofbizContentUrl>/fi_it/assets/store/images/contact/1.jpg</@ofbizContentUrl>" alt="image">
                                    				</div>
                                    			</div>
                 <div class="clear my-5"></div>
                                    			<div class="row justify-content-between mb-4">
                                                    				<div class="col-lg-4 col-md-6">
                                                    					<h2 class="h1 fw-bold mb-4">Porto Rotondo</h2>

                                                    					<h4>
                                                    						Via del Molo 21<br>
                                                    						Porto Rotondo - Olbia (SS)<br>07026<br>
                                                    					</h4>


                                                    				</div>
                                                    				<div class="col-lg-7 col-md-6 mt-4 mt-md-0">
                                                    					<img src="<@ofbizContentUrl>/fi_it/assets/store/images/contact/1.jpg</@ofbizContentUrl>" alt="image">
                                                    				</div>
                                                    			</div>

                  <div class="clear my-5"></div>
                                                     			<div class="row justify-content-between mb-4">
                                                                     				<div class="col-lg-4 col-md-6">
                                                                     					<h2 class="h1 fw-bold mb-4">Porto Cervo</h2>

                                                                     					<h4>
                                                                     						Via Sottopiazza delle Chiacchiere<br>
                                                                     						Porto Cervo - Arzachena (SS)<br>07021<br>
                                                                     					</h4>

                                                                                        <a href="https://www.google.com/maps/dir//Via+Sottopiazza+delle+Chiacchiere,+07021+Porto+Cervo+-+Arzachena+(SS)/@41.1325803,9.4527432,12z/data=!3m1!4b1!4m9!4m8!1m1!4e2!1m5!1m1!1s0x12d9410cc23c56a5:0x4a7da4d1f3d07e14!2m2!1d9.535144!2d41.1326097?entry=ttu">Guarda sulla mappa</a>
                                                                     				</div>
                                                                     				<div class="col-lg-7 col-md-6 mt-4 mt-md-0">
                                                                     					<img src="<@ofbizContentUrl>/fi_it/assets/store/images/contact/1.jpg</@ofbizContentUrl>" alt="image">
                                                                     				</div>
                                                                     			</div>
    		</div>
        </div>
    </section>

</#macro>

<@display_page/>