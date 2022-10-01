*** Settings ***
Documentation       Aqui neste arquivo estaram presentes todos os tipos de
...                 variáveis que iremos estudar ao longo do treinamento.

Resource            ../../src/config/package.robot
Resource            ../../src/config/hooks.robot
Resource            ../../src/keywords/kws_buscas.robot
Resource            ../../src/keywords/kws_cadastro.robot
Resource            ../../src/keywords/kws_login.robot

Test Setup          Abrir o meu navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Cenario01: Buscar bag com sucesso
    [Tags]    busca
    Dado que eu esteja na tela Home do site
    Quando pesquisar o produto    Bag
    Então o produto deve ser apresentado com sucesso    Resultados da busca por 'Bag'
Cenário02: Validando cadastro com sucesso no learningprime
    [Tags]    cadastro
    Dado que eu esteja na tela de cadastro
    E informe todos os dados necessários
    Quando finalizar o cadastro
    Então devo ser direcionado para a tela home do site
    E a seguinte mensagem deve ser apresentada    Bem vindo! Seu cadastro foi feito com sucesso.

Cenário03: Validar login com senha incorreta
    [Tags]    login
    Dado que eu esteja na tela de login
    Quando informar uma senha incorreta
    Então a mensagem "Email ou senha inválida." deve ser apresentada

Cenário04: Validar login com email incorreto
    [Tags]    flogin
    Dado que eu esteja na tela de login
    Quando informar um email incorreto
    Então a mensagem "Email ou senha inválida." deve ser apresentada
