*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Keywords ***

Open Home Page
    Open browser    ${URL}   ${BROWSER}
    Maximize Browser Window

Close Browsers
    Close All Browsers