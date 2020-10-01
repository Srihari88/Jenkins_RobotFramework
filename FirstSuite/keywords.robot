*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  /usr/local/bin/chromedriver

*** Variables ***

${URL}          https://www.facebook.com/
${Chrome}       Chrome
