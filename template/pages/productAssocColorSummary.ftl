<#--
@giulio Summary screen for "special" Up-Sell Product Association.
We use the up-sell assoc. type to display the color variants for the
same productId.
-->

<#if product?exists>
    <#-- variable setup -->
    <#if backendPath?default("N") == "Y">
        <#assign productUrl><@ofbizCatalogUrl productId=product.productId productCategoryId=categoryId/></#assign>
    <#else>
        <#assign productUrl><@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId/></#assign>
    </#if>

    <#if requestAttributes.productCategoryMember?exists>
        <#assign prodCatMem = requestAttributes.productCategoryMember>
    </#if>

    <#assign colorName = productContentWrapper.get("COMMENTS", "html")! />
    <#assign colorSquareUrl = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />

    <button role="radio" class="owl-dot" data-value="${colorName}" data-color=""><img src="<@ofbizContentUrl>/fi_it/assets${colorSquareUrl}</@ofbizContentUrl>" alt="Jeans"></button>



<#else>
    &nbsp;${uiLabelMap.ProductErrorProductNotFound};
</#if>


