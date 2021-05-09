*** Settings ***
Documentation     A test case for admin is able to view the users page
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        ../../Resources/resources.robot

*** Test Cases ***
The Admin should be able to see Game page.
    [TAGS]    admin, view, network

    Open Browser In Google Chrome
    Input Email and Password
    Click Button    LOG IN
    Display the network page
#    Logout
#    Close Browser