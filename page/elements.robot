# Decrição: Elementos  da página
###################################################
*** Settings ***
### Configurações iniciais
Resource          ../steps/site_steps.robot

*** Variables ***
${Iframe}                  xpath=//iframe[@id="clever-84690-1752752-cube-validation"]
${InpBusca}                xpath=//input[@id="inputBusca"]
${InpCep}                  xpath=//input[@id="inputCalcularFrete"]

${BtnBusca}                xpath=//button[@data-testid="buttonBuscaKabum"]
${BtnCom}                  xpath=(//div[@class="sc-895a4546-2 bkKYFQ"])[1]
${BtnOkCalc}               xpath=//button[@id="botaoCalcularFrete"]
${BtnComprar}              xpath=(//button//span[@class="flex items-center gap-4 text-white text-sm flex-row"])[1]
${BtnCarrinho}             xpath=//span[@class="flex items-center gap-4 text-white text-sm flex-row"]
${BtnTalv}                 xpath=//div[@id="button-15804363494"]
${BtnEnt}                  xpath=//button[@id="onetrust-accept-btn-handler"]