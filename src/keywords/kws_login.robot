*** Settings ***
Documentation       Aqui estão as keyword utilizadas no testes de login

Resource            ../config/package.robot


*** Keywords ***
Dado que eu esteja na tela de login
    Wait Until Element Is Visible    ${HOME.BTN_CADASTRO}
    Click Element    ${HOME.BTN_CADASTRO}

Quando informar uma senha incorreta
    Input Text    ${HOME.INPUT_EMAIL}    testeeeeeee@yopmail.com
    Input Text    ${HOME.INPUT_SENHA}    123456789
    Click Element    ${HOME.BTN_ENTRAR}

Quando informar um email incorreto
    Input Text    ${HOME.INPUT_EMAIL}    testeeeeeee@yopmail.com
    Input Text    ${HOME.INPUT_SENHA}    123456789
    Click Element    ${HOME.BTN_ENTRAR}

Então a mensagem "Email ou senha inválida." deve ser apresentada
    Wait Until Element Is Visible    ${HOME.ERROR_MESSAGE}
    Element Text Should Be    ${HOME.ERROR_MESSAGE}    Email ou senha inválida.
    Sleep    5
