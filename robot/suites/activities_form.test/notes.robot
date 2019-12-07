*** Settings ***
Documentation   Test add/update note
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***

Add note
    Open Note form
    Specify date
    Add Note
    Switch on the toggle 'Internal'
    Change flow status
    Submit for Note form
    Verify Note item in Activities list and Status Component 
    
Update note
    Open Note form again
    Choose another date
    Change note
    Switch off the toggle 'Internal'
    Submit for Note form
    Verify Note item in Activities list and Status Component after updating 


    