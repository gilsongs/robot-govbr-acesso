*** Settings ***
Documentation     Teste de login no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary

Suite Setup       Abrir página de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
Suite Teardown    Capturar e fechar navegador

*** Test Cases ***
Login com credenciais válidas
    Fazer login com as credenciais    ${CPF}
    Wait Until Page Contains    gov.br
    Log To Console    Botão "Continuar" clicado com sucesso

*** Keywords ***
Capturar e fechar navegador
    Capture Page Screenshot
    #Capture Page Screenshot    ${OUTPUT DIR}/screenshot-final.png
    Fechar navegador