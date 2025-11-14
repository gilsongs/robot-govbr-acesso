*** Settings ***
Documentation     Teste de início do login no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary

Suite Setup       Abrir página de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
#Test Teardown     Capture Page Screenshot
Suite Teardown    Deve capturar e fechar navegador

*** Test Cases ***
Deve acessar com CPF válido
    Identificar com o CPF    ${CPF}
    Wait Until Page Contains    gov.br
    Log To Console    Botão "Continuar" clicado com sucesso

*** Keywords ***
Deve capturar e fechar navegador
    Obter a page da Conta
    Capturar a imagem da tela
    Fechar navegador