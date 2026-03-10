<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro page_body>

<section id="content">
    <div class="content-wrap pb-0">
	    <div class="container-fluid mt-5">
            <div class="row">
                <div class="card mx-auto" style="max-width: 540px;">
                    <div class="card-header py-3 bg-transparent text-center">
                        <h3 class="mb-0 fw-normal upper">${SystemLabelMap.WelcomeBack}</h3>
                    </div>
                    <div class="card-body mx-auto py-5" style="max-width: 70%;">

                        <form id="login-form" name="loginform" class="mb-0 row" action="<@ofbizUrl>login</@ofbizUrl>" method="post">

                            <div class="col-12">
                                <input type="text" id="userName" name="USERNAME" value="<#if requestParameters.USERNAME?has_content>${requestParameters.USERNAME}<#elseif autoUserLogin?has_content>${autoUserLogin.userLoginId}</#if>"" class="form-control not-dark" placeholder="${SystemLabelMap.Username}">
                            </div>

                            <div class="col-12 mt-4">
                                <input type="password" id="password" name="PASSWORD" value="" class="form-control not-dark" placeholder="${SystemLabelMap.Password}">
                            </div>

                            <div class="col-12 text-end">
                                <a href="#" class="text-dark fw-light mt-2 upper">${SystemLabelMap.CommonForgotYourPassword}?</a>
                            </div>

                            <div class="col-12 mt-4">
                                <button class="button w-100 m-0 upper" id="login-form-submit" name="login-form-submit" value="Login">Login</button>
                                <!--<input type="submit" class="button w-100 m-0"  value="Login"/>-->
                            </div>
                        </form>
                    </div>
                    <div class="card-footer py-4 text-center">
                        <p class="mb-0 upper">${SystemLabelMap.DontHaveAccount}? <a href="<@ofbizUrl>newCustomer</@ofbizUrl>" class="upper"><u>${SystemLabelMap.SignUp}</u></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
</#macro>

<@display_page/>