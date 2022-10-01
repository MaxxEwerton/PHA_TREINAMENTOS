*** Settings ***


*** Variables ***
&{CADASTRO}
...             BTN_LOGIN=//a[@href='/login']
...             INPUT_CONFISENHA=id=spree_user_password_confirmation
...             CRIAR=//input[@value="Criar" and @type="submit"]
...             CONFIRMAÇÃO=//a[@href='/account']
