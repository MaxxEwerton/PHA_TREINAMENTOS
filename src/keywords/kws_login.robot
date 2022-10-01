*** Settings ***
Documentation       Aqui estão as keyword utilizadas no testes de login

Resource            ../config/package.robot


*** Keywords ***
Dado que eu esteja na tela de login
    Wait Until Element Is Visible    ${CADASTRO.BTN_LOGIN}
    Click Element    ${CADASTRO.BTN_LOGIN}

Quando informar uma senha incorreta
    Input Text    ${LOGIN.INPUT_EMAIL}    testeeeeeee@yopmail.com
    Input Text    ${LOGIN.INPUT_SENHA}    123456789
    Click Element    ${LOGIN.BTN_ENTRAR}

Quando informar um email incorreto
    Input Text    ${LOGIN.INPUT_EMAIL}    testeeeeeee@yopmail.com
    Input Text    ${LOGIN.INPUT_SENHA}    123456789
    Click Element    ${LOGIN.BTN_ENTRAR}

Então a mensagem "Email ou senha inválida." deve ser apresentada
    Wait Until Element Is Visible    ${LOGIN.ERROR_MESSAGE}
    Element Text Should Be    ${LOGIN.ERROR_MESSAGE}    Email ou senha inválida.
