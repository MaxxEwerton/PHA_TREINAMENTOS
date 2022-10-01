*** Settings ***
Documentation       Aqui estão as keywords dos testes de cadastro

Resource            ../config/package.robot


*** Keywords ***
##############################################################################
#    Cenario: Validando cadastro com sucesso no learningprime    #
##############################################################################
Dado que eu esteja na tela de cadastro
    Wait Until Element Is Visible    ${CADASTRO.BTN_LOGIN}
    Click Element    ${CADASTRO.BTN_LOGIN}

    Wait Until Element Is Visible    ${LOGIN.BTN_CADASTRO}
    Click Element    ${LOGIN.BTN_CADASTRO}

    Wait Until Page Contains    Novo Cliente

E informe todos os dados necessários
    ${EMAIL_FAKER}    FakerLibrary.Email
    Input Text    ${LOGIN.INPUT_EMAIL}    ${EMAIL_FAKER}
    Input Text    ${LOGIN.INPUT_SENHA}    123456789
    Input Text    ${CADASTRO.INPUT_CONFISENHA}    123456789

Quando finalizar o cadastro
    Click Element    ${CADASTRO.CRIAR}

Então devo ser direcionado para a tela home do site
    Wait Until Element Is Visible    ${CADASTRO.CONFIRMAÇÃO}
