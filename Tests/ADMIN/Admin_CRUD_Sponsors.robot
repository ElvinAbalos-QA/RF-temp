*** Settings ***
Documentation     A test case for admin is able to view the users page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        ../../Resources/resources.robot

*** Test Cases ***
The Admin should be able to see Sponsors page.
    [TAGS]    admin, sponsor, view

    Open Browser In Google Chrome
    Input Email and Password
    Click Button    LOG IN
    Display The Sponsors Page
    Create Sponsor
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/header/div[1]
    ${Header_text} =    Get Text    xpath://*[@id="root"]/div/div[2]/div[2]/header/div[1]
    Should Be Equal    List of Sponsors     ${Header_text}
    Location Should Be    ${URl}sponsors
    Click Edit in chosen sponsor
    Click Delete in chosen sponsor
    Wait
    Logout
    Wait
    Close Browser