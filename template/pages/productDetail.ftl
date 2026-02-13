<#include "base.ftl"/>

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>


<#macro add_page_head_before_head_tag>

     <style type="text/css">

            .color-dots {
              display:flex;
              gap:10px;
            }

            .color-dot img{
              width:28px;
              height:28px;
              border-radius:50%;
              border:2px solid #ddd;
            }

            .color-dot.active img{
              border:2px solid #000;
            }

            .product-colors {
                      height: 20px;
                      display: flex;
                      flex-direction: row;
                      justify-content: center;
                      gap: 10px;
                      margin-bottom: 15px;
                      margin-top: 2px;
                    }

                    .color-swatch img {
                      width: 45px;
                      height: 20px;
                      border-radius: 50%;
                      border: 2px solid #ddd;
                      transition: 0.2s;
                      cursor: pointer;
                    }

                    .color-swatch img:hover {
                      border-color: #000;
                      transform: scale(1.08);
                    }

             .product-sizes {
                      display: flex;
                      justify-content: center;
                      gap: 8px;
                    }

                    .size-btn {
                      padding: 1px 5px;
                      border: 1px solid #ccc;
                      text-decoration: none;
                      color: #333;
                      transition: 0.2s;
                    }

                    .size-btn:hover {
                      background: #000;
                      color: #fff;
                    }

                    .product .color-swatch img,
                    .product .color-dot img {
                        width: 20px !important;
                        height: 20px !important;
                        object-fit: cover;
                    }



     </style>

</#macro>


<#assign currentPageProduct = product />

<#-- Upgrades/Up-Sell/Cross-Sell -->
<#macro associated assocProducts beforeName showName afterName formNamePrefix targetRequestName>
    <#local pageProduct = currentPageProduct />

    <#assign listIndex = 0/>
    <#local targetRequest = "product" />
    <#if targetRequestName?has_content>
        <#local targetRequest = targetRequestName />
    </#if>
    <#if assocProducts?has_content>
        <#list assocProducts as productAssoc>
            <#if productAssoc.productId == product.productId>
              <#local assocProductId = productAssoc.productIdTo />
            <#else>
              <#local assocProductId = productAssoc.productId />
            </#if>
            <#if productAssoc.reason?has_content>
              ${setRequestAttribute("highlightLabel", productAssoc.reason)}
            </#if>
            ${setRequestAttribute("optProductId", assocProductId)}
            ${setRequestAttribute("listIndex", listIndex)}
            ${setRequestAttribute("formNamePrefix", formNamePrefix)}
            <#if targetRequestName?has_content>
                ${setRequestAttribute("targetRequestName", targetRequestName)}
            </#if>
            ${screens.render(productsummaryScreen)}
            <#local product = pageProduct />
            <#local listIndex = listIndex + 1 />

        </#list>

        ${setRequestAttribute("optProductId", "")}
        ${setRequestAttribute("formNamePrefix", "")}
        ${setRequestAttribute("targetRequestName", "")}

    </#if>
</#macro>


<#macro showUnavailableVarients>
  <#if unavailableVariants??>
    <ul>
      <#list unavailableVariants as prod>
        <#assign features = prod.getRelated("ProductFeatureAppl", null, null, false)/>
        <li>
          <#list features as feature>
            <em>${feature.getRelatedOne("ProductFeature", false).description}</em><#if feature_has_next>, </#if>
          </#list>
          <span>${uiLabelMap.ProductItemOutOfStock}</span>
        </li>
      </#list>
    </ul>
  </#if>
</#macro>


<#assign price = priceMap! />


<#macro page_body>

<!-- Page Title
============================================= -->

<#assign img1Url><@ofbizContentUrl>/fi_it/assets${(largeImageUrl!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img2Url><@ofbizContentUrl>/fi_it/assets${(productAdditionalImage2!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img3Url><@ofbizContentUrl>/fi_it/assets${(productAdditionalImage3!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign img4Url><@ofbizContentUrl>/fi_it/assets${(productAdditionalImage4!blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign blankSkuUrl><@ofbizContentUrl>/fi_it/assets${(blankSku)?trim}</@ofbizContentUrl></#assign>

<#assign blankCropUrl><@ofbizContentUrl>/fi_it/assets${(blankCrop)?trim}</@ofbizContentUrl></#assign>

