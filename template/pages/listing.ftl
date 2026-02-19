<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro add_page_head_before_head_tag>

    <style type="text/css">

        .canvas-pagination {
          display: flex;
          align-items: center;
          gap: 14px;
          font-size: 14px;
        }

        .canvas-page-select {
          min-width: 120px;
          height: 36px;
        }

        .canvas-pagination-info {
          white-space: nowrap;
          font-size: 13px;
          color: #555;
        }

        .canvas-pagination-info strong {
          font-size: 14px;
          font-weight: 600;
        }

        .canvas-page-btn {
          padding: 6px 10px;
          font-size: 13px;
          text-decoration: none;
          border: 1px solid #ddd;
          background: #fff;
          color: #000;
        }

        .canvas-page-btn:hover {
          background: #f5f5f5;
        }

        .canvas-page-btn.disabled {
          opacity: 0.4;
          pointer-events: none;
        }

        body {
          transition: opacity .15s ease;
        }

        @media (max-width: 768px) {
          .canvas-pagination {
            flex-direction: column;
            align-items: stretch;
            gap: 10px;
          }

          .canvas-page-select {
            width: 100%;
          }

          .canvas-pagination-info {
            text-align: center;
          }

          .canvas-page-btn {
            width: 100%;
            text-align: center;
          }
        }

        .pagination-container {
          position: sticky;
          bottom: 0;
          background: #fff;
          padding: 12px 0;
          border-top: 1px solid #eee;
          z-index: 10;
        }

        /*
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
        */

        /* Overlay contenente colori e taglie */
        .product-overlay-variants {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(255, 255, 255, 0.95);
            padding: 15px 10px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
            pointer-events: none;
            z-index: 5;
        }

        .product-image:hover .product-overlay-variants {
            opacity: 1;
            transform: translateY(0);
            pointer-events: auto;
        }

        /* Assicura che il contenitore abbia spazio per l'overlay */
        .product-image {
            position: relative;
            overflow: visible;
            padding-bottom: 10px;
        }

        /* Stili per colori nell'overlay */
        .product-overlay-variants .product-colors {
            height: auto;
            display: flex;
            flex-direction: row;
            justify-content: center;
            gap: 8px;
            margin-bottom: 10px;
        }

        .product-overlay-variants .color-swatch img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid #ddd;
            transition: 0.2s;
            cursor: pointer;
        }

        .product-overlay-variants .color-swatch img:hover {
            border-color: #000;
            transform: scale(1.1);
        }

        /* Stili per taglie nell'overlay */
        .product-overlay-variants .product-sizes {
            display: flex;
            justify-content: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .product-overlay-variants .size-btn {
            padding: 4px 8px;
            border: 1px solid #ccc;
            text-decoration: none;
            color: #333;
            transition: 0.2s;
            font-size: 12px;
            background: #fff;
        }

        .product-overlay-variants .size-btn:hover {
            background: #000;
            color: #fff;
            border-color: #000;
        }



    </style>

</#macro>

<#macro paginationControlsNoAjax>
  <#local viewIndexMax = Static["java.lang.Math"]
      .ceil((listSize)?double / viewSize?double) />

  <#if viewIndexMax?int gt 1>
    <div class="row justify-content-end">
      <div class="col-auto">
        <div class="canvas-pagination">

          <!-- SELECT PAGINA -->
          <select class="canvas-page-select"
                  onchange="location.href='?viewIndex=' + this.value + '&viewSize=${viewSize}'">
            <#list 0..viewIndexMax-1 as i>
              <option value="${i}" <#if i == viewIndex>selected</#if>>
                ${uiLabelMap.CommonPage} ${i + 1}
              </option>
            </#list>
          </select>

          <!-- INFO RANGE -->
          <span class="canvas-pagination-info">
            <strong>${lowIndex}–${highIndex}</strong>
            <span class="text-muted">
              ${uiLabelMap.CommonOf} ${listSize}
            </span>
          </span>

          <!-- PREV -->
          <#if viewIndex?int gt 0>
            <a class="canvas-page-btn"
               href="?viewIndex=${viewIndex-1}&viewSize=${viewSize}">
              ${uiLabelMap.CommonPrevious}
            </a>
          <#else>
            <span class="canvas-page-btn disabled">
              ${uiLabelMap.CommonPrevious}
            </span>
          </#if>

          <!-- NEXT -->
          <#if highIndex?int lt listSize?int>
            <a class="canvas-page-btn"
               href="?viewIndex=${viewIndex+1}&viewSize=${viewSize}">
              ${uiLabelMap.CommonNext}
            </a>
          <#else>
            <span class="canvas-page-btn disabled">
              ${uiLabelMap.CommonNext}
            </span>
          </#if>

        </div>
      </div>
    </div>
  </#if>
</#macro>

<#macro page_body>

<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap pb-0">
			    <div class="container-fluid mt-5">
                    <div class="row">
                        <div class="col-md-12 portfolio-container">

                                <div id="portfolio" class="row shop grid-container" data-layout="fitRows">
                                    <#if productCategoryMembers?has_content>
                                        <#list productCategoryMembers as productCategoryMember>
                                            ${setRequestAttribute("optProductId", productCategoryMember.productId)}
                                            ${setRequestAttribute("productCategoryMember", productCategoryMember)}
                                            ${setRequestAttribute("listIndex", productCategoryMember_index)}
                                            ${screens.render(productsummaryScreen)}
                                        </#list>
                                    <#else>
                                        <hr />
                                        <div>
                                            ${uiLabelMap.ProductNoProductsInThisCategory}
                                        </div>
                                    </#if>
                                </div>


                            <div class="pagination-container mt-5">
                                <@paginationControlsNoAjax />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- #content end -->

</#macro>

<#macro js_script_after_footer>



</#macro>

<@display_page/>