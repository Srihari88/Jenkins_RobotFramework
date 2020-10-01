*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
#Library         OperatingSystem
#Suite Setup     Setup chromedriver
Library          keywords.robot
*** Keywords ***

*** Test Cases ***
Test Case-1
    should be equal     1       1
    should be equal     Sri     Sri

Test Case-2
    should not be equal as integers  1      2

Test Case-3
    open browser    ${URL}      ${Chrome}
    input text      xpath=//input[@id='email']      sriharinaidu
    input text      xpath=//input[@id='pass']       90101010
    click element   xpath=//input[@type='submit']

Test Case-4
    ${title}=           Get Title
    log to console      ${title}


Test Case-5
    ${get text}=      Get text      //div[text()='Create a new account']
    log to console     {get text}
    close browser
