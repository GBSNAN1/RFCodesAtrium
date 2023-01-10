*** Settings ***
Documentation    Atrium Users uses the web to navigate different pages of Atrium


Resource    PO/login.robot
Resource    PO/landing.robot
Resource    PO/policy.robot
Resource    PO/profile.robot
Resource    PO/buyersearch.robot


#Resource    Common.robot
#Resource    ../Pre-run/Resources/PO/Docdownload.robot


*** Keywords *** 
Run Demo
    sign in user with invalid credentials

Quick Run through Atrium
    sign in user with valid credentials
    currency in landing page-qr
    check for navigation
    account settings
    user profile-qr
    Display Language-qr
    account settings
    account defaults
    account settings
    communication preferences
    user starts buyer search
    User applies for credit Limit

Deep Testing through Atrium
    Login Page
    Landing Page
    #Profile Page
    #Policy Page

Login Page
    #login.sign in user with invalid credentials
    #login.sign in user with one letter invalid credentials 
    #login.Forgot password
    #login.Language
    #login.contact us
    login.sign in user with valid credentials

Landing Page
    #landing.login to landing page
    #landing.account settings
    #landing.user profile
    landing.currency in landing page
    landing.check for navigation 
    #landing.account defaults
    #landing.communication preferences

Profile Page
    profile.account settings
    profile.user profile
    profile.account settings
    profile.account defaults
    profile.account settings
    profile.communication preferences

Policy Page
    policy.policy page navigation