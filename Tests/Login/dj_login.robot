*** Settings ***
Documentation     A test case for dj is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        ../../Resources/resources.robot

*** Test Cases ***
The DJ should be able to see Homepage.
    [TAGS]    dj, login, positive

    Open MBC Web Page   
    Title Should Be     ${TITLE} 
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[1]/input      ${DJ_EMAIL}
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[2]/input      ${DJ_PASSWORD}
    Click Button    LOG IN
    Logout  
    Close Browsers

The DJ should be able to see alert "Incorrect e-mail or password." (negative testing).
    [TAGS]    dj, login, negative

    Open MBC Web Page   
    Title Should Be     ${TITLE} 
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[1]/input      ${ADMIN_INVALID_EMAIL}
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[2]/input      ${ADMIN_INVALID_PASSWORD}
    Click Button    LOG IN
    Wait
    Alert Should Be Present     Incorrect e-mail or password.
    Wait
    Close Browsers    