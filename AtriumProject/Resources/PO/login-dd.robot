*** Settings ***
Documentation    Atrium User SignIn
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True   
Library    DataDriver    datadriven.xlsx    sheet_name=Sheet1    dialect: str = Excel-EU    

*** Variables ***
${START URL}
${USERNAME}
${PASSWORD}

*** Keywords ***
Input username
    Type Text   ${USERNAME}     ${username}
    Type Text   ${PASSWORD}     ${password}
    Click       id=login
    Wait For Elements State    xpath=//div[@class='error_message']