<#assign productName = productContentWrapper.get("PRODUCT_NAME", "html") />

<section id="content">
    <div class="content-wrap">
	    <div class="container">
			<div class="single-product">
				<div class="product">
					<div class="row gutter-40">
                        <div class="col-md-7">

                            <!-- Product Single - Gallery
                            ============================================= -->
                            <div class="product-image">
                                <div class="fslider" data-arrows="false" data-thumbs="true" data-pagi="false" data-slideshow="false" data-animation="slide">
                                    <div class="flexslider">
                                        <div class="slider-wrap" data-lightbox="gallery">
                                            <div class="slide" data-thumb="${img1Url}"><a href="${img1Url}"  data-lightbox="gallery-item"><img src="${img1Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img2Url}"><a href="${img2Url}"  data-lightbox="gallery-item"><img src="${img2Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img3Url}"><a href="${img3Url}"  data-lightbox="gallery-item"><img src="${img3Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                            <div class="slide" data-thumb="${img4Url}"><a href="${img4Url}"  data-lightbox="gallery-item"><img src="${img4Url}" onerror="this.onerror=null;this.src='${blankSkuUrl}';" alt="${productName}"></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- Product Single - Gallery End -->
                        </div><!-- end class col-md-7-->

                        <div class="col-xl-5 col-lg-7 mb-0">

                            <!-- Product Single - Short Description
                            ============================================= -->
                            <strong><p>${productName}</p></strong>

                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <!-- Product Single - Price
                                ============================================= -->

                                <div class="product-price">
                                     <#if price.specialPromoPrice??>
                                        <#if price.specialPromoPrice?? && price.listPrice?? && price.specialPromoPrice?double < price.listPrice?double>
                                            <div>${uiLabelMap.ProductListPrice}:&nbsp;<del><ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins></del></div>
                                        </#if>
                                     <#else>
                                        <#if price.listPrice??>
                                            <div>${uiLabelMap.ProductListPrice}:&nbsp;<ins><@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed/></ins></div>
                                        </#if>
                                     </#if>

                                    <#if price.specialPromoPrice??>
                                        <div>${uiLabelMap.ProductSpecialPromoPrice}:&nbsp;
                                            <ins><@ofbizCurrency amount=price.specialPromoPrice isoCode=price.currencyUsed /></ins>
                                        </div>
                                    </#if>
                                </div><!-- Product Single - Price End -->
                            </div>

                            <p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
                            <p>${productContentWrapper.get("INGREDIENTS", "html")!}</p>
                            <p>${product.productId!}</p>

                            <div class="toggle mt-3 mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title">
                                        Cura del prodotto
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p><b>SCIACQUATELI SEMPRE DOPO L’USO</b></p>
                                    <p>Immergere il costume in acqua fredda, strizzatelo bene e rimuovete tutto il sale e il cloro, perché altrimenti, con il tempo, il tessuto si scolorisce.</p>

                                    <p><b>LAVATELO IN ACQUA FREDDA</b></p>
                                    <p>L’acqua molto calda danneggia il tessuto e può causare sbiadimento e stiramento. Il lavaggio in acqua fredda è il migliore per mantenere il colore. E’ consigliato lavarli sempre a mano. Non metteteli mai in asciugatrice!

                                    <p><b>ASCIUGATELI SENZA ESPORLI ALLA LUCE DEL SOLE PER MOLTE ORE</b></p>
                                    <p>Se li esponete al sole per troppe ore, i vostri costumi finiranno per bruciarsi. Metteteli ad asciugare in un luogo dove non ricevono la luce diretta del sole, soprattutto nelle ore più calde della giornata. In questo modo eviterete che gli elastici si brucino e che il colore perda intensità.</p>

                                    <p><b>NON CONSERVARE MAI IN UN SACCHETTO DI PLASTICA, SOPRATTUTTO SE BAGNATO</b></p>
                                    <p>Se non volete che il vostro costume abbia un odore di muffa, conservatelo in un sacchetto completamente asciutto, preferibilmente di tessuto.</p>

                                    <p><b>QUANDO L’ESTATE E’ FINITA, CONSERVATELO IN UNA BORSA DI STOFFA PER L’ANNO PROSSIMO</b></p>
                                    <p>Alla fine della stagione, prima di riporre i costumi, lavateli senza ammorbidente. Lasciateli asciugare accuratamente e riponeteli in un sacchetto di tessuto.  Riponeteli se possibile, singolarmente per evitare che i tessuti si attacchino l’uno all’altro, soprattutto se si vive in una zona calda.</p>
                               	</div>
                            </div>

                            <div class="toggle mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title">
                                        Spedizioni e resi
                                    </div>
                                </div>
                                <div class="toggle-content toggle-content-padding">
                                    <p><b>Spedizione gratuita per ordini superiori a 150€ in Italia ed Europa - Diritto di reso entro 15 giorni lavorativi.</b></p>
                                    <p>Italia: Spedizione 5€. Consegna stimata in 5 giorni lavorativi (7 giorni lavorativi per isole e zone remote).</p>
                                    <p>Europa (22 Paesi eurozona): Spedizione 9€. Consegna stimata in 5 giorni lavorativi.</p>
                                </div>
                            </div>

                            <div class="toggle mb-3">
                                <div class="toggle-header">
                                    <div class="toggle-icon">
                                        <i class="toggle-closed uil uil-plus"></i>
                                        <i class="toggle-open uil uil-minus"></i>
                                    </div>
                                    <div class="toggle-title">
                                        Info
                                    </div>
                                </div>
                               	<div class="toggle-content toggle-content-padding">
                                    <p>La modella indossa una taglia small</p>
                       	        </div>
                            </div>

                            <div class="line my-3"></div>


                            <h5 class="fw-medium mb-3">Select Color:<span class="product-color-value ms-1 fw-semibold"></span></h5>
                            <div id="color-dots">
                                <#assign colorImg = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />
                                <#assign colorName = productContentWrapper.get("COMMENTS", "html")! />

                                <a href="<@ofbizCatalogAltUrl productId=product.productId productCategoryId=categoryId! />"
                                   class="color-dot active"
                                   title="${colorName}">
                                   <img src="<@ofbizContentUrl>/fi_it/assets${colorImg!blankCrop}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankCropUrl}';"/>
                                </a>

                                <#list upSellProducts as upSell>
                                    <#assign prodIdTo = delegator.findOne("Product", {"productId": upSell.productIdTo}, false)>
                                    <#assign pcw = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].makeProductContentWrapper(prodIdTo, request) />

                                    <#assign colorImg = pcw.get("ADDITIONAL_IMAGE_1", "url")! />
                                    <#assign colorName = pcw.get("COMMENTS", "html")! />

                                    <#assign url>
                                        <@ofbizCatalogAltUrl productId=prodIdTo.productId productCategoryId=categoryId! />
                                    </#assign>

                                    <a href="${url}"
                                       class="color-dot" data-bs-toggle="tooltip" data-bs-placement="bottom" title="${colorName}"
                                       title="${colorName}">
                                       <img src="<@ofbizContentUrl>/fi_it/assets${colorImg!blankCrop}</@ofbizContentUrl>" onerror="this.onerror=null;this.src='${blankCropUrl}';"/>
                                    </a>

                                </#list>
                            </div>

                            <div id="addItemForm">
                                <form method="post" action="<@ofbizUrl>addItem</@ofbizUrl>" name="addform" style="margin: 0;">
                                    <#assign inStock = true />

                                    <#-- Variant Selection -->
                                    <#if "Y" == product.isVirtual!?upper_case>
                                        <#if !product.virtualVariantMethodEnum?? || "VV_VARIANTTREE" == product.virtualVariantMethodEnum>
                                            <#if variantTree?? && (variantTree.size() &gt; 0)>
                                                <div class="col-sm-6 mt-5">
                                                    <h5 class="fw-medium mb-3">Select Size:</h5>
                                                        <div role="group">
                                                            <#if sizeProductFeatureAndAppls?has_content>
                                                                <div>
                                                                    <#list sizeProductFeatureAndAppls as sizeProductFeatureAndAppl>
                                                                        <#assign sizeId = sizeProductFeatureAndAppl.productFeatureId>
                                                                        <#assign prodVars = variantTree[sizeId]![]>
                                                                        <#if prodVars?? && prodVars?size gt 0>
                                                                            <#assign prodVar = prodVars[0]/>
                                                                            <input class="btn-check" type="radio" name="bag-size" id="bag-size-${sizeProductFeatureAndAppl.productFeatureId}" autocomplete="off" value="${sizeProductFeatureAndAppl.productFeatureId}" data-product-variant="${prodVar}">
                                                                            <label for="bag-size-${sizeProductFeatureAndAppl.productFeatureId}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none">${sizeId}</label>
                                                                            &nbsp;
                                                                        <#else>
                                                                            <#if unavailableVariants??>
                                                                                <#list unavailableVariants as prod>
                                                                                    <#assign features = prod.getRelated("ProductFeatureAppl", null, null, false)/>
                                                                                    <#list features as feature>
                                                                                        <#assign featureSize = feature.getRelatedOne("ProductFeature", false).description>
                                                                                        <#if sizeId == featureSize>
                                                                                            <input class="btn-check" type="radio" name="bag-size" id="bag-size-${featureSize}" autocomplete="off" value="${featureSize}" data-productVariant="${prod.productId}">
                                                                                            <label for="bag-size-${featureSize}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none disabled" disabled="disabled"><del>${featureSize}</del></label>
                                                                                            &nbsp;
                                                                                        </#if>
                                                                                    </#list>
                                                                                </#list>
                                                                            </#if>
                                                                        </#if>
                                                                    </#list>
                                                                </div>
                                                            </#if>
                                                        </div>
                                                    </div><#-- end Select Size -->

                                                    <div class="col-sm-6 mt-5">
                                                        <!-- Button trigger modal -->
                                                    	<!-- Centered modal -->
                                                        <a class="btn btn-dark me-2" data-bs-toggle="modal" data-bs-target=".bs-example-modal-centered">Guida alle taglie</a>

                                                        <div class="modal fade text-start bs-example-modal-centered" tabindex="-1" role="dialog" aria-labelledby="centerModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">

                                                                        <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal" aria-hidden="true"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <img src="<@ofbizContentUrl>/fi_it/assets/images/tabella-taglie_ITA.jpg</@ofbizContentUrl>"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="alert alert-warning">
                                                        <i class="bi-exclamation-diamond-fill"></i><strong>Attenzione: </strong> Selezionare una taglia.
                                                    </div>

                                                    <input type="hidden" name="product_id" value="${product.productId}"/>
                                                    <input type="hidden" name="add_product_id" id="add_product_id" value="NULL"/>

                                            <#else>
                                                    <div class="col-sm-6 mt-3">
                                                        <h5 class="fw-medium mb-3">Select Size:</h5>
                                                        <#if unavailableVariants??>
                                                            <#list unavailableVariants as prod>
                                                                <#assign features = prod.getRelated("ProductFeatureAndAppl", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("productFeatureTypeId","SIZE"), null, false)/>
                                                                <#list features as feature>
                                                                    <#assign featureSize = feature.getRelatedOne("ProductFeature", false).description>
                                                                    <input class="btn-check" type="radio" name="bag-size" id="bag-size-${featureSize}" autocomplete="off" value="${featureSize}" data-productVariant="${prod.productId}">
                                                                    <label for="bag-size-${featureSize}" class="btn btn-sm btn-outline-secondary fw-normal ls-0 text-transform-none disabled" disabled="disabled"><del>${featureSize}</del></label>
                                                                    &nbsp;
                                                                </#list>
                                                            </#list>
                                                        </#if>
                                                    </div>

                                                    <div class="col-sm-6 mt-5">
                                                        <!-- Button trigger modal -->
                                                        <!-- Centered modal -->
                                                        <a class="btn btn-dark me-2" data-bs-toggle="modal" data-bs-target=".bs-example-modal-centered">Guida alle taglie</a>

                                                        <div class="modal fade text-start bs-example-modal-centered" tabindex="-1" role="dialog" aria-labelledby="centerModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">

                                                                        <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal" aria-hidden="true"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <img src="<@ofbizContentUrl>/fi_it/assets/images/sizeguide_desk_it.jpg</@ofbizContentUrl>"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="quantity mt-3">
                                                        <input type="button" value="-" class="minus">
                                                        <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="qty" disabled="disabled">
                                                        <input type="button" value="+" class="plus">
                                                    </div>

                                                    <a name="addToCartDisabled" class="add-to-cart button m-0" disabled="disabled">${uiLabelMap.OrderAddToCart}</a>

                                                    <div class="quantity mt-3 mr-5">
                                                        <a name="addToCartDisabled" class="add-to-cart button m-0" style="background-color: red;" disabled="disabled">Out of stock</a>
                                                    </div>

                                                    <#assign inStock = false />
                                            </#if><#-- end variantTree?? && (variantTree.size() &gt; 0 -->
                                        </#if><#-- end !product.virtualVariantMethodEnum?? || "VV_VARIANTTREE" == product.virtualVariantMethodEnum -->
                                    </#if><#-- end "Y" == product.isVirtual!?upper_case -->
                            </div><#-- end id="addItemForm" -->

                            <#-- check to see if the product requires inventory check and has inventory -->
                            <#if product.virtualVariantMethodEnum! != "VV_FEATURETREE">
                                <#if inStock>
                                    <#if "ASSET_USAGE" == product.productTypeId! || "ASSET_USAGE_OUT_IN" == product.productTypeId!>

                                    <#else>

                                        <div class="form-group mt-5">
                                            <label>${uiLabelMap.CommonQuantity}:</label>
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <div class="quantity">
                                                        <input type="button" value="-" class="minus">
                                                        <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="qty">
                                                        <input type="button" value="+" class="plus">
                                                    </div>
                                                    <a href="javascript:addItem()" id="addToCart" name="addToCart" class="add-to-cart button m-0">${uiLabelMap.OrderAddToCart}</a>
                                                </span>
                                            </div>
                                        </div>

                                    </#if>
                                <#else>
                                    <#if productStore??>
                                        <#if productStore.requireInventory?? && "N" == productStore.requireInventory>
                                            <div class="input-group">
                                                <input name="quantity" class="form-control" id="quantity" value="1" size="4" maxLength="4" type="text"
                                                    <#if "Y" == product.isVirtual!?upper_case>disabled="disabled"</#if>/>
                                                        <a href="javascript:addItem()" id="addToCart" name="addToCart" class="btn btn-outline-secondary">${uiLabelMap.OrderAddToCart}</a>
                                            </div>
                                            <@showUnavailableVarients/>
                                        <#else>
                                            <#--
                                            <div class="input-group">
                                                <input name="quantity" class="form-control" id="quantity" value="1" size="4" maxLength="4" type="text" disabled="disabled"/>
                                                    <a href="javascript:void(0);" disabled="disabled" class="btn btn-outline-secondary">
                                                        ${uiLabelMap.OrderAddToCart}
                                                    </a>
                                            </div>
                                            <br/>
                                            <span>${uiLabelMap.ProductItemOutOfStock}<#if product.inventoryMessage??>&mdash; ${product.inventoryMessage}</#if></span>
                                            -->
                                        </#if>
                                    </#if>
                                </#if><#-- end inStock -->
                            </#if><#-- end if product.virtualVariantMethodEnum! != "VV_FEATURETREE -->
                                </form>

                                <#if alsoBoughtProducts?? && alsoBoughtProducts.size() gt 0>
                                    <div class="section mb-0">
                                        <div class="container mw-md text-center">
                                            <h4>Similar Products</h4>
                                                <div class="row justify-content-center gutter-1">
                                                    <#-- cross sell -->
                                                    <@associated assocProducts=alsoBoughtProducts beforeName="" showName="N" afterName="${uiLabelMap.ProductCrossSell}"
                                                    formNamePrefix="alsob" targetRequestName="alsobought" />
                                                </div>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#assign product = currentPageProduct />

    <#if crossSellProducts?? && crossSellProducts.size() gt 0>
        <div class="section mb-0">
            <div class="container mw-md text-center">
                <h4>Similar Products</h4>
                <div class="row justify-content-center gutter-1">
                     <#-- cross sell -->
                        <@associated assocProducts=crossSellProducts beforeName="" showName="N" afterName="${uiLabelMap.ProductCrossSell}"
                            formNamePrefix="cssl" targetRequestName="crosssell" />
                </div>
            </div>
        </div>
    </#if>

</section>

</#macro>

<@display_page/>