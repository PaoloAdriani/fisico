<#include "base.ftl" />

<#macro page_head_title>

<!-- Document Title
============================================= -->
<title>Store | Canvas</title>

</#macro>

<#macro page_body>

<!-- Document Wrapper
============================================= -->
<div id="wrapper">
    <section id="content">
    	<div class="content-wrap pb-0">
            <h1>ERROR MESSAGE</h1>
            <hr>
            <p>${request.getAttribute('_ERROR_MESSAGE_')?replace("\n", "<br/>")}</p>
        </div>
    </section>
</div>

</#macro>


<@display_page/>