*** Settings ***
Documentation     A test case for admin is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        ../../Resources/resources.robot

*** Test Cases ***
The Admin should be able to see Homepage.
    [TAGS]    admin, login, positive

    Open MBC Web Page   
    Title Should Be     ${TITLE} 
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[1]/input      ${ADMIN_EMAIL}
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[2]/input      ${ADMIN_PASSWORD}
    Click Button    LOG IN
    Wait Until Element Is Visible       xpath://*[@id="root"]/div/div[1]/div[2]/button
    Click Button      xpath://*[@id="root"]/div/div[1]/div[2]/button
    Wait
    Click Button        Yes
    Wait
    Location Should Be      ${URL}   
    Close Browsers

The Admin should be able to see alert "Incorrect e-mail or password." (negative testing).
    [TAGS]  admin, login, negative

    Open MBC Web Page   
    Title Should Be     ${TITLE} 
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[1]/input      ${ADMIN_INVALID_EMAIL}
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[2]/input      ${ADMIN_INVALID_PASSWORD}
    Click Button    LOG IN
    Wait
    Alert Should Be Present     Incorrect e-mail or password.
    Wait
    Close Browsers    