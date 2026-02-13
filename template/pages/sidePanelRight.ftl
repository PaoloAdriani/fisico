<#assign shoppingCart = sessionAttributes.shoppingCart!>
<#if shoppingCart?has_content>
    <#assign shoppingCartSize = shoppingCart.size()>
<#else>
    <#assign shoppingCartSize = 0>
</#if>

<#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
    <#assign shoppingLists = Static["org.apache.ofbiz.order.shoppinglist.ShoppingListWorker"]
        .getShoppingLists(dispatcher, sessionAttributes.userLogin.userLoginId, false)!>
</#if>


<div class="body-overlay"></div>
<div id="side-panel">
  <div id="side-panel-trigger-close" class="side-panel-trigger"><a href="#"><i class="bi-x-lg"></i></a></div>
  <div class="side-panel-wrap">
    <div class="widget">
      <#if (shoppingCartSize> 0)>
        <form method="post" action="<@ofbizUrl>modifycart</@ofbizUrl>" name="cartform">
          <input type="hidden" name="removeSelected" value="false" />
          <table class="table  table-responsive-sm">
            <tbody>
              <#assign itemsFromList=false />
              <#assign promoItems=false />
              <#list shoppingCart.items() as cartLine>
                <#assign cartLineIndex=shoppingCart.getItemIndex(cartLine) />
                <#assign lineOptionalFeatures=cartLine.getOptionalProductFeatures() />
                <tr id="cartItemDisplayRow_${cartLineIndex}">
                  <td>
                    <#if cartLine.getShoppingListId()??>
                      <#assign itemsFromList=true />
                        <a href="<@ofbizUrl>editShoppingList?shoppingListId=${cartLine.getShoppingListId()}</@ofbizUrl>">L</a>&nbsp;&nbsp;
                      <#elseif cartLine.getIsPromo()>
                        <#assign promoItems=true />
                        <span class="badge badge-success">P</span>
                        <#else>
                          &nbsp;
                    </#if>
                  </td>
                  <td>
                    <div class="media">
                      <#if cartLine.getProductId()??>
                        <#-- product item -->
                          <#-- start code to display a small image of the product -->
                            <#if cartLine.getParentProductId()??>
                              <#assign parentProductId=cartLine.getParentProductId() />
                              <#else>
                                <#assign parentProductId=cartLine.getProductId() />
                            </#if>
                            <#assign smallImageUrl=Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "SMALL_IMAGE_URL" , locale, dispatcher, "html" )! />
                            <#if !smallImageUrl?string?has_content>
                              <#assign smallImageUrl="/images/defaultImage.jpg" />
                            </#if>
                            <#if smallImageUrl?string?has_content>
                              <a href="<@ofbizCatalogAltUrl productId=parentProductId/>">
                                <img src="<@ofbizContentUrl>${requestAttributes.contentPathPrefix!}${smallImageUrl}</@ofbizContentUrl>" alt="Product Image" class="cart-image mr-3" />
                              </a>
                            </#if>
                          <#-- end code to display a small image of the product -->
                              <#-- ${cartLineIndex} - -->
                                <div class="media-body">
                                  <h4 class="mt-0">
                                    <a href="<@ofbizCatalogAltUrl productId=parentProductId/>">${cartLine.getProductId()} - ${cartLine.getName(dispatcher)!}</a> 
                                  </h4>
                                  ${cartLine.getDescription(dispatcher)!}
                                  <#-- For configurable products, the selected options are shown -->
                                    <#if cartLine.getConfigWrapper()??>
                                      <#assign selectedOptions=cartLine.getConfigWrapper().getSelectedOptions()! />
                                      <#if selectedOptions??>
                                        <div>&nbsp;</div>
                                        <#list selectedOptions as option>
                                          <div>
                                            ${option.getDescription()}
                                          </div>
                                        </#list>
                                      </#if>
                                    </#if>
                                    <#-- if inventory is not required check to see if it is out
                                      of stock and needs to have a message shown about that... -->
                                      <#assign itemProduct=cartLine.getProduct() />
                                      <#assign isStoreInventoryNotRequiredAndNotAvailable=Static["org.apache.ofbiz.product.store.ProductStoreWorker"].isStoreInventoryRequiredAndAvailable(request, itemProduct,cartLine.getQuantity(), false, false) />
                                      <#if isStoreInventoryNotRequiredAndNotAvailable && itemProduct.inventoryMessage?has_content>
                                        (${itemProduct.inventoryMessage})
                                      </#if>
                                      <#else>
                                        <#-- this is a non-product item -->
                                          ${cartLine.getItemTypeDescription()!}: ${cartLine.getName(dispatcher)!}
                      </#if><#-- end product item -->
                                </div><#-- end media-body -->  
                    </div><#-- end media -->  
                  </td>  
                  <td>
                    <#if cartLine.getIsPromo() || cartLine.getShoppingListId()??>
                      ${cartLine.getQuantity()?string.number}
                    <#else>
                      <#-- Is Promo or Shoppinglist -->
                      <input class="inputBox form-control" type="number" name="update_${cartLineIndex}" value="${cartLine.getQuantity()?string.number}" min="1" />
                    </#if>
                  </td>
                  <td class="amount">
                    <@ofbizCurrency amount=cartLine.getDisplayPrice() isoCode=shoppingCart.getCurrency() />
                  </td>
                  <td class="amount">
                    <@ofbizCurrency amount=cartLine.getOtherAdjustments() isoCode=shoppingCart.getCurrency() />
                  </td>
                  <td class="amount">
                    <@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency() />
                  </td>
                  <td>
                    <#if !cartLine.getIsPromo()>
                      <input type="checkbox" name="selectedItem" value="${cartLineIndex}" class="selectAllChild" />
                    <#else>
                      &nbsp;
                    </#if>
                  </td>
                </tr><#-- end cart item row -->
              </#list>
            </tbody>
            <tfoot>
              <tr class="thead-light">
                <th colspan="8">
                  ${uiLabelMap.CommonSummary}:
                </th>
              </tr>
              <#if shoppingCart.getAdjustments()?has_content>
                <tr>
                  <th colspan="6">
                    ${uiLabelMap.CommonSubTotal}:</th>
                  <td class="amount" colspan="1">
                    <@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency() />
                  </td>
                </tr>
              
                <#list shoppingCart.getAdjustments() as cartAdjustment>
                  <#assign adjustmentType=cartAdjustment.getRelatedOne("OrderAdjustmentType", true) />
                  <tr>
                    <th colspan="6">
                      ${uiLabelMap.EcommerceAdjustment} - ${adjustmentType.get("description",locale)!}
                      <#if cartAdjustment.productPromoId?has_content>
                        <a href="<@ofbizUrl>showPromotionDetails?productPromoId=${cartAdjustment.productPromoId}</@ofbizUrl>">
                          ${uiLabelMap.CommonDetails}
                        </a>
                      </#if>:
                    </th>
                    <td class="amount" colspan="1">
                      <@ofbizCurrency amount=Static["org.apache.ofbiz.order.order.OrderReadHelper"]
                        .calcOrderAdjustment(cartAdjustment,
                        shoppingCart.getSubTotal()) isoCode=shoppingCart.getCurrency() />
                    </td>
                  </tr>
                </#list>
              </#if>
              <tr>
                <th colspan="6">
                  ${uiLabelMap.EcommerceCartTotal}:</th>
                <td class="amount" colspan="1">
                  <@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency() />
                </td>
              </tr>
              <#if itemsFromList>
                <tr>
                  <td colspan="8">L - ${uiLabelMap.EcommerceItemsfromShopingList}.</td>
                </tr>
              </#if>
              <#if promoItems>
                <tr>
                  <td colspan="8"><span class="badge badge-success">P</span> - ${uiLabelMap.EcommercePromotionalItems}.</td>
                </tr>
              </#if>
              <#if !itemsFromList && !promoItems>
                <tr>
                  <td colspan="8">&nbsp;</td>
                </tr>
              </#if>
              <tr>
                <td colspan="8">
                  <#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId !="anonymous">
                    <div class="input-group">
                      <select class="form-control selectBox" name="shoppingListId">
                        <#if shoppingLists?has_content>
                          <#list shoppingLists as shoppingList>
                            <option value="${shoppingList.shoppingListId}">
                              ${shoppingList.listName}
                            </option>
                          </#list>
                        </#if>
                        <option value="">---</option>
                        <option value="">
                          ${uiLabelMap.OrderNewShoppingList}
                        </option>
                      </select>
                      <span class="input-group-btn">
                        <a href="javascript:addToList();" class="btn btn-outline-secondary">
                          ${uiLabelMap.EcommerceAddSelectedtoList}
                        </a>
                      </span>
                    </div>
                    <#else>
                      ${uiLabelMap.OrderYouMust}
                      <a href="<@ofbizUrl>checkLogin/showcart</@ofbizUrl>" class="btn btn-outline-secondary btn-sm">
                        ${uiLabelMap.CommonBeLogged}
                      </a>
                      ${uiLabelMap.OrderToAddSelectedItemsToShoppingList}.&nbsp;
                  </#if>
                </td>
              </tr>
              <tr>
                <td colspan="8">
                  <#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId !="anonymous">
                    <a href="<@ofbizUrl>createCustRequestFromCart</@ofbizUrl>" class="btn btn-outline-secondary btn-sm">
                      ${uiLabelMap.OrderCreateCustRequestFromCart}
                    </a>
                    <#else>
                      ${uiLabelMap.OrderYouMust}
                      <a href="<@ofbizUrl>checkLogin/showcart</@ofbizUrl>" class="btn btn-outline-secondary btn-sm">
                        ${uiLabelMap.CommonBeLogged}
                      </a>
                      ${uiLabelMap.EcommerceToOrderCreateCustRequestFromCart}.&nbsp;
                  </#if>
                </td>
              </tr>
              <tr>
                <td colspan="8">
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input" onclick="javascript:document.cartform.submit()"
                      name="alwaysShowcart" <#if shoppingCart.viewCartOnAdd()>checked="checked"</#if>/>
                    <label>
                      ${uiLabelMap.EcommerceAlwaysViewCartAfterAddingAnItem}.</label>
                  </div>
                </td>
              </tr>
            </tfoot>
          </table>
        </form>
      <#else>
        <h3>
          ${uiLabelMap.EcommerceYourShoppingCartEmpty}.
        </h3>
      </#if>
  </div>
  </div>
</div>
</div>