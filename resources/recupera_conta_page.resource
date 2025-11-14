*** Settings ***
Documentation     Resource com keywords e elementos da tela de recuperação de conta
Library           SeleniumLibrary
Resource          ../resources/conta_page.resource

*** Variables ***
${ESQUECI_SENHA_BTN}      id=password-recovery
${INDISPONIVEL_SVC}       xpath=//div[contains(text(), 'Serviço indisponível no momento')]


*** Keywords ***
Clicar em esqueci minha senha e exibe serviço indisponivel
    Wait Until Element Is Visible    ${ESQUECI_SENHA_BTN}
    Click Button    ${ESQUECI_SENHA_BTN}
    Log To Console    Botão "Esqueci minha senha" clicado com sucesso

Obter a page da recuperação de conta com servico indisponivel
    Wait Until Page Contains Element    ${INDISPONIVEL_SVC}    timeout=10s