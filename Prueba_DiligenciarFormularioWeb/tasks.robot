*** Settings ***
Documentation       Prueba Completar Formulario.
Library    RPA.Browser.Selenium    auto_close=${False}
Library    RPA.HTTP

*** Keywords ***
Open intranet robocorp
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form
Download the excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx
Fill and submit the form for one person
    Input Text    firstname    Camilo
    Input Text    lastname    Duarte
    Select From List By Value    salestarget    35000
    Input Text    salesresult    1500

*** Tasks ***
Open Browser And Log in
    Open intranet robocorp
    Log in
    Download the excel file
    Fill and submit the form for one person