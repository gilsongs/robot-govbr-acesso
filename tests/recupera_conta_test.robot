*** Settings ***
Documentation     Teste de recuperação de senha no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Resource          ../resources/recupera_conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary

Suite Setup       Abrir página de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
Test Teardown     Capture Page Screenshot
Suite Teardown    Capturar e fechar navegador

*** Test Cases ***
Recuperar senha de conta GovBR
    [Documentation]    Acessa a tela de login e clica em "Esqueci minha senha"
    Fazer login com as credenciais    ${CPF}
    Clicar em esqueci minha senha     ${SENHA}

*** Keywords ***
Capturar e fechar navegador
    Capture Page Screenshot
    #Capture Page Screenshot    ${OUTPUT DIR}/screenshot-final.png
    Fechar navegador