*** Settings ***
Library     SeleniumLibrary
Library     String

*** Keywords ***
#Open Browser in (Google and Firefox) Browser
#    FOR     ${browsers}     IN      @{BROWSER}
#        Open browser    ${URL}   ${browsers}
#        Maximize Browser Window
#        Title Should Be     ${TITLE}
#        Input Email and Passwords
#        Click Button    LOG IN
#    END

Run Keyword Until Success
    [Arguments]    ${KW}    @{KWARGS}
    Wait Until Keyword Succeeds    10s      1s  ${KW}    @{KWARGS}

Open Browser in Google Chrome
    Open browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Title Should Be     ${TITLE}

Display the network page
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[1]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[1]
    ${Header_text} =   Get Text    xpath://*[@id="root"]/div/div[2]/div/div[1]
    Should Be Equal    NETWORK LIST     ${Header_text}

Display the dj page
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[3]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[3]
    ${Header_text} =   Get Text    xpath:/html/body/div/div/div[2]/div/header/div[1]
    Should Be Equal    List of Station DJ     ${Header_text}

Display The sponsors page
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[6]
    Run Keyword Until Success    Click Element       xpath://*[@id="root"]/div/div[1]/div[2]/a[6]
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/header/div[1]
    ${Header_text} =    Get Text    xpath://*[@id="root"]/div/div[2]/div[2]/header/div[1]
    Should Be Equal    List of Sponsors     ${Header_text}
    Location Should Be    ${URl}sponsors

Display The notifications page
    Run Keyword Until Success    Display the sidenav header     //*[@id="root"]/div/div[1]/div[2]/a[7]
    Run Keyword Until Success    Click the chosen page      //*[@id="root"]/div/div[1]/div[2]/a[7]
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/header/div[1]
    ${Header_text} =    Get Text    xpath://*[@id="root"]/div/div[2]/div/header/div[1]
    Should Be Equal    NOTIFICATIONS     ${Header_text}
    Location Should Be    ${URl}notif

Display the sidenav header
    [Arguments]    ${field}
    Wait Until Page Contains Element    xpath:${field}

Click the chosen page
    [Arguments]    ${field}
    Click Element       xpath:${field}

Click Delete in chosen sponsor
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[1]
    ${get} =   Get Element Count    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[${get}]/div[4]/div/button
    Run Keyword Until Success    Wait Until Page Contains Element    xpath:/html/body/div[2]/div    # display modal
    Run Keyword Until Success    Click Yes Button

Click Delete in chosen notification
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/div/div/div[2]/div[1]/div[5]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div/div/div/div[2]/div[1]/div[5]/div/p
    Run Keyword Until Success    Click Cancel Button

    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/div/div/div[2]/div[1]/div[5]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div/div/div/div[2]/div[1]/div[5]/div/p
    Run Keyword Until Success    Click Yes Button

Click Edit in chosen sponsor
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[1]
    ${get} =   Get Element Count    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[${get}]/div[4]/div/a
    Run Keyword Until Success    Click Back Button
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[${get}]/div[4]/div/a
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[${get}]/div[4]/div/a

    Input Field    //*[@id="root"]/div/div[2]/div[2]/div[1]/div[1]/div/div/input    updated sponsor     # Enter name
    Input Field    //*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/div/div/input   This is a description here updated     # Enter name
    Select the status       //*[@id="root"]/div/div[2]/div[2]/div[2]/div/div/select     2
    Click Edit Button

Display the game page
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[4]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[4]

Create Sponsor
    Run Keyword Until Success    Click Button    ADD SPONSOR
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div[2]/h1
    Input Field    //*[@id="root"]/div/div[2]/div[2]/div[1]/div[1]/div/div/input   created sponsor     # Enter name
    Input Field    //*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/div/div/input   This is a description here created     # Enter name
    Select the status       //*[@id="root"]/div/div[2]/div[2]/div[2]/div/div/select     1
    Click Add Button

Create Notification
    Run Keyword Until Success    Click Button    CREATE
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/h2
    Click Button    CANCEL
    Display The notifications page
    Run Keyword Until Success    Click Button    CREATE
    Run Keyword Until Success    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/h2
    Click Button    SAVE
    Alert Should Be Present     Please fill all fields
    Input Field    //*[@id="root"]/div/div[2]/div[1]/div/input      &{notif}[title]
    Input Field    //*[@id="root"]/div/div[2]/div[2]/textarea     &{notif}[message]
    Click Button    SAVE

