*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             Process

*** Variables ***
${browser}             chrome
${BASE_URL}            https://www.kabum.com.br/
@{LIST}

*** Keywords ***
Nova sessao
    Import Library    ScreenCapLibrary
    Import Library    AutoRecorder
    Open Browser      ${BASE_URL}       ${browser}
    Maximize Browser Window

Encerra sessao
    Close Browser

Click no Item
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}    30
    Sleep    1
    Click Element    ${elemento}
    Sleep    1

Clicar Botao se estiver Visivel
    [Arguments]    ${Botao}    ${Tempo}=20
    ${Status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Botao}    ${Tempo}
    Run Keyword If    '${Status}' == 'True'    Click no Item    ${Botao}

Preencher Campo
    [Arguments]    ${elemento}    ${valor}
    Wait Until Element Is Visible    ${elemento}    30
    Clear Element Text    ${elemento}
    ${letras}=    Evaluate    list("${valor}")
    FOR    ${letra}    IN    @{letras}
        Press Keys    ${elemento}    ${letra}
        Sleep    0.1
    END
    Press Keys    ${elemento}    RETURN



