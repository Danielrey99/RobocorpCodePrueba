*** Settings ***
Documentation       Prueba usar hoja calculo.
Library    RPA.Browser.Selenium    auto_close=${False}
Library    RPA.HTTP
Library    RPA.Excel.Files

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
    [Arguments]    ${sales_rep}
    Input Text    firstname    ${sales_rep}[First Name]
    Input Text    lastname    ${sales_rep}[Last Name]
    Select From List By Value    salestarget    ${sales_rep}[Sales Target]
    Input Text    salesresult    ${sales_rep}[Sales]
    Click Button    Submit
Fill the form using the data from the excel file
    Open Workbook    SalesData.xlsx
    ${sales_reps}=    Read Worksheet As Table    header=True
    Close Workbook

    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill and submit the form for one person    ${sales_rep}
        
    END

*** Tasks ***
Open Browser And Log in
    Open intranet robocorp
    Log in
    Download the excel file
    Fill the form using the data from the excel file