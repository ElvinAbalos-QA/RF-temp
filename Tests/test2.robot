*** Settings ***
Library     OperatingSystem

*** Keywords ***
Log My Username
    Log     ${DICTIONARY}[username]

Log My Password
    Log     ${DICTIONARY}[password]

Log My Username and My Password 1
    Log     ${DICTIONARY}[username]
    Log     ${DICTIONARY}[password]

*** Variables ***
${my_var}       my_var_here
${my_var2}       //input[@title="Search"]

@{LIST}     test1   test2   test3   test4
&{DICTIONARY}       username=test_101   password=pwd

*** Test Cases ***
Test2
    [Tags]     demo    demo2
#     Log       ${my_var2}
#     Log       ${LIST}[2]
    Log My Username and My Password 1