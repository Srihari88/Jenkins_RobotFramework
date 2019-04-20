*** Settings ***
Documentation    Suite description

*** Test Cases ***
Test Case-1
    should be equal     1       2
    should be equal     Sri     Sri

Test Case-2
    should not be equal as integers  1      2

*** Keywords ***
