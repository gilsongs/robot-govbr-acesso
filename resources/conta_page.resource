*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_MOCK_SV_503}       http://localhost:8000/indisponivel.html
${CPF_FIELD}             id=accountId
${CONTINUAR_BTN}         id=enter-account-id
${CPF_LBL}               xpath=//*[@id="login-cpf"]/h3
${SENHA_LBL}             xpath=//*[@id="login-password"]/h3

*** Keywords ***
Abrir a pagina de login
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CPF_LBL}

Abrir a pagina de servico indisponivel mock
    [Arguments]    ${browser}
    Open Browser    ${URL_MOCK_SV_503}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Serviço indisponível no momento

Identificar com o CPF
    [Arguments]    ${cpf}
    Input Text    ${CPF_FIELD}    ${cpf}
    Click Button  ${CONTINUAR_BTN}
    Wait Until Page Contains Element    ${SENHA_LBL}

Obter a page da Conta
    Wait Until Page Contains Element    ${SENHA_LBL}    timeout=10s

Capturar a imagem da tela
    Capture Page Screenshot    screenshot-${SUITE_NAME}.png
    #Capture Page Screenshot    ${OUTPUT DIR}/screenshot-final.png
    
Fechar navegador 
    Close Browser