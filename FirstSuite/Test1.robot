*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
#Library         OperatingSystem
#Suite Setup     Setup chromedriver

*** Test Cases ***
#Test Case-1
#    should be equal     1       2
#    should be equal     Sri     Sri
#
#Test Case-2
#    should not be equal as integers  1      2
#
#Test Case-3
#    open browser    ${URL}      ${Chrome}
#    input text      xpath=//input[@id='email']      sriharinaidu
#    input text      xpath=//input[@id='pass']       90101010
#    click element   xpath=//input[@type='submit']
#    close browser

Start Application
    Open Browser and navigate to URL
    Title of webPage

Login Valid user credentials
    Click Login button to redirect
    sleep           ${sleep}
    Login With Valid data

Verify the login details
    sleep               ${sleep}
    ${cur_URL}=         get location
    log to console      ${cur_URL}
    should be equal     ${cur_URL}      https://www.pitchvision.com/#/daisy
    sleep               ${sleep}

Portal Page Verification
    Move to Portal
    Verify the link
    sleep               ${sleep}
    Verify the portal options


Match status Page & Add the match status
    Redirect to Match Page
    Add match status
    sleep               ${sleep}
    Date selection
    Enter teamname
    Enter opposition
    Enter League
    Enter Venue
    Enter Match type
    Select match format
    select match grade
    select match result
    select match surface

Match status Batting details & Submit values
    select position
    Enter batting runs
    Enter balls faced
    select Dismissal type

Match stauts bowling details & Submit values
    Enter Overs
    Enter Bowling Runs
    Enter Wickets
    Enter wides
    Enter NoBalls

Match status Fielding details & submit values
    Enter catches
    Enter stumpings
    Enter Runouts
    Save the match
    sleep               10

Verifying the all data values entered
    wait until element is visible       ${Verify_data_values}
    @{alldatavalues}=      Get WebElements     ${Verify_data_values}
    :FOR     ${data_value}      IN      @{alldatavalues}
        \   ${entereddata}=     get text        ${data_value}
        \   log to console     ${entereddata}

Verify the all headers in the match status
    wait until element is visible       ${header_text}
    @{allheaders}=      Get WebElements     ${header_text}
    :FOR     ${status_head}      IN      @{allheaders}
        \   ${head}=     get text        ${status_head}
        \   log to console     ${head}


close Application
    close browser


*** Keywords ***
Open Browser and navigate to URL
    open browser   ${URL}   ${Browser}

Title of webPage
    ${curtitle}=        get title
    log to console      ${curtitle}
    should be equal     ${curtitle}     ${Title}

Click Login button to redirect
    click element      ${Login_link}


Login With Valid data
    input text       ${Login.Username}           daisy.dalia
    input text       ${Login.Password}           dentrain
    click button     ${Login.Submit}
#
#Move to Portal
#    click element    ${Profile}
#    sleep            ${sleep}
#    click element    ${Portal}
#
#Verify the link
#    ${portal_link}=     get location
#    log to console      ${portal_link}
#    should be equal     ${portal_link}      https://www.pitchvision.com/#/hub
#
#Verify the portal options
#    wait until element is visible            ${AllFeatures}
#    @{portal_features}=     Get WebElements  ${AllFeatures}
#    @{result}=       Create List
#    :FOR   ${locator}   IN    @{portal_features}
#        \       ${name}=    Get Text    ${locator}
#        \   log to console      ${name}
# #       \       Append To List    ${result}    ${name}
#    Log    ${result}
#
##Match Page Keywords
#Redirect to Match Page
#    click element      ${MatchStatus}
#    sleep               ${sleep}
#
#Add match status
#    click element       ${Addmatch}
#
#
#Date selection
#    click element       ${Date}
#    sleep               2
#    click element       ${SelectDate}
#
#
#Enter teamname
#    input text          ${TeamName}         World class match
#
#Enter opposition
#    input text          ${Opposition}       Gurgaon Gang Stars
#
#Enter League
#    input text          ${League}           GioneeStars
#
#Enter Venue
#    input text          ${Venue}            IPhoneUsers
#
#Enter Match type
#    input text          ${MatchType}        OneDay
#
#Select match format
#    Select From List By Label       ${MatchFormat}      T20
#
#select match grade
#    Select From List By Label       ${MatchGrade}       Club
#
#select match result
#    Select From List By Label       ${Result}           Lost
#
#select match surface
#    Select From List By Label       ${Surface}          Artificial Surface
#
#
## Batting values for the match
#select position
#    select from list by label       ${Position}         1
#
#Enter batting runs
#    input text                      ${Runs}             45
#
#Enter balls faced
#    input text                      ${Ballsfaced}       32
#
#select Dismissal type
#    select from list by label       ${Dismissals}       Bowled
#
#
## Enter bowling details for the match
#
#Enter Overs
#    input text              ${Overs}            5
#
#Enter Bowling Runs
#    input text              ${Runs}             23
#
#Enter Wickets
#    input text              ${wickets}          3
#
#Enter wides
#    input text              ${Wides}            4
#
#Enter NoBalls
#    input text              ${Noballs}          2
#
## Enter Fielding details
#
#Enter catches
#    input text              ${Catches}         3
#
#Enter stumpings
#    input text              ${Stumpings}        2
#
#Enter Runouts
#    input text              ${Run Outs}         1
#
#Save the match
#    click element           ${Save}
#

