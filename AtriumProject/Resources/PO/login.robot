*** Settings ***
Documentation    Atrium User SignIn
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True  
Resource    ../../Tests/mainfile.robot


*** Keywords ***
sign in user with invalid credentials
    Type Text   id=username     ${USER ID}  
    Type Text   id=password     ${WRONG PASSWORD}
    Click       id=login
    Wait For Elements State    xpath=//div[@class='error_message']

sign in user with one letter invalid credentials 
    Type Text   id=username     ${USER ID}  
    Type Text   id=password     ${WRONG PASSWORD}
    Click       id=login
    Wait For Elements State    xpath=//div[@class='error_message']

Forgot password
    Click        css=a[href='../atr-identity/faces/ForgotPassword?resource_url=https%3A%2F%2Fatrium-uat.atradius.com%2F']
    Wait For Elements State    xpath=//span[@class='catalanaBold title']
    Click        id=pt1:r1:0:pt1:cb1
    #Image comparison
    #wrong user id
    Fill Text    id=pt1:r1:0:pt1:it1::content    ${WRONG USER ID}
    Click        id=pt1:r1:0:pt1:cb1
    Wait For Elements State    //div[contains(text(),'We are unable to reset the password. Please contac')]
   
    Fill Text    id=pt1:r1:0:pt1:it1::content    ${USER ID}
    Click        id=pt1:r1:0:pt1:cb1
    Wait For Elements State    css=div[id='pt1:r1:1:pt1:pgl2'] div:nth-child(1) span:nth-child(1)
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    id=d1_msgDlg::tb
    #complete all answers
    Click        css=div[id='d1_msgDlg_cancel'] a[role='button']
    Wait For Elements State    css=div[id='pt1:r1:1:pt1:pgl2'] div:nth-child(1) span:nth-child(1)
    
    #complete all answers
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it1::content']    ${SECURITY QUESTION1}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it4::content']    ${PREV 13 PASSWORD}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it5::content']    ${PREV 13 PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[@class='x15p']
    Click    id=d1_msgDlg::close

    #previous 13 passwords
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it1::content']    ${SECURITY QUESTION1}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it2::content']    ${SECURITY QUESTION2}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it3::content']    ${SECURITY QUESTION3}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it4::content']    ${PREV 13 PASSWORD}
    Fill Text    xpath=//input[@id='pt1:r1:1:pt1:it5::content']    ${PREV 13 PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[@class='x15p']
    Click    id=d1_msgDlg::close
    

    #password doesn't match
    Type Text    id=pt1:r1:1:pt1:it4::content    ${PREV 13 PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${UNMATCHED PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[@class='x15p']
    Click    id=d1_msgDlg::close

    #number error
    Type Text    id=pt1:r1:1:pt1:it4::content    ${NUM ERR PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${NUM ERR PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[@class='x15p']    #number error
    Click    xpath=//body[1]/div[2]/form[1]/div[2]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/a[1]

    #Password must contain at least 1 uppercase letter(s)
    Type Text    id=pt1:r1:1:pt1:it4::content    ${NO UPPCASE PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${NO UPPCASE PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[contains(text(),'Password must contain at least 1 uppercase letter(')]
    Click    xpath=//body[1]/div[2]/form[1]/div[2]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/a[1]

    #Any particular character in the password must not repeat
    Type Text    id=pt1:r1:1:pt1:it4::content    ${UNMATCHED PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${UNMATCHED PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[contains(text(),'Any particular character in the password must not ')]
    Click    xpath=//body[1]/div[2]/form[1]/div[2]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/a[1]

    #Any particular character in the password must not repeat more than 2 times
    Type Text    id=pt1:r1:1:pt1:it4::content    ${REPEAT PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${REPEAT PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    xpath=//div[contains(text(),'Any particular character in the password must not ')]
    Click    xpath=//body[1]/div[2]/form[1]/div[2]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/table[1]/tbody[1]/tr[3]/td[2]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/a[1]


    #Password changes succesfully
    Type Text    id=pt1:r1:1:pt1:it4::content    ${SET CORRECT PASSWORD}
    Type Text    id=pt1:r1:1:pt1:it5::content    ${SET CORRECT PASSWORD}
    Click        id=pt1:r1:1:pt1:cb1
    Wait For Elements State    //*[@id="pt1:r1:2:pt1:pgl1"]/div[3]/span
    #Click    //*[@id="pt1:r1:2:pt1:gl1"]    //a[@class='xgw']
    Click    xpath=//*[@id='pt1:r1:2:pt1:gl1']
    Wait For Elements State    xpath=//body/div[@id='body']/div/div[3]
    #Image comparison
    #Wait For Elements State    id=d1_msgDlg::_ccntr
    #Click    id=d1_msgDlg::close
    #//*[@id="pt1:r1:2:pt1:gl1"]
    #Wait For Elements State    xpath=//div[@class='x21j x1a6']     #all thecriteria

Language
    Click    css=#medium
    Select Options By    css=#medium        value        de_DE
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div
    Select Options By    css=#medium        value        it_IT
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div
    Select Options By    css=#medium        value        nl_NL
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div
    Select Options By    css=#medium        value        pt_BR
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div
    Select Options By    css=#medium        value        zh_CN
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div
    Select Options By    css=#medium        value        en_GB
    Wait For Elements State    xpath=//*[@id="body"]/div[2]/div[3]/div


Contact us
    Click    //a[@href='https://www.atradius.com/contactus/']
    Go To    https://www.atradius.com/contactus
    Wait For Elements State    xpath=//*[@id="h1"]
    Click    css=#showCST
    Go Back   

sign in user with valid credentials
    Type Text   id=username     ${USER ID}   
    Type Text   id=password     ${SET CORRECT PASSWORD}  
    Click       id=login
    Wait For Elements State    css=#header > div > div > div > div.header__logo.oj-sm-only-hide
    Wait For Elements State    //body[1]/div[1]/div[2]/div[1]/main[1]/oj-module[3]/h2[1]/div[1]/div[1]
    Wait For Elements State    //label[normalize-space()='Policy ID']


