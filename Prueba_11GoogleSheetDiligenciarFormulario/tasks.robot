*** Settings ***
Documentation       Diligenciar formulario usando Google Sheets.
Library    RPA.Cloud.Google
Library    RPA.Browser.Selenium    auto_close=${False}
Library    RPA.PDF
Suite Setup    Init Sheets    service_account.json

*** Variables ***
${SHEET_ID}    19Gr4YVSWxybSQ5vPxz2KHDGbzC8pos9NwkXHN1-B3n8
${SHEET_RANGE}    A2:D51

*** Keywords ***
Open intranet robocorp
    Open Available Browser    https://robotsparebinindustries.com/#/
Log in
    Input Text    username    maria
    Input Password    password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form
Fill and submit the form for one person
    [Arguments]    ${row}
    Input Text    firstname    ${row}[0]
    Input Text    lastname    ${row}[1]
    Select From List By Value    salestarget    ${row}[3]
    Input Text    salesresult    ${row}[2]
    Click Button    Submit
Fill the form using the data from the Google Sheet file
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    IF    "values" in ${spreadsheet_content}
        FOR    ${row}    IN    @{spreadsheet_content["values"]}
            Fill and submit the form for one person    ${row}
        END
    END
Collect the results
    Screenshot    css:div.sales-summary    ${OUTPUT_DIR}${/}sales_summary.png
Export the table as PDF
    Wait Until Element Is Visible    id:sales-results
    ${sales_results_html}=    Get Element Attribute    id:sales-results    outerHTML
    Html To Pdf    ${sales_results_html}    ${OUTPUT_DIR}${/}sales_sresults.pdf
Log out and close browser
    Click Button    logout
    Sleep    5s    #No recomendado usar Sleep.Esta solo para comprobar que hace el logout correctamente
    Close Browser

*** Tasks ***
Open Browser and log in
    Open intranet robocorp
    Log in
Fill out form and take screenshot
    Fill the form using the data from the Google Sheet file
    Collect the results
Create pdf and log out
    Export the table as PDF
    [Teardown]    Log out and close browser