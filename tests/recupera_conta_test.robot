*** Settings ***
Documentation     Teste de recuperação de senha no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Resource          ../resources/recupera_conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary

Suite Setup       Abrir página de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
#Test Teardown     Capture Page Screenshot
Suite Teardown    Deve capturar e fechar navegador

*** Test Cases ***
Deve tentar recuperar a senha da conta GovBR com o serviço indisponível
    [Documentation]    Acessa a tela de login e clica em "Esqueci minha senha"
    Identificar com o CPF    ${CPF}
    Clicar em esqueci minha senha e exibe serviço indisponivel

*** Keywords ***
Deve capturar e fechar navegador
    Obter a page da recuperação de conta
    Capturar a imagem da tela
    Fechar navegador