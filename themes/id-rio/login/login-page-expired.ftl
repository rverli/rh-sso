<#import "template.ftl" as layout>
<@layout.registrationLayout; section>


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
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
        <p id="instruction1" class="instruction">
            ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
            ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
        </p>
    </#if>
</@layout.registrationLayout>
