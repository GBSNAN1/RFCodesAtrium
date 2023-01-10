*** Settings ***
Documentation    Atrium User Landing Page
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True    
Library    DocTest.VisualTest    take_screenshots = True    screenshot_format = jpg    show_diff = True    #enable_presenter_mode=True

#Resource    ../Common.robot
#Resource    ../AtriumConnect.robot


*** Keywords ***
# login to landing page
#     Type Text   id=username     ${USER ID}   
#     Type Text   id=password     ${SET CORRECT PASSWORD}  
#     Click       id=login
#     Wait For Elements State    //body[1]/div[1]/div[2]/div[1]/main[1]/oj-module[3]/h2[1]/div[1]/div[1]
#     Wait For Elements State    //label[normalize-space()='Policy ID']

currency in landing page-qr
#Hard coded for a single policy
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Egyptian Pound (EGP)']
    Wait For Elements State    //div[@id='total-active-amount']     #Egyptian
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Czech Crown (CZK)']
    Wait For Elements State    //div[@id='total-active-amount']     #Czech Crown (CZK)
    
currency in landing page
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Egyptian Pound (EGP)']
    Wait For Elements State    //strong[normalize-space()='33,497,134 (EGP)']     #Egyptian
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Czech Crown (CZK)']
    Wait For Elements State    //strong[normalize-space()='42,545,208 (CZK)']     #Czech Crown (CZK)
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Indian Rupee (INR)']
    Wait For Elements State    //strong[normalize-space()='139,826,961 (INR)']    #Indian
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Mexican Peso (MXN)']
    Wait For Elements State    //strong[normalize-space()='36,027,545 (MXN)']    #Mexican
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='Netherlands Antillian Guilder (ANG)']
    Wait For Elements State    //strong[normalize-space()='3,164,181 (ANG)']    #Netherlands
    Click    css=#oj-select-choice-currency > a
    Click    xpath=//div[@aria-label='UAE Dirham (AED)']
    Wait For Elements State    //strong[normalize-space()='6,491,731 (AED)']    #UAE

check for navigation
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    Click    id=policy-context-policy-id
    Wait For Elements State    //h2[@id='atr-policy-detail-title']
    Click    id=atr-back-policy-list
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    Click    id=total-active-value
    Wait For Elements State    //*[@id="main-content"]/main/oj-module[3]/div[1]/h2/span
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    #Click    id=total-decisions-value
    #Wait For Elements State    //*[@id="main-content"]/main/oj-module[3]/div[1]/h2/span
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    Click    id=atr-open-cases-link
    Wait For Elements State    //*[@id="main-content"]/main/oj-module[3]/div[1]/h2/span
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    #buttons check view-all-limits, export-all-limits, navigate-to-insights
    Click    id=navigate-to-view-all-limits
    Wait For Elements State    //*[@id="main-content"]/main/oj-module[3]/div[1]/h2/span
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    Click    id=export-all-limits
    Wait For Elements State    //h2[@id='import-page-title']
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    #Click    id=navigate-to-insights
    #Wait For Elements State    //*[@id="credit-management-title"]/div/div
    #Wait For Elements State    //*[@id="pt1:pt_pgl10"]/div[1]/span
    Click    //a[normalize-space()='View all cases']
    Wait For Elements State    //span[normalize-space()='Non payments']
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    Click    //a[normalize-space()='Export all cases']
    Wait For Elements State    //h2[@id='import-page-title']
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //*[@id="credit-management-title"]/div/div
    #Click    //*[@id="main-content"]/main/oj-module[3]/div[3]/div[2]/oj-module/div[1]/div[2]/a[3]
    #Wait For Elements State    //*[@id="credit-management-title"]/div/div
    