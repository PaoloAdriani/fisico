<!-- Top Bar
		============================================= -->
		<#--
		<div id="top-bar" class="bg-color py-3 border-0 z-2">
			<div class="container">
				<div class="text-center">
					<span>Flat 20% off on your First Order. Use this Code: <strong>CANVAS20</strong></span>
				</div>

			</div>
		</div>
        -->
		<!-- Header
		============================================= -->
		<header id="header" class="header-size-md transparent-header">
			<div id="header-wrap" style="border-bottom: none;">
				<div class="container-fluid">
					<div class="header-row justify-content-lg-between">

						<!-- Logo
						============================================= -->
						<div id="logo" class="me-lg-auto me-0 order-lg-2 col-lg-auto">
							<a href="<@ofbizUrl>main</@ofbizUrl>">
								<img class="logo-default" srcset="<@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl>, <@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl>" alt="Fisico Logo">
								<img class="logo-mobile" srcset="<@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl>, <@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>/fi_it/assets/images/logo.png</@ofbizContentUrl>" alt="Fisico Logo">
							</a>
						</div><!-- #logo end -->

						<!-- Primary Navigation
						============================================= -->
						<nav class="primary-menu me-lg-0 order-lg-3 order-5">

							<!-- Menu Left -->
							<#--
							<ul class="menu-container">
								<li class="menu-item"><a class="menu-link" href="#"><div>FAQs</div></a></li>
								<li class="menu-item"><a class="menu-link" href="#"><div>Journal</div></a></li>
								<li class="menu-item"><a class="menu-link" href="#"><div>Contact</div></a></li>
							</ul>
							-->

						</nav><!-- #primary-menu end -->

						<div class="header-misc col-lg-auto order-lg-4 ms-auto ms-lg-0 justify-content">


                            <div id="miniCartContainer">
                                <#include "miniCart.ftl" />
                            </div>

							<!-- Top Login
							============================================= -->

						    <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
							    <div id="top-account" class="header-misc-icon px-3">
                                    <div class="dropdown mx-3 me-lg-0">
                                        <a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="uil uil-user"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenu1">
                                            <a class="dropdown-item text-start" href="<@ofbizUrl>viewprofile</@ofbizUrl>">Profile</a>
                                            <a class="dropdown-item text-start" href="<@ofbizUrl>ListRequests</@ofbizUrl>">Returns</a>
                                            <a class="dropdown-item text-start" href="<@ofbizUrl>orderhistory</@ofbizUrl>">Order History</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item text-start" href="<@ofbizUrl>logout</@ofbizUrl>">Logout <i class="bi-box-arrow-left"></i></a>
                                        </ul>
                                    </div>
                                </div>
                            <#else>
                                <div id="top-account" class="header-misc-icon px-3">
                                	<a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">Account</a>
                                </div><!-- #top-search end -->
                            </#if>


						</div>

						<div class="primary-menu-trigger">
							<button class="cnvs-hamburger" type="button" title="Open Mobile Menu">
								<span class="cnvs-hamburger-box"><span class="cnvs-hamburger-inner"></span></span>
							</button>
						</div>

						<!-- Primary Navigation
						============================================= -->
						<nav class="primary-menu with-arrows col-lg-auto me-lg-auto order-lg-1">

							<!-- Menu Left -->
							<ul class="menu-container">
                                <li class="menu-item mega-menu mega-menu-small"><a class="menu-link" href="#"><div>Shop</div></a>
                                    <div class="mega-menu-content mega-menu-style-2">
                                        <div class="container">
                                            <div class="row">
                                                <ul class="sub-menu-container mega-menu-column col-lg-6">
                                                        <#list navCategories as cat>

                                                            <#list cat.children as sub>

                                                                <ul class="sub-menu-container">
                                                                    <li class="menu-item"><a class="menu-link" href="<@ofbizCatalogAltUrl productCategoryId="${sub.id}"/>"><div>${sub.name}</div></a></li>
                                                                </ul>
                                                            </#list>
                                                        </#list>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>

								<li class="menu-item"><a class="menu-link" href="<@ofbizUrl>campaign</@ofbizUrl>"><div>Campaign</div></a></li>
								<li class="menu-item"><a class="menu-link" href="<@ofbizUrl>stores</@ofbizUrl>"><div>Stores</div></a></li>
								<li class="menu-item"><a class="menu-link" href="#"><div><#include "footer/language.ftl" /></div></a></li>

							</ul>

						</nav><!-- #primary-menu end -->

					</div>

				</div>

			</div>
			<div class="header-wrap-clone"></div>

		</header><!-- #header end -->