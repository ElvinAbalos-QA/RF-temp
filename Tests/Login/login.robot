*** Settings ***
Documentation     A test case with a test for user is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource        keywords.robot
Resource        variables.robot

*** Test Cases ***
The User should be able to see Homepage.
    Open Home Page   
    Title Should Be     Goldilocks
    Page Should Contain Element     xpath=/html/body/div[2]     # Area Selector modal
    Select From List By Label       id=  
    # Close Browsers

