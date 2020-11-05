*** Settings ***
#Documentation       This is my first test case
#Library     SeleniumLibrary
Library     OperatingSystem

*** Keywords ***

*** Variables ***
${URL}          http://facebook.com
${BROWSER}      Chrome

*** Test Cases ***
Open Facebook
    [Tags]      demo    demo2
    # Open Browser    ${URL}      ${BROWSER}
    # Maximize Browser Window
    # Close All Browsers
    # robot --randomize ALL Tests -> to be able to test not to pesticide
    Log     This is sample test case