*** Settings ***
Documentation    Atrium User Policy Page
Library   Browser   timeout=70s  auto_closing_level=MANUAL    #enable_presenter_mode=True
Library    DocTest.VisualTest    take_screenshots = True    screenshot_format = jpg    show_diff = True    #enable_presenter_mode=True
Library    DocTest.PdfTest    
Library    OperatingSystem
#Library    DataDriver    list.csv     optimize_pabot=Equal
#Test Template    Compare Documents

#Resource    ../Common.robot
#Resource    ../AtriumConnect.robot


*** Keywords ***
policy page navigation
    Click    //span[@id='credit-management-name']//span[1]
    Wait For Elements State    //span[@class='oj-panel__tag oj-panel__tag--grey']
    Click    div[id='page-content'] span[id='undefinedpolicies-name'] span:nth-child(1)
    Wait For Elements State    //h2[@id='atr-policy-detail-title']
    Click    //a[@id='atr-refresh-data']//em
    Wait For Elements State    //td[normalize-space()='Japanese']
    Wait For Elements State    //td[normalize-space()='German']
    Wait For Elements State    //td[normalize-space()='English']
    Wait For Elements State    //td[normalize-space()='25/06/2022']
    Wait For Elements State    //td[normalize-space()='24/07/2022']
    Wait For Elements State    //td[normalize-space()='25/08/2022']
    Run Keyword And Continue On Failure    Take Screenshot    rf-S1pdf    fullPage=True    fileType=png   timeout=10s
    #Japanese
    #New Context          acceptDownloads=True
    #New Page             ${LOGIN_URL}
    #${dl_promise}          Promise To Wait For Download    /Candidate-SS/Downloads/J H CLISSOLD & SON LTD - 1426482 25062022.pdf
    CLick    //strong[normalize-space()='J H CLISSOLD & SON LTD - 1426482 25062022.pdf']
    #${file_obj}=           Wait For  ${dl_promise}
    #File Should Exist    ${file_obj}[saveAs]
    #Should Be True       ${file_obj.suggestedFilename}
    #New Browser    downloadsPath= /Candidate-SS/Downloads/CandyJ
    #CLick    //strong[normalize-space()='J H CLISSOLD & SON LTD - 1426482 25062022.pdf']
    #sleep    130s
    Run Keyword And Continue On Failure    Compare Pdf Documents    Candidate-SS/Candidate-Japanese.pdf    Candidate-SS/Downloads/J H CLISSOLD & SON LTD - 1426482 25062022.pdf
    
    #German
    CLick    //strong[normalize-space()='J H CLISSOLD & SON LTD - 1426482 25082022.pdf']
    #sleep    130s
    Run Keyword And Continue On Failure    Compare Pdf Documents    Candidate-SS/Candidate-German.pdf    Candidate-SS/Downloads/J H CLISSOLD & SON LTD - 1426482 25082022.pdf
    
    #English
    CLick    //strong[normalize-space()='J H CLISSOLD & SON LTD - 1426482 24072022.pdf']
    #sleep    130s
    Run Keyword And Continue On Failure    Compare Pdf Documents    Candidate-SS/Candidate-English.pdf    Candidate-SS/Downloads/J H CLISSOLD & SON LTD - 1426482 24072022.pdf
    
    #Screenshot comparision
    Run Keyword And Ignore Error    Compare Images    Candidate-SS/RF-pdf1.png    RC/browser/screenshot/rf-S1pdf.png
    
    
    #Check if list of strings exists in PDF File
    #@{strings}=    Create List    First String    Second String
    #PDF Should Contain Strings    ${strings}    Candidate.pdf
    
    #blob:https://atrium-uat.atradius.com/9e0d1481-f2b3-4627-8024-d9e8b28e04f8
    #69b87293-5bd4-4450-a31d-a01f5c40817d
    