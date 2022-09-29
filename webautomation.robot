*** Settings ***
Documentation       Aqui neste arquivo estaram presentes todos os tipos de
...                 variáveis que iremos estudar ao longo do treinamento.

Library             SeleniumLibrary
Library             DebugLibrary

Test Setup          Abrir o meu navegador
Test Teardown       Fechar navegador


*** Variables ***
${URL}          https://learningprime.com.br/
${BROWSER}      chrome


*** Test Cases ***
# Cenario01: Buscando um roupa
#    [Tags]    busca
#    Dado que eu esteja na tela Home do site
#    Quando pesquisar o produto    Bag
#    Então o produto deve ser apresentado com sucesso    Resultados da busca por 'Bag'

# Cenário02: Buscar Mug com sucesso
#    [Tags]    mug
#    Dado que eu esteja na tela Home do site
#    Quando pesquisar o produto    Mug
#    Então o produto deve ser apresentado com sucesso    Resultados da busca por 'Mug'
#    E a imagem certa deverá aparecer

# Cenário03: Validando cadastro com sucesso no learningprime
#    [Tags]    cadastro
#    Dado que eu esteja na tela de cadastro
#    E informe todos os dados necessários
#    Quando finalizar o cadastro
#    Então devo ser direcionado para a tela home do site
#    E a seguinte mensagem deve ser apresentada

Cenário04: Validar login com senha incorreta
    Dado que eu esteja na tela de login
    Quando informar uma senha incorreta
    Então a mensagem "Email ou senha inválida." deve ser apresentada

Cenário05: Validar login com email incorreto
    Dado que eu esteja na tela de login
    Quando informar um email incorreto
    Então a mensagem "Email ou senha inválida." deve ser apresentada


*** Keywords ***
######################################################
#    Cenário04: Validar login com senha incorreta    #
#######################################################
Dado que eu esteja na tela de login
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element    xpath=//a[@href='/login']

Quando informar uma senha incorreta
    Input Text    xpath=//input[@id="spree_user_email"]    testeeeeee@yopmail.com
    Input Text    xpath=//input[@id="spree_user_password"]    123456789
    Click Element    xpath=//input[@value='Entrar']

Quando informar um email incorreto
    Input Text    spree_user_email    testeeeeee@yopmail.com
    Input Text    spree_user_password    123456789
    Click Element    xpath=//input[@value='Entrar']

Então a mensagem "Email ou senha inválida." deve ser apresentada
    Wait Until Element Is Visible    xpath=//div[@class='flash error']
    Element Text Should Be    xpath=//div[@class='flash error']    Email ou senha inválida.
    Sleep    5

##################################################################
#    Cenário: Validando cadastro com sucesso no learningprime    #
##################################################################

Dado que eu esteja na tela de cadastro
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element    xpath=//a[@href='/login']
    Debug
    Wait Until Element Is Visible    xpath=//a[@href='/signup']
    Click Element    xpath=//a[@href='/signup']

E informe todos os dados necessários
    Wait Until Element Is Visible    xpath=//div[@id='new-customer']
    Input Text    xpath=//input[@id="spree_user_email"]    teste6@yopmail.com
    Input Text    xpath=//input[@id="spree_user_password"]    123456789
    Input Text    id=spree_user_password_confirmation    123456789

Quando finalizar o cadastro
    Click Element    xpath=//input[@value="Criar" and @name="commit"]

Então devo ser direcionado para a tela home do site
    Wait Until Element Is Visible    xpath=//a[@href]

E a seguinte mensagem deve ser apresentada
    Wait Until Element Is Visible    xpath=//div[@class='flash notice']    30

#####################################
#    Cenario: Buscando um roupa    #
#####################################

Dado que eu esteja na tela Home do site
    Title Should Be    Learning Prime Store
    Wait Until Element Is Visible    xpath=//*[contains(text(),'Comprar por Categories')]

Quando pesquisar o produto
    [Arguments]    ${PRODUTO}
    Input Text    xpath=//input[@placeholder='Busca' and @type='search']    ${PRODUTO}
    Click Button    xpath=//input[@type='submit' and @value="Busca"]

Então o produto deve ser apresentado com sucesso
    [Arguments]    ${MESSAGEM}
    Wait Until Page Contains    ${MESSAGEM}
    Page Should Contain Image    xpath=//img[@src="/spree/products/23/small/ror_bag.jpeg?1552494900"]

Abrir o meu navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

E a imagem certa deverá aparecer
    Page Should Contain Image    xpath=//img[@src='/spree/products/27/small/ror_mug.jpeg?1552494901']

Fechar navegador
    Close Browser