Create a DJ
    Run Keyword Until Success    Click Button   ADD DJWait
    Run Keyword Until Success    Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div/h1

    ${Header_text} =   Get Text    xpath:/html/body/div/div/div[2]/div/h1
    Should Be Equal     CREATE DJ ACCOUNT       ${Header_text}

    Run Keyword Until Success    Wait Until Page Contains Element       xpath://*[@id="root"]/div/div[2]/div/div[3]/div[1]/form/div//*[@id="exampleForm.SelectCustom"]
    Run Keyword Until Success    Choose Network    //*[@id="root"]/div/div[2]/div/div[3]/div[1]/form/div//*[@id="exampleForm.SelectCustom"]     10
    Run Keyword Until Success    Choose Station     //*[@id="root"]/div/div[2]/div/div[3]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]    1
    Browse File     //*[@id="root"]/div/div[2]/div/div[2]/form/div/div/input     /Users/qatest/Downloads/MBClogo.png
    Input Field     /html/body/div/div/div[2]/div/div[4]/div[1]/div/div/input    Stuart here
    Input Field    /html/body/div/div/div[2]/div/div[4]/div[2]/div/div/input    Lodi Jeremy 2
    Input Field    /html/body/div/div/div[2]/div/div[5]/div[1]/div/div/input    aprilAllen2@mailinator.com
    Input Field    /html/body/div/div/div[2]/div/div[5]/div[2]/div/div/input    Password@123
    Run Keyword Until Success    Click Button    ADD
    Alert Should Be Present    Email already exists

Click Cancel Button
    Click Button    Cancel

Click Add Button
    Click Button    ADD

Click Edit Button
    Click Button    EDIT

Click Yes Button
    Click Button    Yes

Select the status
    [Arguments]     ${field}    ${value}
    Select From List By Index    xpath:${field}      ${value}

Input Field
    [Arguments]    ${field}     ${value}
    Input Text    xpath:${field}    ${value}

Click Back Button
    Click Button       BACK

Delete Sponsor
    Click Button    xpath://*[@id="root"]/div/div[2]/div[2]/div/div/div[2]/div[6]/div[4]/div/button     # Delete

Create the Game
    Run Keyword Until Success    Click Button    CREATE GAME
    Run Keyword Until Success    Choose Network      //*[@id="root"]/div/div[2]/div/div/div[3]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]        6
    Run Keyword Until Success    Choose Station    //*[@id="root"]/div/div[2]/div/div/div[4]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]     1
    Run Keyword Until Success    Choose DJ      //*[@id="root"]/div/div[2]/div/div/div[5]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]    1
    Run Keyword Until Success    Choose Sponsor     //*[@id="root"]/div/div[2]/div/div/div[6]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]    1
    Run Keyword Until Success   Type Of Game    //*[@id="root"]/div/div[2]/div/div/div[7]/div[2]/form/div//*[@id="exampleForm.SelectCustom"]    1
    Run Keyword Until Success    Title Of Game      //*[@id="root"]/div/div[2]/div/div/div[8]/div[2]/form/div/input     Test GAME here
    Run Keyword Until Success    Number Of Winner       //*[@id="root"]/div/div[2]/div/div/div[9]/div[2]/form/div/input     1
    Run Keyword Until Success    Price      //*[@id="root"]/div/div[2]/div/div/div[10]/div[2]/form/div/input        1000
    Run Keyword Until Success    Browse File        //*[@id="root"]/div/div[2]/div/div/div[12]/div[1]/div[2]/form/div/div/input     /Users/qatest/Downloads/ccb-9.png   # Game Background Choose file
    Run Keyword Until Success    Browse File        //*[@id="root"]/div/div[2]/div/div/div[12]/div[2]/div[2]/form/div/div/input     /Users/qatest/Downloads/winnerPromptBg 2.png   # Winner Prompt Background Choose file
    Run Keyword Until Success    Select Date
    Input The Start Time
    Select 8 Pie's
    Select 8 Color Picker
    Redemption Details
    DTI Permit Number
    Click The Create Game Button
    Display The Game Page
    Location Should Be    ${URL}game

Choose Network
    [Arguments]    ${field}     ${data}
    Select From List By Index    xpath:${field}     ${data}  # Easy Rock

Choose Station
    [Arguments]    ${field}     ${data}
    Select From List By Index    xpath:${field}     ${data}  # Easy Rock Manila

Browse File
    [Arguments]    ${field}     ${data}
    Choose File    xpath:${field}       ${data}

Choose DJ
    [Arguments]    ${field}     ${data}
    Select From List By Index    xpath:${field}     ${data}

Choose Sponsor
    [Arguments]    ${field}    ${data}
    Select From List By Index    xpath:${field}     ${data}

Type of Game
    [Arguments]    ${field}     ${data}
    Select From List By Index    xpath:${field}     ${data}

Title of Game
    [Arguments]    ${field}     ${data}
    Input Text    xpath:${field}     ${data}

Number of Winner
    [Arguments]    ${field}     ${data}
    Input Text    xpath:${field}     ${data}

Price
    [Arguments]    ${field}     ${data}
    Input Text    xpath:${field}     ${data}

Select Date
    Execute Javascript    window.scrollTo(0,2500)
    Click Prev Month
    Click Next Month
    Click Element    ${xpath_of_Date}
    ${date} =   Get Element Attribute   ${xpath_of_Date}    data-value

Click Prev Month
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[2]/div/div/div/table/thead/tr[1]/th[1]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[2]/div/div/div/table/thead/tr[1]/th[1]

