*** Settings ***
Documentation    Atrium User Start and End session
Resource     ../Resources/PO/login.robot
Resource     ../Tests/mainfile.robot


*** Keywords ***
Begin Web Test
    New Browser      ${Browser}     headless=False
    New Context      viewport={'width': 1600, 'height': 800}
    New Page         ${START URL}

    
   
       
    #Set Viewport Size   1600     800

End Web Test
    Close Browser