*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             Process
Library             DateTime

*** Variables ***
${browser}             chrome
${BASE_URL}            https://www.kabum.com.br/
@{LIST}
${GRAVACAO_ATIVA}      False

*** Keywords ***
Nova sessao
    Verificar e Iniciar Gravacao
    Import Library    ScreenCapLibrary
    Import Library    AutoRecorder
    Open Browser      ${BASE_URL}       ${browser}
    Maximize Browser Window

Encerra sessao
    Run Keyword If    'Windows' in '${OS}'    Parar Gravacao e Redefinir Status
    Close Browser

Parar Gravacao e Redefinir Status
    Run Keyword If    '${GRAVACAO_ATIVA}' == 'True'    Parar Gravacao
    Set Global Variable    ${GRAVACAO_ATIVA}    False

Parar Gravacao
    Run Keyword If    'Windows' in '${OS}'    Stop Recording Test    alias=${nome_recording}

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
    ${valor}=    Convert To String    ${valor}
    ${caracteres}=    Evaluate    list("${valor}")
    FOR    ${c}    IN    @{caracteres}
        Press Keys    ${elemento}    ${c}
        Sleep    0.1
    END
    Press Keys    ${elemento}    RETURN

Verificar e Iniciar Gravacao
    Run Keyword If    '${GRAVACAO_ATIVA}' == 'False'    Iniciar gravacao de tela no windows
    Set Global Variable    ${GRAVACAO_ATIVA}    True

Verificar sistema operacional
    [Documentation]    Realiza a verificação do sistema operacional.
    ${result}=    Run Keyword And Ignore Error    Get Environment Variable    OS
    ${status}=    Set Variable    ${result}[0]
    ${os}=    Set Variable    ${result}[1]

    Run Keyword If    '${status}' == 'PASS'    Verificar SO Windows    ${os}
    ...    ELSE    Verificar SO Unix

Iniciar gravacao de tela no windows
    [Documentation]    Inicia a gravação de tela caso o sistema opeacional identificado for o windows.
    Verificar sistema operacional
    log to Console    ${OS}
    Set Suite Variable    ${OS}    ${OS}
    Run Keyword If    'Windows' in '${OS}'    Import Library    ScreenCapLibrary
    Run Keyword If    'Windows' in '${OS}'    Import Library    AutoRecorder
    Run Keyword If    'Windows' not in '${OS}'    Log    "Gravação não inciada, sistema linux identificado"
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${nome_recording}=    Set Variable    recording_${timestamp}
    Set Global Variable    ${nome_recording}
    Run Keyword If    'Windows' in '${OS}'    Autostart Recording    alias=${nome_recording}
    Run Keyword If    'Windows' in '${OS}'    Log To Console    Gravação de tela iniciada no windows.

Verificar SO Windows
    [Documentation]    Atribuir variavel para sistema windows
    [Arguments]    ${os}
    Run Keyword If    '${os}' == 'Windows_NT'    Set Suite Variable    ${OS}    Windows

Verificar SO Unix
    [Documentation]    Atribuir variavel para sistema linux
    ${uname_result}=    Run And Return Rc And Output    uname -s
    Set Global Variable    ${OS}    ${uname_result}[1]
    Log To Console         "OS identificado: ${OS}"
