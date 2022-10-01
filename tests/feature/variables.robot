*** Variables ***
${NOME}             Ewerton Max
@{FRUTAS}           Banana    Maça    Melancia    Abacaxi
&{CARRO_MODELO}     marca=Nissa    cor=Preto    modelo=Sentra SL    ano=2016


*** Test Cases ***
Validar soma de dois numeros
    [Tags]    teste
    Somar dois numeros    10    10
    Somar o "463" mais o "463"


*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    RETURN    ${SOMA}

Somar o "${NUM_A}" mais o "${NUM_B}"
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
