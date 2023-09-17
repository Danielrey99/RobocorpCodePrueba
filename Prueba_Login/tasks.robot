*** Settings ***
Documentation       Prueba Login.
Library    RPA.Browser.Selenium    auto_close=${False}

*** Keywords ***
Open intranet robocorp
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form

*** Tasks ***
Open Browser And Log in
    Open intranet robocorp
    Log in
