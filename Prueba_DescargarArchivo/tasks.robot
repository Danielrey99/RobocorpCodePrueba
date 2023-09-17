*** Settings ***
Documentation       Prueba Descargar usando HTTP.
Library    RPA.Browser.Selenium    auto_close=${False}
Library    RPA.HTTP

*** Keywords ***
Open intranet robocorp
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form
Download the excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx

*** Tasks ***
Open Browser And Log in
    Open intranet robocorp
    Log in
    Download the excel file
