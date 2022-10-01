*** Settings ***
Library     FakerLibrary


*** Variables ***
${NOME}     Maria


*** Test Cases ***
Contar de 0 a 9
    [Tags]    contar
    Contar de 0 a 9

Contando a lista de FRUTAS
    [Tags]    fruta
    Percorrer itens de uma lista

Exercicio do FOR
    [Tags]    for
    Exercicio do FOR

imprimindo os paises
    [Tags]    paises
    imprimir lista de paises

Imprimindo nome por decisao
    [Tags]    decisao
    Tomar decisoes


*** Keywords ***
Contar de 0 a 9
    FOR    ${count}    IN RANGE    0    10
        Log To Console    ${count}
    END

Percorrer itens de uma lista
    @{FRUTAS}    Create List    Morango    Banana    Abacaxi    Uva    Melanciarob
    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log To Console    ${FRUTA}
    END

Exercicio do FOR
    FOR    ${COUNT}    IN RANGE    0    11
        Log To Console    Estou no numero    ${COUNT}
    END

imprimir lista de paises
    @{PAISES}    Create List    BRASIL    HOLANDA    MEXICO    ARGENTINA    JAPAO
    FOR    ${PAIS}    IN    @{PAISES}
        Log To Console    Eu vou conhecer o pais ${PAIS}
    END

Tomar decisoes
    IF    '${NOME}' == 'Maria'
        Log To Console    Vou fazer isso só quando for Maria
    ELSE IF    '${NOME}' =="Joao"
        Log To Console    Vou fazer isso só quando for João
    ELSE
        Log To Console    Vou fazer isso só quando eu quiser
    END

Exercicios do IF
