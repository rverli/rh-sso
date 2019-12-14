<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="login-idcarioca">

                <div class="row">
                    <div class="col-md-6">
                        <h1>Já tenho cadastro</h1>
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>

                        <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}">            
                                </div>
                            </div>
                        </div>
                        </#if>


                        <div class="row" style="margin-top:20px">
                            <div class="col-xs-6 col-md-6" style="padding:0px">
                                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                        <div id="kc-form-options">
                                            <#if realm.rememberMe && !usernameEditDisabled??>
                                                <div class="checkbox">
                                                    <label>
                                                        <#if login.rememberMe??>
                                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                                        <#else>
                                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                                        </#if>
                                                    </label>
                                                </div>
                                            </#if>
                                        </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-md-6" style="padding:0px">
                                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}" style="margin-top:0px">
                                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" 
                                        id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                                </div>                    
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="cadastro-idcarioca">
                            <h1> Não tenho cadastro</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor commodo porta. Maecenas viverra eget sapien in vehicula.</p>
                            <a href="https://idriohom.apps.rio.gov.br/usuario-cadastro.xhtml">Clique aqui para se cadastrar!</a>                           
                        </div>

                         <div class="cadastro-idcarioca">
                            <h1>Possuo Certificado Digital</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor commodo porta. Maecenas viverra eget sapien in vehicula.</p>
                             <a href="#">Clique aqui para entrar com seu certificado!</a>      
                        </div>                    
                    </div>
                </div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
