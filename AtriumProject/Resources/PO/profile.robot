*** Settings ***
Documentation    Atrium User Profile
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True
Library    DocTest.VisualTest    take_screenshots = True    screenshot_format = jpg    show_diff = True    #enable_presenter_mode=True

#Resource    ../Common.robot
Resource    ../AtriumConnect.robot
#Resource    ../../Tests/mainfile.robot

*** Variables ***
${CHANGE EMAIL ADDRESS}
${CONFIRM WRONG EMAIL ADDRESS}
${CHANGE PASSWORD}
${FIRST NAME}
${LAST NAME}
${tick_check}

*** Keywords ***
account settings   
    Click    //span[@class='oj-icon fas fa-lg fa-user-circle oj-button-icon oj-end']
    Click    //span[normalize-space()='Account settings']
    #Wait For Elements State    //h2[normalize-space()='Account Settings']
    Wait For Elements State    //h2[@id='account-settings-page']
    
user profile-qr
    Click       //a[normalize-space()='User profile']
    Wait For Elements State    //h2[@id='user-profile-title']
    #Wait For Elements State    //a[normalize-space()='User profile']
    #Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    
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

    #Security questions
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc1::content"]    value    2    
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc2::content"]    value    4
    Select Options By    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:soc3::content"]    value    5
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it6::content"]    Dog
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it7::content"]    Ben Stokes
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it8::content"]    Jones
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

user profile
    #Change email address  
    Click       //a[normalize-space()='User profile']
    Wait For Elements State    //h2[@id='user-profile-title']
    #Wait For Elements State    //a[normalize-space()='User profile']
    #Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    
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
    Fill Text    css=#user-profile-iframe-container > iframe >>> //*[@id="pt1:r1:0:it8::content"]    Jones
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

Display Language-qr
    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='English']    value     1    #deutsch
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[normalize-space()='Persönliche Details']
        
    Select Options By    css=#user-profile-iframe-container > iframe >>> //select[@title='Deutsch']    value     2    #English
    Click    css=#user-profile-iframe-container > iframe >>> //button[@onclick='this.focus();return false;']
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //div[contains(text(),'Your preferred display language has been changed. ')]
    Click    css=#user-profile-iframe-container > iframe >>> // *[@id="d1_msgDlg_cancel"]/a
    Wait For Elements State    css=#user-profile-iframe-container > iframe >>> //span[normalize-space()='Personal Details']

    #extra lines of code to get past the error where the id=back-to-settings disappears
    Click    //span[@id='credit-management-name']//span[1]
    Click    css=div[id='page-content'] span[id='undefinedpolicies-name'] span:nth-child(1)
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //body[1]/div[2]/div[2]/div[1]/main[1]/oj-module[3]/h2[1]/div[1]/div[1]

Display Language
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

    Click    //span[@id='credit-management-name']//span[1]
    Click    id=back-to-settings
    Click    //span[@id='credit-management-name']//span[1]
    Click    css=div[id='page-content'] span[id='undefinedpolicies-name'] span:nth-child(1)
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //body[1]/div[2]/div[2]/div[1]/main[1]/oj-module[3]/h2[1]/div[1]/div[1]
        
    # Click    id=back-to-settings
    # Wait For Elements State    //*[@id="account-settings-page"]
    # Scroll To    //*[@id="credit-management"]/div/a/span    vertical = top
    # Click    //*[@id="credit-management"]/div/a/span
    # Click    //*[@id="undefinedpolicies-name"]/span
    # Click    //*[@id="credit-management"]/div/a/span
    # Wait For Elements State    //*[@id="credit-management-policy-panel"]/oj-module/div[1]/span

account defaults
    Click    //a[normalize-space()='Account defaults']
    Wait For Elements State    //h2[@id='account-defaults-title']
    Click    //*[@id="oj-select-choice-default-country"]
    Click    //div[@aria-label='United Kingdom']
    Run Keyword And Ignore Error    Click    //div[@id='oj-select-choice-atr-default-identifier']
    Run Keyword And Ignore Error    Click    xpath=//div[@aria-label='VAT number']
    Run Keyword And Ignore Error    Click    //oj-select-one[@value='{{selectedPagination}}']//a[@role='presentation']
    Run Keyword And Ignore Error    Click    //div[@aria-label='50']
    Click    //oj-button[@id='save-preferences-button']//div[@class='oj-button-label']
    Wait For Elements State    //*[@id="account-defaults-notification"]/div[1]
    Run Keyword And Ignore Error    Click    //div[@id='oj-select-choice-atr-default-identifier']

communication preferences
    Click    //a[normalize-space()='Communication preferences']
    Wait For Elements State    //h2[@id='communication-and-export-preferences-page-title']
    Click    //a[@id='communication-and-export-preferences-expand-collapse-button'] 
    Wait For Elements State    //*[@id="oj-collapsible-collapsible-policy-content"]/div/div[7]/div
    #Get BoundingBox    //*[@id="main-content"]/main/oj-module[3]
    Run Keyword And Continue On Failure    Take Screenshot    rf-S1-tick    fullPage=True    fileType=png   timeout=10s
    Run Keyword And Ignore Error    Compare Images    Candidate-SS/RF-C-tick.png    RC/browser/screenshot/rf-S1-tick.png    resize_candidate=False    #placeholder_file=area_mask_top_bottom.json    check_text_content=True    #Run Keyword And Ignore Error
    Check Checkbox    //input[@name='radiobuttonsetid-online-and-email']
    Check Checkbox    //input[@name='radiobuttonsetid-online-only'] 
    Click    id=option-select-all-buyer-cover
    Click    //label[@for='option-select-all-claims|cb']    
    Click    id=option-select-all-declarations
    Click    id=option-select-all-policy
    Click    id=communication-and-export-preferences-page-title
    Wait For Elements State    id=communication-and-export-preferences-page-title
    Run Keyword And Continue On Failure    Take Screenshot    rf-S2-untick    fullPage=True    fileType=png   timeout=10s
    Run Keyword And Ignore Error    Compare Images    Candidate-SS/RF-C-untick.png    RC/browser/screenshot/rf-S2-untick.png    check_text_content=True    #resize_candidate=False    #placeholder_file=area_mask_top_bottom.json    check_text_content=True
    Click    //oj-button[@id='save-comms-preferences']//div[@class='oj-button-label']
    Check Checkbox    //input[@id='option-select-all-buyer-cover|cb']    True    
    Check Checkbox    //input[@name='checkboxset-select-all-claims']    True
    Check Checkbox    //input[@id='option-select-all-declarations|cb']    True
    Check Checkbox    //input[@id='option-select-all-policy|cb']    True
    Click    //oj-button[@id='save-comms-preferences']//div[@class='oj-button-label']
    Click    //*[@id="communication-and-export-preferences-expand-collapse-button"]
    Wait For Elements State    //*[@id="communication-and-export-preferences-notification"]/div[1]


# back to account settings
#     Click    id=back-to-settings
#     Wait For Elements State    //*[@id="account-settings-page"]

