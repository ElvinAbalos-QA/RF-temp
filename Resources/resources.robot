*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

Open MBC Web Page
    Open browser    ${URL}   ${BROWSER}
    Maximize Browser Window

Wait
    Sleep    ${sleep_time}    

Logout  
    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[1]/div[2]/button
    Click Button      xpath://*[@id="root"]/div/div[1]/div[2]/button
    Wait
    Click Button        Yes
    Wait
    Location Should Be      ${URL}     

Close Browsers
    Close All Browsers

*** Variables ***
${URL}          http://mbc-admin.bliimo.com/
${BROWSER}      chrome
${TITLE}        MBC Web Admin
${ADMIN_EMAIL}        dev.bliimo@gmail.com 
${ADMIN_PASSWORD}     Password@123
${DJ_EMAIL}     rufo.gabrillo61@gmail.com
${DJ_PASSWORD}     Password@123
${ADMIN_INVALID_EMAIL}      rufs
${ADMIN_INVALID_PASSWORD}   pass
${DJ_INVALID_EMAIL}      dev
${DJ_INVALID_PASSWORD}   pass
${SLEEP}=   Set Variable    Sleep   5s
${sleep_time}   5s