*** Settings ***
Documentation    Probando Google Sheets.
Library    RPA.Cloud.Google
Suite Setup    Init Sheets    service_account.json

*** Variables ***
${SHEET_ID}    19dmE3nzjj50nZ-xVygzUBFc2-iNluW2FA6ZRcWTauig
#pongo el numero por que me lo colocaba una columna mas abajo
${SHEET_RANGE1}    A2:B4
${SHEET_RANGE2}    D:F

*** Tasks ***
Add values to the Google Sheet
    ${values}   Evaluate   [[11, 12, 13], ['aa', 'bb', 'cc']]
    #columna respetando el Rango
    ${result}=  Insert Sheet Values   ${SHEET_ID}  ${SHEET_RANGE1}  ${values}
    #fila
    ${result}=  Insert Sheet Values   ${SHEET_ID}  ${SHEET_RANGE2}  ${values}  ROWS
