*** Settings ***
Documentation    Probando Google Sheets.
Library    RPA.Cloud.Google
Suite Setup    Init Sheets    service_account.json

*** Variables ***
${SHEET_ID}    19Gr4YVSWxybSQ5vPxz2KHDGbzC8pos9NwkXHN1-B3n8
${SHEET_RANGE}    A2:D51

*** Tasks ***
Read values from the Google Sheet
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    #"values" es para asegurarse de que se han obtenido valores
    IF    "values" in ${spreadsheet_content}
        #${values}=    Set Variable    ${spreadsheet_content["values"]}
        #mostar uno por uno
        FOR    ${value}    IN    @{spreadsheet_content["values"]}
            Log    ${value}
        END
        #mostrar todos a la vez
        Log Many    ${spreadsheet_content["values"]}
    END
Insert values in Google Sheet
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    IF    "values" in ${spreadsheet_content}
        Insert Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}    ${spreadsheet_content["values"]}    ROWS
    END
*** Tasks ***
Mostrar primer valor de cada fila
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    IF    "values" in ${spreadsheet_content}
        FOR    ${row}    IN    @{spreadsheet_content["values"]}
            Log    ${row}[0]
        END
    END