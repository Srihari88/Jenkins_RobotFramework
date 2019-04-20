*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
#Library         OperatingSystem
#Suite Setup     Setup chromedriver

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
    close browser




*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  /usr/local/bin/chromedriver

*** Variables ***

${URL}          https://www.facebook.com/
${Chrome}       Chrome
