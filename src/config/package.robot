*** Settings ***
Documentation       O package.robot será o nosso gerenciador de dependência do projeto
...                 sendo assim, precisamos apenas instanciar esse package.

Library             SeleniumLibrary
Library             DebugLibrary
Library             FakerLibrary    locale=pt-br
Resource            ../keywords/kws_login.robot
Resource            ../keywords/kws_cadastro.robot
Resource            ../pages/cadastro_page.robot
Resource            ../pages/home_page.robot
Resource            ../pages/login_home.robot
