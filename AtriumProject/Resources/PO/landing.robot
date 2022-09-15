*** Settings ***
Documentation    Atrium User SignIn
Library   Browser   timeout=70s  auto_closing_level=MANUAL    enable_presenter_mode=True  
Resource    ../../Tests/mainfile.robot


*** Keywords ***
# login to landing page
#     Type Text   id=username     ${USER ID}   
#     Type Text   id=password     ${SET CORRECT PASSWORD}  
#     Click       id=login
#     Wait For Elements State    //body[1]/div[1]/div[2]/div[1]/main[1]/oj-module[3]/h2[1]/div[1]/div[1]
#     Wait For Elements State    //label[normalize-space()='Policy ID']

account settings
    Click    //body/div/div/oj-module[@config='[[headerConfig]]']/header[@role='banner']/div/div/oj-toolbar[@role='toolbar']/oj-menu-button[@chroming='half']/button/div[1]
    Click    //span[normalize-space()='Account settings']
    Wait For Elements State    //h2[normalize-space()='Account Settings']
    Wait For Elements State    //a[normalize-space()='User profile']

user profile
    #Change email address
    Click       //a[normalize-space()='User profile']
    Wait For Elements State    //a[normalize-space()='User profile']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'No details have been updated')]
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it2::content"]    ${CHANGE EMAIL ADDRESS}    
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it3::content"]    ${CONFIRM WRONG EMAIL ADDRESS}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'The email addresses do not match, please check and')] 
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it3::content"]    ${CHANGE EMAIL ADDRESS}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your details have been updated')]
    Click    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a

    #Change password
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it4::content"]    ${WRONG PASSWORD}
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it13::content"]    ${CHANGE PASSWORD}
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it5::content"]    ${CHANGE PASSWORD}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[normalize-space()='Error']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a

    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it4::content"]     ${SET CORRECT PASSWORD}  
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it13::content"]    ${CHANGE PASSWORD}
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it5::content"]     ${WRONG PASSWORD}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'The passwords do not match, please re-enter and su')]
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a

    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it4::content"]     ${SET CORRECT PASSWORD}    
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it13::content"]    ${CHANGE PASSWORD}
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it5::content"]     ${CHANGE PASSWORD}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your details have been updated')]
    Click    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a

    #Security questions
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc1::content"]    value    2    
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc2::content"]    value    4
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc3::content"]    value    5
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it6::content"]    Dog
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it7::content"]    Ben Stokes
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it8::content"]    George
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your details have been updated')]
    Click    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a

    #Personal Details
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it11::content"]    ${FIRST NAME}
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it12::content"]    ${LAST NAME}
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your details have been updated')]
    Click    css=#user-profile-iframe-container > iframe >>> //*[@id="d1_msgDlg_cancel"]/a
    ${FIRST1 NAME} =    Get Text     css=#user-profile-iframe-container > iframe >>> //body[1]/div[2]/form[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/div[1]/div[1]/div[1]/div[14]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[2]/td[2]
    ${LAST1 NAME} =    Get Text     css=#user-profile-iframe-container > iframe >>> //body[1]/div[2]/form[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/div[1]/div[1]/div[1]/div[14]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[3]/td[2]
    ${FIRST1 NAME} =    Convert To String    ${FIRST1 NAME}
    ${LAST1 NAME} =    Convert To String    ${LAST1 NAME}
    Should Be Equal    ${FIRST NAME}    ${FIRST1 NAME}
    Should Be Equal    ${LAST NAME}    ${LAST1 NAME}

    # Display Language
    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='English']    value     1    #deutsch
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[normalize-space()='Persönliche Details']
    
    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='Deutsch']    value     4    #Espanol
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[normalize-space()='Detalles personales']

    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='Español']    value     11    #Polski
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[contains(text(),'Pytania zabezpieczające')]

    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='Polski']    value     19    #Turkce
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[contains(text(),'Kişisel Bilgiler')]

    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='Türkçe']    value     2    #english
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[normalize-space()='Personal Details']

Currency
    Select Options By    oj-select-choice-currency    value    
    Click    oj-select-choice-currency

