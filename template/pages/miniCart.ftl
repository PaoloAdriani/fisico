<#assign shoppingCart = session.getAttribute("shoppingCart")!>
<#if shoppingCart?has_content>
  <#assign shoppingCartSize = shoppingCart.size()>
<#else>
  <#assign shoppingCartSize = 0>
</#if>

<div id="top-cart">

    <#if (shoppingCartSize > 0)>

        <a href="#" id="top-cart-trigger" class="position-relative">
            <i class="bi-bag"></i>
            <span class="top-cart-number">${shoppingCart.getTotalQuantity()}</span>
        </a>

        <div class="top-cart-content">

            <div class="top-cart-title">
                <h4>Shopping Cart</h4>
            </div>

            <div class="top-cart-items">

                <#list shoppingCart.items() as cartLine>

                    <#assign product = cartLine.getParentProduct()!cartLine.getProduct()!>

                    <#assign smallImageUrl = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(product, "SMALL_IMAGE_URL", locale, dispatcher, "")!"" />

                    <div class="top-cart-item">

                        <div class="top-cart-item-image">
                            <a href="<@ofbizCatalogAltUrl productId=product.productId/>">
                                <img src="<@ofbizContentUrl>/fi_it/assets${smallImageUrl!'/images/defaultImage.png'}</@ofbizContentUrl>">
                            </a>
                        </div>

                        <div class="top-cart-item-desc">
                            <div class="top-cart-item-desc-title">
                                <a href="<@ofbizCatalogAltUrl productId=product.productId/>" class="fw-normal">${cartLine.getName(dispatcher)}</a>
                                <span class="top-cart-item-price d-block"><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></span>
                            </div>
                        </div>

                        <div class="top-cart-item-quantity fw-semibold">
                            ${cartLine.getQuantity()?string.number}
                        </div>

                    </div>
                </#list>
            </div>

            <div class="top-cart-action">

                <span class="top-checkout-price fw-semibold text-dark">Totale: <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></span>

                <a href="<@ofbizUrl>view/showCart</@ofbizUrl>" class="button button-dark button-small m-0">Vis. carrello</a>
            </div>

        </div>

    <#else>

        <a href="#" id="top-cart-trigger" class="position-relative">
            <i class="bi-bag"></i>
            <span class="top-cart-number">0</span>
        </a>

        <div class="top-cart-content">

            <div class="top-cart-title">
                <h4>Shopping Cart</h4>
            </div>

            <div class="top-cart-items">

                <p style="text-align: center;">Shopping cart is empty</p>

            </div>

            <div class="top-cart-action">

                <span class="top-checkout-price fw-semibold text-dark">Totale: <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></span>

                <a href="<@ofbizUrl>view/showCart</@ofbizUrl>" class="button button-dark button-small m-0">Show cart</a>
            </div>

        </div>
    </#if>

</div>
