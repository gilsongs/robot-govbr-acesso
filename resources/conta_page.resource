*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CPF_FIELD}             id=accountId
${CONTINUAR_BTN}         id=enter-account-id
${CPF_LBL}               xpath=//*[@id="login-cpf"]/h3
${SENHA_LBL}             xpath=//*[@id="login-password"]/h3

*** Keywords ***
Abrir página de login
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CPF_LBL}

Identificar com o CPF
    [Arguments]    ${cpf}
    Input Text    ${CPF_FIELD}    ${cpf}
    Click Button  ${CONTINUAR_BTN}
    Wait Until Page Contains Element    ${SENHA_LBL}

Obter a page da Conta
    Wait Until Page Contains Element    ${SENHA_LBL}    timeout=5s

Capturar a imagem da tela
    Capture Page Screenshot
    #Capture Page Screenshot    ${OUTPUT DIR}/screenshot-final.png
    
Fechar navegador 
    Close Browser