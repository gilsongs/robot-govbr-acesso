*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CPF_FIELD}        id=accountId
${CONTINUAR_BTN}    id=enter-account-id

*** Keywords ***
Abrir página de login
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="login-cpf"]/h3

Identificar com o CPF
    [Arguments]    ${cpf}
    Input Text    ${CPF_FIELD}    ${cpf}
    Click Button  ${CONTINUAR_BTN}
    Wait Until Page Contains Element    xpath=//*[@id="login-password"]/h3

Fechar navegador
    Close Browser   