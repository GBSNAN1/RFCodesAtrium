*** Settings ***
Documentation    Atrium User's walk through

Resource    ../Resources/Common.robot
Resource    ../Resources/AtriumConnect.robot

#Test Setup    Begin Web Test    
#Test Teardown    End Web Test

Suite Setup       Begin Web Test
Suite Teardown    End Web Test
Test Setup        Open Login Page
Test Template     sign in user with invalid credentials

*** Variables ***
${START URL} =             https://atrium-uat.atradius.com/
${BROWSER} =               chromium
#${WRONG PASSWORD} =        Wrongpassword
${WRONG USER ID} =         GBHHUO9
#${USER ID} =               GBGMHP3    #GBKIQNR    #GBB2F75     #GBGMHP3    #GBKIQNR-ACBoffice9
${SECURITY QUESTION1} =    GladStone Primary School
${SECURITY QUESTION2} =    Audi A8 2022
${SECURITY QUESTION3} =    Cardiff
${PREV 13 PASSWORD} =      Cardiff0119    #ACBoffice7        #replace the password from ${SET CORRECT PASSWORD} before executing the mainfile.robot
${NUM ERR PASSWORD} =      Cardiffgg
${NO UPPCASE PASSWORD} =         cardiff007
${UNMATCHED PASSWORD} =         Cardiff555
${REPEAT PASSWORD} =       Cardiff22211
${SET CORRECT PASSWORD} =    Cardiff0122    #set a new password
${CHANGE EMAIL ADDRESS} =    changeemail912@atradius.com   
${CONFIRM WRONG EMAIL ADDRESS} =    changeemail2002@atradius.com 
${CHANGE PASSWORD} =        Cardiff0123         #set a new password
${FIRST NAME} =    Swapnil            
${LAST NAME} =    Nandy
${ATRADIUS ID} =    15008
${CUSTOMER REFERENCE} =    1st Month
${CREDIT LIMIT AMOUNT} =    1000
${NON PAYMENT TAX PERCENT} =    58

${USER ID}    id=username
${WRONG PASSWORD}    id=password

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
sign in user with invalid credentials
    [Arguments]    ${username}    ${password}
    #Type Text   id=username     ${USER ID}  
    #Type Text   id=password     ${WRONG PASSWORD}
    Type Text   ${USER ID}    ${username} 
    Type Text   ${WRONG PASSWORD}    ${password}
    Click       id=login
    Wait For Elements State    xpath=//div[@class='error_message']
    
#User starts the test Suite
    #Quick Run through Atrium
    #Deep Testing through Atrium
    #Run Demo