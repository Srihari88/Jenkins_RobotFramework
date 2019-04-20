*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Library         OperatingSystem
Suite Setup     Setup chromedriver

*** Test Cases ***
Test Case-1
    should be equal     1       2
    should be equal     Sri     Sri

Test Case-2
    should not be equal as integers  1      2

Test Case-3
    open browser    ${URL}      ${Chrome}
    close browser

*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  /usr/local/bin/chromedriver

*** Variables ***

${URL}          https://www.facebook.com/
${Chrome}       Chrome
