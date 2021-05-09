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
    Display The notifications page
    Create Notification
    sleep   @{sleep_time}[0]
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/header
#   First title in the row
    ${Get_title} =    Get Text    xpath://*[@id="root"]/div/div[2]/div/div/div/div[2]/div[1]/div[1]
    Should Be Equal    ${notif}[title]     ${Get_title}
    Location Should Be    ${URl}notif
    Click Delete in chosen notification
#    Logout
#    Close Browser