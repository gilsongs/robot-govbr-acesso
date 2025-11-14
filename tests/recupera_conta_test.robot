*** Settings ***
Documentation     Teste de recuperação da senha no portal SSO do gov.br
Resource          ../resources/conta_page.resource
Resource          ../resources/recupera_conta_page.resource
Variables         ../variables/credentials.py
Library           SeleniumLibrary
Library           OperatingSystem
Library           Process

Suite Setup       Abrir a pagina de login    ${URL_SSO}    ${BROWSER}
Test Setup        Log To Console    URL=${URL_SSO} BROWSER=${BROWSER} CPF=${CPF} SENHA=${SENHA}
#Test Teardown     Capture Page Screenshot
Suite Teardown    Encerrar Ambiente

*** Test Cases ***
Deve tentar recuperar a senha da conta GovBR com o serviço indisponivel
    [Documentation]    Acessa a tela de login e clica em "Esqueci minha senha"       
    Identificar com o CPF    ${CPF}
    Clicar em esqueci minha senha e exibe serviço indisponivel
    Fechar navegador
    Preparar Ambiente

*** Keywords ***
Iniciar Servidor Local
    Log To Console    ==> Iniciando mock server local...
    ${MOCK_DIR}         Set Variable    ${CURDIR}${/}..${/}mock
    ${SERVER_SCRIPT}    Set Variable    ${MOCK_DIR}${/}server.py
    ${SERVER_LOG}       Set Variable    ${MOCK_DIR}${/}server.log
    Run Process    python    -m    ${SERVER_SCRIPT}    stdout=${SERVER_LOG}    stderr=STDOUT    
    ...    shell=True    alias=mock_server
    Sleep    2s
    Log To Console    ==> Mock server disponível em http://localhost:8000

Parar Servidor Local
    ${exists}=    Run Keyword And Return Status    Terminate Process    mock_server    kill=True
    IF    ${exists}
        Log To Console    ==> Servidor mock encerrado
    ELSE
        Log To Console    ==> Nenhum servidor mock estava em execução
    END

Preparar Ambiente
    Iniciar Servidor Local
    Abrir a pagina de servico indisponivel mock    ${BROWSER}

Encerrar Ambiente
    Parar Servidor Local
    Capturar Screenshot Final do servico indisponivel
Capturar Screenshot Final do servico indisponivel
    Obter a page da recuperação de conta com servico indisponivel
    Capturar a imagem da tela
    Fechar navegador