*** Settings ***
Documentation   Test add/update letter 
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***

Send letter
    Open send letter form
    Select date
    Choose letter template
    Select Addressees for Letter form
    Switch on the toggle 'Internal' for Letter form
    Change flow status for Letter form
    Create letter
    Submit letter
    Verify Letter item in Activities list and Status Component

Delete letter item in Activities list
    Make sure that Send letter form is closed 
    Open letter item again 
    Delete letter item
    Verify Letter item in Activities list