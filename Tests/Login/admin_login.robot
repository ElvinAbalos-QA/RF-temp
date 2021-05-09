*** Settings ***
Documentation     A test case for admin is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        ../../Resources/resources.robot
*** Variables ***
&{Dictionary}       username=testuser   password=Password@123

*** Keywords ***
Log my username
    Log

*** Test Cases ***
#The Admin should be able to see Homepage.
#    [TAGS]    admin, login, positive
#
#    Open Browser In Google Chrome
#    Input Email and Password
#    Click Button    LOG IN
#    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[5]
#    Click Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[5]
#

Test
