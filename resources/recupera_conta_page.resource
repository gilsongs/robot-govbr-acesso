*** Settings ***
Documentation     Resource com keywords e elementos da tela de recuperação de conta
Library           SeleniumLibrary
Resource          ../resources/conta_page.resource

*** Variables ***
${SENHA_FIELD}          xpath=//*[@id="password"]
${ESQUECI_SENHA_BTN}    id=password-recovery

*** Keywords ***
Clicar em esqueci minha senha
    [Arguments]    ${senha}
    Input Text    ${SENHA_FIELD}    ${senha}
    Wait Until Element Is Visible    ${ESQUECI_SENHA_BTN}
    Click Button    ${ESQUECI_SENHA_BTN}
    Log    Botão "Esqueci minha senha" clicado com sucesso