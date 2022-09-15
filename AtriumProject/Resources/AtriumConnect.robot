*** Settings ***
Documentation    Atrium Users uses the web

Resource     ../Resources/PO/login.robot
Resource     ../Resources/PO/landing.robot
Resource     ../Tests/mainfile.robot

*** Keywords *** 
Run through Atrium
    Login Page
    Landing Page

Login Page
    login.sign in user with invalid credentials
    login.sign in user with one letter invalid credentials 
    login.Forgot password
    login.Language
    login.Contact us
    login.sign in user with valid credentials

Landing Page
    #landing.login to landing page
    landing.account settings
    landing.user profile
    


