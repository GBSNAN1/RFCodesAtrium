*** Settings ***
Documentation    Atrium User SignIn
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True


*** Variables ***
${Atradius ID}
${CUSTOMER REFERENCE}
${CREDIT LIMIT AMOUNT}
${NON PAYMENT TAX PERCENT}

*** Keywords ***
user starts buyer search
    Click    //oj-button[@data-click-tracker='[Header] User has navigated to buyer search']//span[@slot='endIcon']
    Wait For Elements State    //div[@id='__oj_zorder_container']//p[1]
    Click    //span[normalize-space()='New buyers']
    Wait For Elements State    //div[@id='__oj_zorder_container']//p[1]
    Click    //div[@id='oj-select-choice-country']
    Click    //div[@aria-label='United Kingdom'] 
    Click    //oj-select-one[@value='{{identifierType}}']//a[@role='presentation']
    Click    //div[@aria-label='Atradius ID']
    Fill Text    //oj-input-text[@value='{{identifierValue}}']//input[@type='text']    ${Atradius ID}  
    Click    //oj-button[@on-oj-action='[[onIdentifierSearch]]']//span[contains(text(),'Search')]
    Wait For Elements State    //span[normalize-space()='Buyer details']
    Click    //span[normalize-space()='Buyer details']
    Wait For Elements State    //body[1]/div[2]/div[2]/div[1]/main[1]/oj-module[3]/oj-module[1]/oj-accordion[1]/oj-collapsible[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/oj-label[1]/div[1]/label[1]

User applies for credit Limit
    Click    //span[normalize-space()='Apply']
    Wait For Elements State    //div[normalize-space()='Apply for cover']
    Click    //div[@id='oj-select-choice-atr-cover-type']
    Click    //div[@aria-label='Credit limit']
    Wait For Elements State    //label[@for='atr-credit-limit-start-date|input']
    Type Text    //input[@id='atr-credit-limit-amount|input']    ${CREDIT LIMIT AMOUNT}
    Type Text    //input[@id='atr-customer-ref|input']    ${CUSTOMER REFERENCE}
    Click    //oj-button[@id='atr-credit-limit-apply-amend']//div[@class='oj-button-label']
    Wait For Elements State    //div[@class='small-cover-dialog oj-dialog-body--info oj-dialog-body']
    Click    //a[@id='atr-small-cover-details-link']
    Wait For Elements State    //span[normalize-space()='Cover Details']
    Click    //span[@id='credit-management-name']//span[1]


User applies for Non-payments
    Click    //oj-button[@data-click-tracker='[Non payment summary] Submit new case']//div
    Wait For Elements State    //h2[@id='atr-non-payment-title']
    Click    //oj-select-one[@value='{{currentRowData.postingType}}']//a[@role='presentation']
    Click    //div[@aria-label='Payment']
    Type Text    //oj-input-text[@value='{{currentRowData.amount}}']//input[@type='text']    ${CREDIT LIMIT AMOUNT}    
    Click    //oj-select-one[@value='{{currentRowData.currencyCode}}']//a[@role='presentation']
    Click    //div[@aria-label='GBP']
    Type Text    //oj-input-text[@value='{{currentRowData.taxAmount}}']//input[@type='text']    ${NON PAYMENT TAX PERCENT}
    Click    //span[@title='Select Date.']
    Click    //div[contains(@role,'presentation')]//div[contains(@role,'presentation')]//a[contains(@role,'button')][normalize-space()='2022']
    Click    //a[normalize-space()='2020']
    Click    //a[@aria-label='Prev']
    Click    //a[@aria-label='Prev']
    Click    //body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/a[1]        #selecting date in calendar
    Click    //oj-input-date[contains(@value,'{{currentRowData.dueDateObservable}}')]//span[contains(@title,'Select Date.')]
    Click    //a[@aria-label='Prev']
    Click    //a[@aria-label='Prev']
    Click    //a[normalize-space()='19']
    Type Text    //oj-input-text[@value='{{currentRowData.reference}}']//input[@type='text']    ${CUSTOMER REFERENCE}
    Click    //em[@class='fas fa-check oj-table-icon--green']
    Click    //div[@id='oj-select-choice-atr-covered-by']//a[@role='presentation']
    Click    //div[@aria-label='Payment Experience']
    Click    //input[@name='atr-accept-terms']
    Click    //oj-button[@id='atr-submit-case-button']//div[@class='oj-button-label']
    Click    //span[normalize-space()='Yes']
    #Wait For Elements State    
    







    
