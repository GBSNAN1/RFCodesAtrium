*** Settings ***
Documentation    Atrium User Start and End session 

#Resource     AtriumConnect.robot
Resource     PO/login.robot
Resource     PO/landing.robot
Resource     PO/profile.robot
Resource     PO/policy.robot
Resource     PO/buyersearch.robot

*** Variables ***
${START URL}     
${Browser}   

*** Keywords ***
Load Test Setup
    Begin Web Test
    End Web Test
Begin Web Test
    #[Arguments]    ${Browser}    ${START URL}
    New Browser      ${Browser}     headless=False
    New Context      viewport={'width': 1600, 'height': 800}
    #Set Viewport Size   1600     800

Open Login Page
    New Page         ${START URL}

End Web Test
    Close Browser