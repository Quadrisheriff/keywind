<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("firstName", "lastName", "email", "username", "password", "password-confirm")
  ;
  section
>
  <#if section="header">
                <div class="space-y-3 tracking-wider">
                      <div class="text-xl text-teal-500">Create your Safe account</div>
                      <div class="text-lg"> Let's get you onboard, get started in minutes.</div>
                    </div>
  <#elseif section="form">
    <form action="${url.registrationAction}" class="m-0 space-y-4" method="post">
      <div>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          value=(register.formData.email)!''
        >
          ${msg("email")}
        </@inputPrimary.kw>
      </div>
      <#if !realm.registrationEmailAsUsername>
        <div>
          <@inputPrimary.kw
            autocomplete="username"
            invalid=["username"]
            name="username"
            type="text"
            value=(register.formData.username)!''
          >
            ${msg("username")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if passwordRequired??>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password", "password-confirm"]
            name="password"
            type="password"
          >
            ${msg("password")}
          </@inputPrimary.kw>
        </div>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password-confirm"]
            name="password-confirm"
            type="password"
          >
            ${msg("passwordConfirm")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if recaptchaRequired??>
        <div>
          <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-size="compact"></div>
        </div>
      </#if>
      <div>
        <@buttonPrimary.kw type="submit">
          ${msg("doRegister")}
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span class="text-sm py-5">${kcSanitize(msg("backToLogin"))?no_esc}</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
