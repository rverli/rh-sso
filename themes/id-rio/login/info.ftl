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
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">

        <p class="instruction">
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri??>
                <p class="text-center instrucao-box"><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri??>
                <p class="text-center instrucao-box"><a href="${actionUri}">
                        <#if requiredActions??><#list requiredActions> <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
               </a></p>
            <#elseif client.baseUrl??>
                <p class="text-center instrucao-box"><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>