*** Variables ***

${URL}                        https://www.pitchvision.com
${Browser}                    Chrome
${Title}                      PitchVision - Live Local Matches | Cricket Tips & Techniques | Active Cricket Community

${Login_link}                 xpath=//a[text()='Log In']

${sleep}                      5

${Profile}                    xpath=//img[@ng-if='$root.profile_photo']
${Portal}                     xpath=//ul[@class='dropdown-menu dropdown-menu-right']/li[3]

${AllFeatures}                xpath=//div[@class='portal ng-isolate-scope']/div/div

&{Login}        Username=//form[@name='pvLoginform']/div/input[@name='username']
...             Password=//form[@name='pvLoginform']/div/input[@name='password']
...             Submit=//form[@name='pvLoginform']/div/input[@value='Log In']

#Match Page Variables

${MatchStatus}              xpath=//a[text()=' Match Stats']
${Addmatch}                 xpath=//button[@class='create-player-portal pull-right']
${Date}                     xpath=//input[@placeholder='YYYY/DD/MM']
${SelectDate}               xpath=//span[text()='16']
${TeamName}                 xpath=//input[@name='team']
${Opposition}               xpath=//input[@name='opposite']
${League}                   xpath=//input[@name='league']
${Venue}                    xpath=//input[@name='venue']
${MatchType}                xpath=//input[@name='match_type']
${MatchFormat}              xpath=//select[@name='match_style']
${MatchGrade}               xpath=//select[@name='match_grade']
${Result}                   xpath=//select[@name='result']
${Surface}                  xpath=//select[@name='surface_type']


#Batting details

${Position}             xpath=//select[@name='batting_position']
${Runs}                 xpath=//input[@name='batting_runs']
${Ballsfaced}           xpath=//input[@name='batting_balls_faced']
${Dismissals}           xpath=//select[@name='batting_how_out']


#bowling details

${Overs}                xpath=//input[@name='bowling_overs']
${Runs}                 xpath=//input[@name='bowling_runs']
${wickets}              xpath=//input[@name='bowling_wickets']
${Wides}                xpath=//input[@name='bowling_wides']
${Noballs}              xpath=//input[@name='bowling_no_balls']

#Fielding details
${Catches}              xpath=//input[@name='fielding_catches']
${Stumpings}            xpath=//input[@name='fielding_stumpings']
${Run Outs}             xpath=//input[@name='fielding_run_outs']

${Save}                 xpath=//button[@ng-click='savePlayerMatchStat(playerStat,statDt,pvMatchStat.$invalid)']

${header_text}          xpath=//table[@class='table table-bordered table-striped table-activity-calendar']/tbody/tr[2]/th

${Verify_data_values}   xpath=//table[@class='table table-bordered table-striped table-activity-calendar']/tbody/tr[3]/td


*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  /usr/local/bin/chromedriver

*** Variables ***

${URL}          https://www.facebook.com/
${Chrome}       Chrome