Click Next Month
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[2]/div/div/div/table/thead/tr[1]/th[3]
    Run Keyword Until Success    Click Element    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[2]/div/div/div/table/thead/tr[1]/th[3]

Input the Start Time
    Run Keyword Until Success    Input Text    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[3]/div/div/input     ${time}
    ${time} =   Get Element Attribute    xpath://*[@id="root"]/div/div[2]/div/div/div[13]/div/div/div[3]/div/div/input      value
    Should Be Equal As Strings    ${time}   ${time}

Select 8 Pie's
#    Execute Javascript    window.scrollTo(0,2500)
    Select From List By Index    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/div[1]/form/div//*[@id="exampleForm.SelectCustom"]    0   # Select 8 Pie's
    Input Text    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[1]/td[2]/input    WINNER      # Winner Pie text

Select 8 Color Picker
    Execute Javascript    window.scrollTo(0,2500)
    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[1]/td[4]/button
    CLick Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[1]/td[4]/div/div/div[2]/div/div[1]/span[6]/div  # color yellow

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[2]/td[4]/button
    CLick Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[2]/td[4]/div/div/div[2]/div/div[1]/span[19]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[3]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[3]/td[4]/div/div/div[2]/div/div[1]/span[8]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[4]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[4]/td[4]/div/div/div[2]/div/div[1]/span[21]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[5]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[5]/td[4]/div/div/div[2]/div/div[1]/span[35]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[6]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[6]/td[4]/div/div/div[2]/div/div[1]/span[3]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[7]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[7]/td[4]/div/div/div[2]/div/div[1]/span[18]/div

    Click Button    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[8]/td[4]/button
    Click Element   xpath://*[@id="root"]/div/div[2]/div/div/div[14]/table/tbody/tr[8]/td[4]/div/div/div[2]/div/div[1]/span[32]/div

Redemption Details
    Input Text    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/div[2]/div[2]/textarea   Kunin mo na ang iyong redemption details

DTI Permit Number
    Input Text    xpath://*[@id="root"]/div/div[2]/div/div/div[14]/div[3]/div[2]/input  DTI_123409

Click the Create Game Button
    Click Button    CREATE GAME

Tap Use default gamebackground
    Run Keyword Until Success    Input Text    xpath://*[@id="root"]/div/div[2]/div/div/div[8]/div[2]/form/div/input     12345   # Price

Display the users page
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[5]
    Click Element    xpath://*[@id="root"]/div/div[1]/div[2]/a[5]
    Wait Until Element Contains     xpath://*[@id="root"]/div/div[2]/div/header     List of Users
    Click Element       xpath://*[@id="root"]/div/div[2]/div/header
    ${Header_text} =   Get Text    xpath://*[@id="root"]/div/div[2]/div/header
    Should Be Equal     List of Users       ${Header_text}
    Wait Until Page Contains Element    xpath://*[@id="root"]/div/div[2]/div/div/footer/span[2]
    ${pagi_text} =   Get Text    xpath://*[@id="root"]/div/div[2]/div/div/footer/span[2]
    ${pagi_text} =   Remove String    ${pagi_text}   1-10 of
    Should Be Equal    ${pagi_text}     ${pagi_text}

    # Loop Click the (Next icon) in users pagination until 9
#    FOR    ${i}    IN RANGE     10
#           Exit For Loop If    ${i} == 9
#           Click Element    xpath://*[@id="pagination-next-page"]
#    END
#    Log    Done na!!!

Wait
    Sleep    @{sleep_time}[0]

You're Already Logged-in
    Alert Should Be Present        You're already logged-in in other device/s.

Input Email and Password
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[1]/div/input      ${ADMIN_EMAIL}
    Input Text      xpath://*[@id="root"]/div/form/div[1]/div[2]/div/input      ${ADMIN_PASSWORD}

Login Successfully
    Location Should Be    ${URL}game

Logout
    Run Keyword Until Success       Click Button      LOG OUT
    Wait
    Run Keyword Until Success       Click Button        Yes
    Wait

#Close Browsers
#    Close All Browsers

*** Variables ***
#${URL}          http://mbc-admin.bliimo.com/
${URL}          http://localhost:3000/
${BROWSER}      chrome
${TITLE}        MBC Web Admin
${ADMIN_EMAIL}        adminelvin@gmail.com
${ADMIN_PASSWORD}     Password@123
${DJ_EMAIL}     rufo.gabrillo61@gmail.com
${DJ_PASSWORD}     Password@123
${ADMIN_INVALID_EMAIL}      rufs
${ADMIN_INVALID_PASSWORD}   pass
${DJ_INVALID_EMAIL}      dev
${DJ_INVALID_PASSWORD}   pass
@{sleep_time}   5s  10s  15s
${xpath_of_Date}    xpath://*[@id="root"]/div/d`iv[2]/div/div/div[13]/div/div/div[2]/div/div/div/table/tbody/tr[4]/td[5]
${time}     0330PM
&{notif}    title=Created Notif     message=Message here
