*** Settings ***
Documentation     Resource com keywords e elementos da tela de recuperação de conta
Library           SeleniumLibrary
Resource          ../resources/login_conta_page.resource

*** Variables ***
${SENHA_FIELD}      xpath=//*[@id="password"]
${ENTRA_BTN}        id=submit-button

*** Keywords ***
Clicar em entrar para o login
    [Arguments]    ${senha}
    Input Text    ${SENHA_FIELD}    ${senha}    
    Wait Until Element Is Visible    ${ENTRA_BTN} 
    Click Button    ${ENTRA_BTN} 
    Log To Console    Botão "Entrar" clicado com sucesso