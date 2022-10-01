*** Settings ***
Documentation    Aqui estarão os Setup e as Teardown do projeto

Resource    ../config/package.robot

*** Variables ***
${URL}    https://learningprime.com.br/    
${BROWSER}    chrome

*** Keywords ***

Abrir o meu navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser