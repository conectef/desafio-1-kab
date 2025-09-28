*** Settings ***
### Keywords personalizadas para os testes

Resource          ../steps/site_steps.robot

### Inicia/fecha sessão do navegador
Test Setup        Nova sessao
Test Teardown     Encerra sessao

*** Variables ***



*** Test Cases ***
Teste referente ao site kabum
    Buscar produto
    Preencher cep
    Comprar produto

