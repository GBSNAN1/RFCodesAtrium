*** Settings ***
Documentation    Atrium User's walk through

Resource    ../Resources/Common.robot
Resource    ../Resources/AtriumConnect.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Variables ***
${START URL} =             https://atrium-uat.atradius.com/ 
${BROWSER} =               chromium
${WRONG PASSWORD} =        Wrongpassword
${WRONG USER ID} =         GBHHUO9
${USER ID} =               GBGMHP3
${SECURITY QUESTION1} =    GladStone Primary School
${SECURITY QUESTION2} =    Audi A8 2022
${SECURITY QUESTION3} =    Cardiff
${PREV 13 PASSWORD} =      ACBoffice101        #replace the password from ${SET CORRECT PASSWORD} before executing the mainfile.robot
${NUM ERR PASSWORD} =      Cardiffgg
${NO UPPCASE PASSWORD} =         cardiff007
${UNMATCHED PASSWORD} =         Cardiff555
${REPEAT PASSWORD} =       Cardiff22211
${SET CORRECT PASSWORD} =         ACBoffice200    #set a new password
${CHANGE EMAIL ADDRESS} =    changeemail@atradius.com   
${CONFIRM WRONG EMAIL ADDRESS} =    changeemail202@atradius.com 
${CHANGE PASSWORD} =        ACBoffice201         #set a new password
${FIRST NAME} =    Annie
${LAST NAME} =    Marie


*** Test Cases ***
User starts the test Suite
    Run through Atrium
     