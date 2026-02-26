<section id="slider" class="slider-element swiper_wrapper min-vh-100 include-header" data-loop="true" data-speed="1000" data-autoplay="5000">
    <div class="slider-inner">
        <div class="swiper swiper-parent">
            <div class="swiper-wrapper">
                <#--
                <div class="swiper-slide dark">
                    <a href="<@ofbizCatalogAltUrl productCategoryId="S5-004"/>" class="slide-link"></a>
                    <div class="container">
                        <div class="slider-caption">
                            <h2 data-animate="fadeInUp">${SystemLabelMap.Beachwear}</h2></a>
                        </div>
                    </div>
                    <div class="swiper-slide-bg" style="background-image: url('<@ofbizContentUrl>/fi_it/assets/images/homepage/mobile/beachwear_mobile_20022026.jpg</@ofbizContentUrl>');"></div>
                </div>
                -->
                <div class="swiper-slide dark">
                                    <a href="<@ofbizCatalogAltUrl productCategoryId="S5-004"/>" class="slide-link"></a>
                                    <div class="container">
                                        <div class="slider-caption">
                                            <h2 data-animate="fadeInUp" style="text-transform: uppercase;">${SystemLabelMap.Beachwear}</h2>
                                        </div>
                                    </div>
                                    <picture class="swiper-slide-bg">
                                        <source media="(max-width: 768px)"
                                                srcset="<@ofbizContentUrl>/fi_it/assets/images/homepage/mobile/beachwear_mobile_20022026.jpg</@ofbizContentUrl>">
                                        <source media="(min-width: 769px)"
                                                srcset="<@ofbizContentUrl>/fi_it/assets/images/homepage/beachwear_18022026.jpg</@ofbizContentUrl>">
                                        <img src="<@ofbizContentUrl>/fi_it/assets/images/homepage/beachwear_18022026.jpg</@ofbizContentUrl>" alt="Slider" style="width: 100%; height: 100%; object-fit: cover;">
                                    </picture>
                                </div>
            </div>
        </div>
    </div>
</section>