<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#include "../base.ftl"/>

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap">
        <div class="container">
            <div class="card mb-0 upper">
                <div>
                    <div class="card">
                        <div class="card-header">
                          <strong>${SystemLabelMap.OrderSalesHistory}</strong>
                        </div>
                        <div class="card-body">
                          <table class="table table-responsive-sm" id="orderSalesHistory" summary="This table display order sales history.">
                            <thead class="thead-light">
                              <tr>
                                <th>${SystemLabelMap.CommonDate}</th>
                                <th>${SystemLabelMap.OrderOrder} ${SystemLabelMap.CommonNbr}</th>
                                <th>${SystemLabelMap.CommonAmount}</th>
                                <th>${SystemLabelMap.CommonStatus}</th>
                                <th>${SystemLabelMap.OrderInvoices}</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                              <#if orderHeaderList?has_content>
                                <#list orderHeaderList as orderHeader>
                                  <#assign status = orderHeader.getRelatedOne("StatusItem", true) />
                                  <tr>
                                    <td>${orderHeader.orderDate.toString()}</td>
                                    <td>${orderHeader.orderId}</td>
                                    <td><@ofbizCurrency amount=orderHeader.grandTotal isoCode=orderHeader.currencyUom /></td>
                                    <td>${status.get("description",locale)}</td>
                                    <#-- invoices -->
                                    <#assign invoices = EntityQuery.use(delegator).from("OrderItemBilling").where("orderId", orderHeader.orderId).orderBy("invoiceId").queryList()!/>
                                    <#assign distinctInvoiceIds = Static["org.apache.ofbiz.entity.util.EntityUtil"].getFieldListFromEntityList(invoices, "invoiceId", true)>
                                    <#if distinctInvoiceIds?has_content>
                                      <td>
                                        <#list distinctInvoiceIds as invoiceId>
                                           <a href="<@ofbizUrl>invoice.pdf?invoiceId=${invoiceId}</@ofbizUrl>" class="buttontext">
                                             (${invoiceId} ${SystemLabelMap.CommonPdf})
                                           </a>
                                        </#list>
                                      </td>
                                    <#else>
                                      <td></td>
                                    </#if>
                                    <td>
                                      <a href="<@ofbizUrl>orderstatus?orderId=${orderHeader.orderId}</@ofbizUrl>" class="button">
                                        ${SystemLabelMap.CommonView}
                                      </a>
                                    </td>
                                  </tr>
                                </#list>
                              <#else>
                                <tr><td colspan="6">${uiLabelMap.OrderNoOrderFound}</td></tr>
                              </#if>
                            </tbody>
                          </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>
