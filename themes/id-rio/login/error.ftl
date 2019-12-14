<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>


    <style>
        .box{
            width: 500px;
        }

        @media (max-width: 960px) {
            .idcarioca-header{
                margin-top:0px;
            }
        }
    </style>

    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${message.summary}</p>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>