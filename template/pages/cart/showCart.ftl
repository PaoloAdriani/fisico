<#include "../base.ftl"/>

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro page_body>

<!-- Content
============================================= -->
<section id="content">
    <div class="content-wrap">
	    <div class="container">

		        <#if (shoppingCartSize > 0)>
                        <table class="table cart mb-5">
                            <thead>
                                <tr>
                                    <th class="cart-product-remove">&nbsp;</th>
                                    <th class="cart-product-thumbnail">&nbsp;</th>
                                    <th class="cart-product-name upper">${SystemLabelMap.Product}</th>
                                    <th class="cart-product-price upper">${SystemLabelMap.Price}</th>
                                    <th class="cart-product-price-adjustments upper">${SystemLabelMap.Adjustments}</th>
                                    <th class="cart-product-quantity upper">${SystemLabelMap.Quantity}</th>
                                    <th class="cart-product-subtotal upper">${SystemLabelMap.Total}</th>
                                </tr>
                            </thead>
                            <tbody>
                               <form method="post" action="<@ofbizUrl>modifyCart</@ofbizUrl>" name="cartform">
                                   <input type="hidden" name="removeSelected" value="false" />
                                   <input type="hidden" name="selectedItem" value="" />

                                   <#list shoppingCart.items() as cartLine>
                                        <#assign cartLineIndex = shoppingCart.getItemIndex(cartLine) />

                                        <#if cartLine.getProductId()??>

                                            <#if cartLine.getParentProductId()??>
                                                <#assign parentProductId = cartLine.getParentProductId() />
                                            <#else>
                                                <#assign parentProductId = cartLine.getProductId() />
                                            </#if>

                                            <#assign productUrl><@ofbizCatalogAltUrl productId=cartProduct.productId/></#assign>

                                            <#assign smallImageUrl = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "SMALL_IMAGE_URL", locale, dispatcher, "html")! />

                                            <#assign productName = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "PRODUCT_NAME", locale, dispatcher, "html")! />

                                            <#assign quantity = cartLine.getQuantity() />

                                            <tr class="cart_item" id="cartItemDisplayRow_${cartLineIndex}">
                                                <td class="cart-product-remove">
                                                    <a href="#" class="remove" data-index="${cartLineIndex}"" title="Remove this item"><i class="fa-solid fa-trash"></i></a>
                                                </td>

                                                <td class="cart-product-thumbnail">
                                                    <a href="${productUrl}"><img style="min-width: 80px; height: auto;" src="<@ofbizContentUrl>/fi_it/assets${smallImageUrl}</@ofbizContentUrl>" alt="Pink Printed Dress"></a>
                                                </td>

                                                <td class="cart-product-name">
                                                    <a href="${productUrl}">${productName}</a>
                                                </td>

                                                <td class="cart-product-price">
                                                    <span class="amount"><@ofbizCurrency amount=cartLine.getDisplayPrice() isoCode=shoppingCart.getCurrency()/></span>
                                                </td>

                                                <td class="cart-product-price-adjustments">
                                                    <span class="amount"><@ofbizCurrency amount=cartLine.getOtherAdjustments() isoCode=shoppingCart.getCurrency()/></span>
                                                </td>

                                                <td class="cart-product-quantity">
                                                    <div class="quantity">
                                                        <input type="button" value="-" class="minus">
                                                        <input type="text" value="${quantity}" class="qty" name="update_${cartLineIndex}">
                                                        <input type="button" value="+" class="plus">
                                                    </div>
                                                </td>

                                                <td class="cart-product-subtotal">
                                                    <span class="amount"><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></span>
                                                </td>

                                            </tr>
                            </tbody>
                                        </#if>
                                   </#list>
                        </table>


                        <div class="row col-mb-30">

                            <div class="mb-5" style="text-align: end";>
                                <button type="submit" class="button button-small button-3d m-0 upper">${SystemLabelMap.UpdateCart}</button>
                                <a href="<@ofbizUrl>checkoutOptions</@ofbizUrl>" class="button button-small button-3d mt-2 mt-sm-0 me-0 mb-0 upper">${SystemLabelMap.ProceedToCheckout}</a>
                            </div>

                    	    <div class="col-lg-7">
                                <h4 class="upper">${SystemLabelMap.CartTotal}</h4>
                                    <div class="table-responsive">
                                        <table class="table cart cart-totals">
                                            <tbody>
                                                <tr class="cart_item">
                                                    <td class="cart-product-name upper">
                                                        <strong>${SystemLabelMap.CartSubtotal}</strong>
                                                    </td>

                                                    <td class="cart-product-name">
                                                        <span class="amount"><span class="amount"><@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></span></span>
                                                    </td>
                                                </tr>
                                                <#if shoppingCart.getAdjustments()?has_content>
                                                  <#list shoppingCart.getAdjustments() as cartAdjustment>
                                                    <#assign adjustmentType = cartAdjustment.getRelatedOne("OrderAdjustmentType", true) />
                                                    <tr class="cart_item">
                                                        <td class="cart-product-name">
                                                            <h5 class="mb-0">${SystemLabelMap.EcommerceAdjustment} - ${adjustmentType.get("description",locale)!}</h5>
                                                            <#if cartAdjustment.productPromoId?has_content>
                                                                <a href="<@ofbizUrl>showPromotionDetails?productPromoId=${cartAdjustment.productPromoId}</@ofbizUrl>">
                                                                    ${SystemLabelMap.CommonDetails}
                                                                </a>
                                                            </#if>
                                                      </th>
                                                      <td class="cart-product-name">
                                                         <span class="amount"><@ofbizCurrency amount=Static["org.apache.ofbiz.order.order.OrderReadHelper"]
                                                            .calcOrderAdjustment(cartAdjustment,
                                                            shoppingCart.getSubTotal()) isoCode=shoppingCart.getCurrency()/></span>
                                                      </td>
                                                    </tr>
                                                  </#list>
                                                </#if>
                                                <tr class="cart_item">
                                                    <td class="cart-product-name upper">
                                                        <strong>${SystemLabelMap.Total}</strong>
                                                    </td>

                                                    <td class="cart-product-name">
                                                        <span class="amount color lead"><strong><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/></strong></span>
                                                    </td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-5">
                                <div class="align-items-center">
                                  <form method="post" action="<@ofbizUrl>addPromoCode<#if requestAttributes._CURRENT_VIEW_?has_content>/${requestAttributes._CURRENT_VIEW_}</#if></@ofbizUrl>" name="addpromocodeform">
                                    <div class="input-group">
                                      <input type="text" class="form-control text-center text-md-start" name="productPromoCodeId" value="" placeholder="${SystemLabelMap.EnterCouponCode}.."/>
                                       &nbsp;&nbsp;&nbsp;
                                       <span class="input-group-btn">
                                         <input type="submit" class="button button-small button-3d button-black m-0 upper" value="${SystemLabelMap.OrderAddCode}" />
                                       </span>
                                    </div>
                                      <#assign productPromoCodeIds = (shoppingCart.getProductPromoCodesEntered())! />
                                      <#if productPromoCodeIds?has_content>
                                        ${SystemLabelMap.ApplyCodes}:
                                        <ul>
                                          <#list productPromoCodeIds as productPromoCodeId>
                                            <li>${productPromoCodeId}</li>
                                          </#list>
                                        </ul>
                                      </#if>
                                  </form>
                                </div>
                            </div>
                            <div class="mb-5" style="text-align: end";>
                                <a href="<@ofbizUrl>main</@ofbizUrl>" class="button button-small button-3d mt-2 mt-sm-0 me-0 mb-0 upper">${SystemLabelMap.BackToShopping}</a>
                            </div>

                        </div>
                <#else>
                    <div>
                        <p style="text-align: center;">${SystemLabelMap.ShoppingCartEmpty}</p>
                    </div>
                </#if>
		</div>
	</div>
</section><!-- #content end -->

</#macro>

<@display_page/>