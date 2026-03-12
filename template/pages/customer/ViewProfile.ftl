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

<#include "../base.ftl" />

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
            <#if party??>
                <div class="d-flex justify-content-between">
                  <div class="p-2">
                    <h2>${SystemLabelMap.PartyTheProfileOf}
                      <#if person??>
                      ${person.personalTitle!}
                      ${person.firstName!}
                      ${person.middleName!}
                      ${person.lastName!}
                      ${person.suffix!}
                      <#else>
                        "${SystemLabelMap.PartyNewUser}"
                      </#if>
                    </h2>
                  </div>
                  <div class="p-2">
                    <#if showOld>
                      <a href="<@ofbizUrl>viewprofile</@ofbizUrl>" class="btn btn-outline-secondary">${uiLabelMap.PartyHideOld}</a>
                    <#else>
                      <a href="<@ofbizUrl>viewprofile?SHOW_OLD=true</@ofbizUrl>" class="btn btn-outline-secondary">${uiLabelMap.PartyShowOld}</a>
                    </#if>
                  </div>
                </div>

                <div class="card">
                  <div class="card-header">
                    <div class="row">
                    <div class="col-lg-3">
                      <strong>${SystemLabelMap.PartyPersonalInformation}</strong>
                    </div>
                    <div class="col-lg-9 text-right">
                    <a href="<@ofbizUrl>editperson</@ofbizUrl>">
                    <#if person??>${SystemLabelMap.CommonUpdate}<#else>${SystemLabelMap.CommonCreate}</#if></a>
                    </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <#if person??>
                    <div class="row">
                      <div class="col-lg-6">
                      <dl class="row">
                        <dt class="col-lg-2">${SystemLabelMap.PartyName}</dt>
                        <dd class="col-lg-10">
                          ${person.personalTitle!}
                          ${person.firstName!}
                          ${person.middleName!}
                          ${person.lastName!}
                          ${person.suffix!}
                        </dd>
                    </dl>
                    </div>
                    </div>
                    <#else>
                      <label>${SystemLabelMap.PartyPersonalInformationNotFound}</label>
                    </#if>
                    </div>
                </div>

                <#-- ============================================================= -->
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-lg-3"><strong>${SystemLabelMap.PartyContactInformation}</strong></div>
                      <div class="col-lg-9 text-right"><a href="<@ofbizUrl>editcontactmech</@ofbizUrl>" class="card-link">${SystemLabelMap.CommonCreate}</a></div>
                    </div>
                  </div>

                  <div class="card-body">
                  <#if partyContactMechValueMaps?has_content>
                    <table class="table table-responsive-sm">
                      <thead class="thead-dark">
                      <tr>
                        <th>${SystemLabelMap.PartyContactType}</th>
                        <th>${SystemLabelMap.CommonInformation}</th>
                        <#--<th>${uiLabelMap.PartySolicitingOk}?</th>-->
                        <th></th>
                      </tr>
                      </thead>
                      <#list partyContactMechValueMaps as partyContactMechValueMap>
                        <#assign contactMech = partyContactMechValueMap.contactMech! />
                        <#assign contactMechType = partyContactMechValueMap.contactMechType! />
                        <#assign partyContactMech = partyContactMechValueMap.partyContactMech! />
                          <tbody>
                          <tr>
                            <td>
                              ${contactMechType.get("description",locale)}
                            </td>
                            <td>
                              <#list partyContactMechValueMap.partyContactMechPurposes! as partyContactMechPurpose>
                                <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
                                  <#if contactMechPurposeType??>
                                    ${contactMechPurposeType.get("description",locale)}
                                    <#if "SHIPPING_LOCATION" == contactMechPurposeType.contactMechPurposeTypeId && (profiledefs.defaultShipAddr)?default("") == contactMech.contactMechId>
                                      <label>${SystemLabelMap.EcommerceIsDefault}</label>
                                    <#elseif "SHIPPING_LOCATION" == contactMechPurposeType.contactMechPurposeTypeId>
                                      <form name="defaultShippingAddressForm" method="post" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>">
                                        <input type="hidden" name="productStoreId" value="${productStoreId}" />
                                        <input type="hidden" name="defaultShipAddr" value="${contactMech.contactMechId}" />
                                        <input type="hidden" name="partyId" value="${party.partyId}" />
                                        <input type="submit" value="${uiLabelMap.EcommerceSetDefault}" class="btn btn-outline-secondary" />
                                      </form>
                                    </#if>
                                  <#else>
                                    ${uiLabelMap.PartyPurposeTypeNotFound}: "${partyContactMechPurpose.contactMechPurposeTypeId}"
                                  </#if>
                                  <#--<#if partyContactMechPurpose.thruDate??>(${uiLabelMap.CommonExpire}:${partyContactMechPurpose.thruDate.toString()})</#if>-->
                              </#list>
                              <#if contactMech.contactMechTypeId! = "POSTAL_ADDRESS">
                                <#assign postalAddress = partyContactMechValueMap.postalAddress! />
                                <div>
                                  <#if postalAddress??>
                                    <#if postalAddress.toName?has_content>${uiLabelMap.CommonTo}: ${postalAddress.toName}<br /></#if>
                                    <#if postalAddress.attnName?has_content>${uiLabelMap.PartyAddrAttnName}: ${postalAddress.attnName}<br /></#if>
                                    ${postalAddress.address1}<br />
                                    <#if postalAddress.address2?has_content>${postalAddress.address2}<br /></#if>
                                    ${postalAddress.city}<#if partyContactMechValueMap.stateProvinceGeoName?has_content>,&nbsp;${partyContactMechValueMap.stateProvinceGeoName}</#if>&nbsp;${postalAddress.postalCode!}
                                    <#if partyContactMechValueMap.countryGeoName?has_content><br />${partyContactMechValueMap.countryGeoName}</#if>
                                    <#if (!postalAddress.countryGeoId?has_content || postalAddress.countryGeoId! = "USA")>
                                      <#assign addr1 = postalAddress.address1! />
                                      <#if (addr1.indexOf(" ") > 0)>
                                        <#assign addressNum = addr1.substring(0, addr1.indexOf(" ")) />
                                        <#assign addressOther = addr1.substring(addr1.indexOf(" ")+1) />
                                        <a target="_blank" href="${uiLabelMap.CommonLookupWhitepagesAddressLink}" class="linktext">(${uiLabelMap.CommonLookupWhitepages})</a>
                                      </#if>
                                    </#if>
                                  <#else>
                                    ${uiLabelMap.PartyPostalInformationNotFound}.
                                  </#if>
                                  </div>
                              <#elseif contactMech.contactMechTypeId! = "TELECOM_NUMBER">
                                <#assign telecomNumber = partyContactMechValueMap.telecomNumber!>
                                <div>
                                <#if telecomNumber??>
                                  ${telecomNumber.countryCode!}
                                  <#if telecomNumber.areaCode?has_content>${telecomNumber.areaCode}-</#if>${telecomNumber.contactNumber!}
                                  <#--<#if partyContactMech.extension?has_content>ext&nbsp;${partyContactMech.extension}</#if>-->
                                  <#--
                                  <#if (!telecomNumber.countryCode?has_content || telecomNumber.countryCode = "011")>
                                    <a target="_blank" href="${uiLabelMap.CommonLookupAnywhoLink}" class="linktext">${uiLabelMap.CommonLookupAnywho}</a>
                                    <a target="_blank" href="${uiLabelMap.CommonLookupWhitepagesTelNumberLink}" class="linktext">${uiLabelMap.CommonLookupWhitepages}</a>
                                  </#if>-->
                                <#else>
                                  ${SystemLabelMap.PartyPhoneNumberInfoNotFound}.
                                </#if>
                                </div>
                              <#elseif contactMech.contactMechTypeId! = "EMAIL_ADDRESS">
                                  ${contactMech.infoString}
                                  <#--<a href="mailto:${contactMech.infoString}" class="linktext">(${uiLabelMap.PartySendEmail})</a>-->
                              <#else>
                                ${contactMech.infoString!}
                              </#if>
                              <div>(${uiLabelMap.CommonUpdated}:&nbsp;${partyContactMech.fromDate.toString()})</div>
                              <#if partyContactMech.thruDate??><div>${uiLabelMap.CommonDelete}:&nbsp;${partyContactMech.thruDate.toString()}</div></#if>
                            </td>
                            <#--<td>(${partyContactMech.allowSolicitation!})</td>-->
                            <td>
                              <form name= "deleteContactMech_${contactMech.contactMechId}" method= "post" action= "<@ofbizUrl>deleteContactMech</@ofbizUrl>">
                                <input type= "hidden" name= "contactMechId" value= "${contactMech.contactMechId}"/>
                                <a href="<@ofbizUrl>editcontactmech?contactMechId=${contactMech.contactMechId}</@ofbizUrl>" class="btn btn-outline-secondary">${SystemLabelMap.CommonUpdate}</a>
                                <a href='javascript:document.deleteContactMech_${contactMech.contactMechId}.submit()' class='btn btn-outline-secondary'>${SystemLabelMap.CommonDelete}</a>
                              </form>
                            </td>
                          </tr>
                          </tbody>
                      </#list>
                    </table>
                  <#else>
                    <label>${SystemLabelMap.PartyNoContactInformation}.</label>
                  </#if>
                  </div>
                </div>

                <#-- ============================================================= -->
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-lg-3">
                        <strong>${uiLabelMap.CommonUsername} &amp; ${uiLabelMap.CommonPassword}</strong>
                      </div>
                      <div class="col-lg-9 text-right">
                        <a href="<@ofbizUrl>passwordChange</@ofbizUrl>">${uiLabelMap.PartyChangePassword}</a>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <dl>
                    <dt>${uiLabelMap.CommonUsername}</dt>
                    <dd>${userLogin.userLoginId}</dd>
                    </dl>
                  </div>
                </div>

                <#-- ============================================================= -->
                <form name="setdefaultshipmeth" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>" method="post">
                  <input type="hidden" name="productStoreId" value="${productStoreId}" />
                  <div class="card">
                    <div class="card-header">
                      <#if profiledefs?has_content && profiledefs.defaultShipAddr?has_content && carrierShipMethods?has_content><a href="javascript:document.setdefaultshipmeth.submit();" class="submenutextright">${SystemLabelMap.EcommerceSetDefault}</a></#if>
                      <strong>${uiLabelMap.EcommerceDefaultShipmentMethod}</strong>
                    </div>
                    <div class="card-body">
                      <table class="table table-responsive-sm">
                        <#if profiledefs?has_content && profiledefs.defaultShipAddr?has_content && carrierShipMethods?has_content>
                          <#list carrierShipMethods as shipMeth>
                            <#assign shippingMethod = shipMeth.shipmentMethodTypeId + "@" + shipMeth.partyId />
                            <tr>
                              <td></td>
                              <td>
                                <#if shipMeth.partyId != "_NA_">${shipMeth.partyId!}</#if>${shipMeth.get("description",locale)!}
                              </td>
                            </tr>
                          </#list>
                        <#else>
                        <tr>
                          <td><input type="radio" name="defaultShipMeth" value="${shippingMethod!}" <#if (profiledefs.defaultShipMeth)! == shippingMethod!>checked="checked"</#if> /></td>
                          <td>${uiLabelMap.EcommerceDefaultShipmentMethodMsg}</td>
                        </tr>
                        </#if>
                      </table>
                    </div>
                  </div>
                </form>

                <#-- ============================================================= -->

                <#-- Serialized Inventory Summary -->
                ${screens.render('component://ecommerce/widget/CustomerScreens.xml#SerializedInventorySummary')}

            <#else>
                <#if userLogin??>
                    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
                </#if>
            </#if>
            </div>
        </div>
    </div>
</section>

</#macro>
<@display_page/>