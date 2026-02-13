<!-- Shop Item 8
    ============================================= -->

<#if product??>

    <#if "Y" == backendPath?default("N")>
        <#assign productUrl><@ofbizCatalogUrl productId=product.productId productCategoryId=categoryId/></#assign>
    <#else>
        <#assign productUrl><@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId/></#assign>
    </#if>

    <#assign productName = productContentWrapper.get("PRODUCT_NAME", "html") />

    <#assign blankSkuUrl><@ofbizContentUrl>/fi_it/assets${(blankSku)?trim}</@ofbizContentUrl></#assign>

    <#assign blankCropUrl><@ofbizContentUrl>/fi_it/assets${(blankCrop)?trim}</@ofbizContentUrl></#assign>

    <div class="col-lg-3 col-md-3 mb-4 sf-jeans sf-new">
        <div class="product">
            <div class="product-image">

                <a href="${productUrl}">
                    <img src="<@ofbizContentUrl>/fi_it/assets${largeImageUrl!blankSku}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}">
                </a>

                <a href="${productUrl}">
                    <img src="<@ofbizContentUrl>/fi_it/assets${productAdditionalImage2!blankSku}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}">
                </a>

                <div class="product-desc">
                    <div class="product-title">
                        <b><a href="${productUrl}">${productName!}</a></b>
                        <#--<span><a href="${productUrl}">${product.productId}</a></span>-->
                    </div>
                    <div class="product-price">

                         <#if price.specialPromoPrice??>
                            <#if price.specialPromoPrice?? && price.listPrice?? && price.specialPromoPrice?double < price.listPrice?double>
                                <del><ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins></del>
                            </#if>
                         <#else>
                            <#if price.listPrice??>
                                <ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins>
                            </#if>
                         </#if>

                         <#if price.specialPromoPrice?? && price.listPrice?? && price.specialPromoPrice?double < price.listPrice?double>
                            <ins><@ofbizCurrency amount=price.specialPromoPrice isoCode=price.currencyUsed/></ins>
                         </#if>
                    </div>
                </div>

                <div class="product-colors">
                  <#list myColors?keys as colorName>
                    <#assign colorData = myColors[colorName]>
                    <#assign pid = colorData.productId>
                    <#assign img = colorData.image>

                    <a class="color-swatch"
                       href="<@ofbizCatalogAltUrl productId=pid productCategoryId=categoryId/>"
                       title="${colorName}">
                        <img src="<@ofbizContentUrl>/fi_it/assets${img!blankCrop}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankCropUrl}';" alt="${colorName}" />
                    </a>
                  </#list>
                </div>

                <#assign count = 1/>
                <div class="product-sizes">
                    <#if mySizes?keys?size gt 0>
                      <#list mySizes?keys as size>

                        <#assign outOfStock = unavailableSizeMap[size]??/>

                        <#assign variantId = mySizes[size]>

                        <form method="post" action="<@ofbizUrl>addItem</@ofbizUrl>" name="the${requestAttributes.formNamePrefix!}${requestAttributes.listIndex!}form_${count}" style="margin: 0;">
                            <div class="form-group">
                                <input type="hidden" name="add_product_id" value="${variantId}"/>
                                <input type="hidden" name="clearSearch" value="N"/>
                                <input type="hidden" name="mainSubmitted" value="Y"/>
                                <div class="input-group">
                                    <input type="hidden" class="form-control form-control-sm" name="quantity" value="1"/>

                                        <#if !outOfStock>
                                            <a class="size-btn" style="cursor: pointer;" id="size-the${requestAttributes.formNamePrefix!}${requestAttributes.listIndex!}form_${count}">${size}</a>
                                        <#else>
                                            <a class="size-btn" style="pointer-events: none;" id="size-the${requestAttributes.formNamePrefix!}${requestAttributes.listIndex!}form_${count}"><del>${size}</del></a>
                                        </#if>
                                </div>
                            </div>
                        </form>
                        <#assign count = count +1/>
                      </#list>
                    <#else>
                         <div class="quantity mt-3 mr-5">
                             <ul class="nav nav-pills">
                                 <li class="nav-item"><a class="nav-link active" style="background-color: red;">Out of stock</a></li>
                             </ul>
                         </div>
                    </#if>
                </div>
            </div>

        </div>
    </div>

<#else>
    <div>
        ${uiLabelMap.ProductErrorProductNotFound}
    </div>
</#if>
