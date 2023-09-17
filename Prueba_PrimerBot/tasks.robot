*** Settings ***
Documentation       Abrir navegador web.
Library    RPA.Browser.Selenium    auto_close=${False}

*** Keywords ***
Abrir Pagina web
    Open Available Browser    https://robocorp.com/docs

*** Tasks ***
Ingresar a la web
    Abrir Pagina web