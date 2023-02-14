*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description   #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${IMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/header/div/h6
${SIGNINPAGELOGO}   xpath=//*[@id="__next"]/form/div/div[1]/h5
${SIGNOUTBUTTON}    xpath=//*[text()='Sign out']
${LANGUAGEBUTTON}     xpath=//ul[2]/div[1]
${MAINPAGEBUTTONINPOLISH}     xpath=//*[text()='Strona główna']
${ADDPLAYERBUTTON}    xpath=//*[2][name()='a']
${ADDPLAYERTITLE}   xpath=//span[text()='Add player']
${NAMEFIELD}    xpath=//*[@name='name']
${SURNAMEFIELD}     xpath=//*[@name='surname']
${AGEFIELD}     xpath=//*[@name='age']
${MAINPOSITIONFIELD}     xpath=//*[@name='mainPosition']
${SUBMITADDPLAYERBUTTON}     xpath=//button[@type='submit']
${ADDEDPLAYERPOPUP}     xpath=//*[text() = 'Added player.']
${PLAYERSBUTTON}      xpath=//*[text()='Players']
${FILTERBUTTON}     xpath=//button[@title = 'Filter Table']
${CLOSEFILTERBUTTON}       xpath=//*[@aria-label = 'Close']
${NAMEFILTERFIELD}      xpath=//div[2]/div[1]/div/div/div/input
${SURNAMEFILTERFIELD}       xpath=//div[2]/div[1]/div/div/input
${FILTERSTITLE}     xpath=//*[text()='FILTERS']
${RESULTOFFILTERING}        xpath=//*[@id='MUIDataTableBodyRow-0']
${LEVELFIELD}       xpath=//*[@name='level']
${SUBMITEDITPLAYERBUTTON}     xpath=//button[@type='submit']
${SAVEDPLAYERPOPUP}     xpath=//*[text()='Saved player.']
${MATCHESBUTTON}        xpath=//*[text()='Matches']
${ADDMATCHBUTTON}        xpath=//main/a/button/span[1]
${ADDMATCHTITLE}        xpath=//span[text()="Adding match player Lava Bora"]
${MYTEAMFIELD}      xpath=//*[@name='myTeam']
${MYENEMYTEAMFIELD}     xpath=//*[@name='enemyTeam']
${MYTEAMSCOREFIELD}     xpath=//*[@name='myTeamScore']
${MYENEMYTEAMSCOREFIELD}        xpath=//*[@name='enemyTeamScore']
${DATEFIELD}        xpath=//*[@name='date']
${SUBMITADDMUTCHBUTTON}      xpath=//button[@type='submit']
${ADDEDMATCHPOPUP}      xpath=//*[text() = 'Added match.']


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    [Teardown]  Close Browser

Log out of the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Sign out button
    Assert login page
    [Teardown]  Close Browser

Change The Language
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Language button
    Assert dashboard in polish
    [Teardown]  Close Browser

Add a player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Add player button
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit button
    Assert Add Player Page
    [Teardown]  Close Browser

Edit player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Players button
    Click on the Filter button
    Type in name filter field
    Type in surname filter field
    Click on the Close Filter button
    Сlick on the result of filtering
    Type in level
    Click On The Submit Edit button
    Assert Edit Player Page
    [Teardown]  Close Browser

Add a match
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Players button
    Click on the Filter button
    Type in name filter field
    Type in surname filter field
    Click On The Close Filter Button
    Сlick on the result of filtering
    Сlick on the Matches button
    Сlick on the Add match button
    Type in my team
    Type in enemy team
    Type in my team score
    Type in enemy team score
    Type in type in date
    Click On The Submit match button
    Assert Add Match Page
    [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Click on the Sign in button
    Click Element    ${SIGNINBUTTON}
Click on the Sign out button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${SIGNOUTBUTTON}
Click on the Language button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${LANGUAGEBUTTON}
Click on the Add player button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${ADDPLAYERBUTTON}
Click on the Submit button
    Wait Until Element Is Visible    ${ADDPLAYERTITLE}
    Click Element    ${SUBMITADDPLAYERBUTTON}
Click on the Players button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${PLAYERSBUTTON}
Click on the Filter button
    Wait Until Element Is Visible    ${FILTERBUTTON}
    Click Element    ${FILTERBUTTON}
Click on the Close Filter button
    Sleep    5
    Click Element    ${CLOSEFILTERBUTTON}
Сlick on the result of filtering
    Wait Until Element Is Visible    xpath=//*[text()="Lava"]
    Wait Until Element Is Visible    xpath=//*[text()="Bora"]
    Click Element    ${RESULTOFFILTERING}
Click On The Submit Edit button
    Click Element    ${SUBMITEDITPLAYERBUTTON}
Сlick on the Matches button
    Wait Until Element Is Enabled    ${MATCHESBUTTON}
    Click Element    ${MATCHESBUTTON}
Сlick on the Add match button
    Wait Until Element Is Enabled    ${ADDMATCHBUTTON}
    Click Element   ${ADDMATCHBUTTON}
    Wait Until Element Is Visible    ${ADDMATCHTITLE}
Click On The Submit match button
    Click Element    ${SUBMITADDMUTCHBUTTON}
Type in email
    Input Text      ${IMAILINPUT}   user04@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Type in name
    Input Text      ${NAMEFIELD}   Lava
Type in surname
    Input Text      ${SURNAMEFIELD}   Bora
Type in age
    Input Text      ${AGEFIELD}   13.02.1993
Type in main position
    Input Text      ${MAINPOSITIONFIELD}   Front
Type in name filter field
    Input Text    ${NAMEFILTERFIELD}   Lava
Type in surname filter field
    Input Text    ${SURNAMEFILTERFIELD}   Bora
Type in level
    Input Text    ${LEVELFIELD}     Professional
Type in my team
    Input Text    ${MYTEAMFIELD}    LariFa
Type in enemy team
    Input Text    ${MYENEMYTEAMFIELD}   TimFa
Type in my team score
    Input Text    ${MYTEAMSCOREFIELD}   3
Type in enemy team score
    Input Text    ${MYENEMYTEAMSCOREFIELD}  2
Type in type in date
    Input Text    ${DATEFIELD}  13.02.2023
Assert dashboard
    wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot     login.png
Assert login page
    wait until element is visible   ${SIGNINPAGELOGO}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     logout.png
Assert dashboard in polish
    wait until element is visible   ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot     changelanguage.png
Assert add player page
    wait until element is visible   ${ADDEDPLAYERPOPUP}
    Title Should Be    Edit player Lava Bora
    Capture Page Screenshot     addedplayer.png
Assert edit player page
    wait until element is visible    ${SAVEDPLAYERPOPUP}
    Title Should Be    Edit player Lava Bora
    Capture Page Screenshot    savedplayer.png
Assert add match page
    wait until element is visible    ${ADDEDMATCHPOPUP}
    Title Should Be    Matches player Lava Bora
    Capture Page Screenshot    addedmatch.png








