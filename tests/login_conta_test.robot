*** Settings ***
Documentation     Teste de login no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Resource          ../resources/login_conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary

Suite Setup       Abrir a pagina de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
#Test Teardown     Capture Page Screenshot
Suite Teardown    Capturar Screenshot Final

*** Test Cases ***
Deve acessar com CPF valido
    [Documentation]    Acessa a tela de login e clica em "Entrar"
    Identificar com o CPF    ${CPF}
    Clicar em entrar para o login    ${SENHA}

*** Keywords ***
Capturar Screenshot Final
    Obter a page do Login  
    Capturar a imagem da tela
    Fechar navegador