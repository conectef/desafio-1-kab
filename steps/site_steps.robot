*** Settings ***
Library    SeleniumLibrary
Resource      ../page/elements.robot
Resource     ../resource/ContextoSteps.robot


*** Keywords ***
Buscar produto
    Clicar Botao se estiver Visivel    ${BtnTalv}     60
    Clicar Botao se estiver Visivel    ${BtnEnt}      30
    Sleep    5
    Wait Until Element Is Enabled       ${InpBusca}    10
    Click no Item                      ${InpBusca}
    Wait Until Element Is Visible      ${InpBusca}    30
    Preencher campo                    ${InpBusca}        notebook
    Wait Until Element Is Visible      ${BtnBusca}    30
    Click no Item                      ${BtnBusca}

Preencher cep
    Clicar Botao se estiver Visivel    ${BtnEnt}      30
    Wait Until Element Is Visible      ${BtnCom}      10
    Scroll Element Into View           ${BtnCom}
    Wait Until Element Is Enabled      ${BtnCom}      30
    Click no Item                      ${BtnCom}
    Wait Until Element Is Visible      ${InpCep}      30
    Sleep    1
    Scroll Element Into View           ${InpCep}
    Wait Until Element Is Enabled      ${InpCep}
    Click no Item                      ${InpCep}
    Sleep    1
    Input Text                         ${InpCep}      68628105
    Should Not Be Empty                ${InpCep}

Comprar produto
    Click no Item                     ${BtnComprar}
    Click no Item                     ${BtnCarrinho}
    Wait Until Page Contains          Remover todos        10
