<!-- Header
		============================================= -->
<header id="header" class="header-size-md dark transparent-header" data-sticky-shrink="false" data-sticky-class="not-dark">
    <div id="header-wrap" style="border-bottom: none">
        <div class="container-fluid">
            <div class="header-row justify-content-lg-between">

                <!-- Logo
                ============================================= -->
                <div id="logo" class="me-lg-auto me-0 order-lg-2 col-lg-auto">
                    <a href="<@ofbizUrl>main</@ofbizUrl>">
                        <img class="logo-default" srcset="<@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl>, <@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl>" alt="Fisico Logo">
                        <img class="logo-mobile" srcset="<@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl>, <@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl> 2x" src="<@ofbizContentUrl>/fi_it/assets/images/Logo_remake.png</@ofbizContentUrl>" alt="Fisico Logo">
                    </a>
                </div><!-- #logo end -->

                <!-- Primary Navigation
                ============================================= -->
                <nav class="primary-menu with-arrows me-lg-0 order-lg-3 order-5">

                    <!-- Menu Left -->
                    <form method="post"
                          name="chooseLanguage"
                          action="<@ofbizUrl>setSessionLocale</@ofbizUrl>"
                          id="chooseLanguageForm">
                        <input type="hidden" name="newLocale" id="newLocaleInput" />
                    </form>

                    <ul class="menu-container">
                        <li class="menu-item">

                            <!-- Lingua attuale visibile -->
                            <a class="menu-link upper" href="#">
                                <div>
                                    ${locale.getDisplayName(locale)?substring(0, 2)}
                                </div>
                            </a>

                            <ul class="sub-menu-container">

                                <#assign availableLocales = Static["org.apache.ofbiz.base.util.UtilMisc"].availableLocales()/>
                                <#list availableLocales as availableLocale>
                                    <#if availableLocale?contains("it_IT") || availableLocale?contains("en_US")>

                                        <#assign langAttr = availableLocale.toString()?replace("_", "-")>
                                        <#assign langDir = "ltr">
                                        <#if "ar.iw"?contains(langAttr?substring(0, 2))>
                                            <#assign langDir = "rtl">
                                        </#if>

                                        <li class="menu-item">
                                            <a class="menu-link <#if locale.toString() = availableLocale.toString()>current</#if> upper"
                                               href="#"
                                               lang="${langAttr}"
                                               dir="${langDir}"
                                               data-locale="${availableLocale.toString()}">
                                                <div>
                                                    ${availableLocale.getDisplayName(availableLocale)?substring(0, 2)}
                                                </div>
                                            </a>
                                        </li>

                                    </#if>
                                </#list>

                            </ul>
                        </li>
                    </ul>

                </nav><!-- #primary-menu end -->

                <div class="header-misc col-lg-auto order-lg-4 ms-auto ms-lg-0 justify-content-lg-end ">

                    <!-- Top Login
                    ============================================= -->
                    <div id="top-account" class="header-misc-icon px-3">
                        <a href="#"><i class="bi-people"></i></a>
                    </div><!-- #top-search end -->

                    <div id="miniCartContainer">
                       <#include "cart/miniCart.ftl" />
                    </div>
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
                         <li class="menu-item mega-menu mega-menu-small"><a class="menu-link upper" href="#"><div>Shop</div></a>
                            <div class="mega-menu-content mega-menu-style-2">
                                <div class="container">
                                    <div class="row">
                                        <ul class="sub-menu-container mega-menu-column col-lg-6">
                                            <#list navCategories as cat>
                                                <#list cat.children as sub>
                                                    <ul class="sub-menu-container">
                                                        <li class="menu-item upper"><a class="menu-link" href="<@ofbizCatalogAltUrl productCategoryId="${sub.id}"/>"><div>${sub.name}</div></a></li>
                                                    </ul>
                                                </#list>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                         </li>

                        <li class="menu-item"><a class="menu-link upper" href="<@ofbizUrl>campaign</@ofbizUrl>"><div>${SystemLabelMap.Campaign}</div></a></li>
                        <li class="menu-item"><a class="menu-link upper" href="<@ofbizUrl>stores</@ofbizUrl>"><div>${SystemLabelMap.Stores}</div></a></li>
                    </ul>

                </nav><!-- #primary-menu end -->

            </div>

        </div>

    </div>
    <div class="header-wrap-clone"></div>
</header><!-- #header end -->