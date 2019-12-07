*** Settings ***
Documentation   Test add/update letter 
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***
Send SMS with templates that are set receipients
    Open send SMS form
    Select Text message template
    Wait Addressees field and Message field are populated in SMS form
    Switch on the toggle 'Internal' for send SMS form
    Change flow status for send SMS form
    Send SMS
    Verify SMS item in Activities list and Status Component
    
Send SMS with templates that aren't set receipients
    Open send SMS form
    Select Text message template that isn't set receipients
    Select Addressees for SMS form
    Change flow status (collection) for send SMS form 
    Send SMS
    Verify SMS item in Activities list and Status Component (Collection)

Delete SMS item in Activities list
    Make sure that Send SMS form is closed 
    Open SMS item again
    Delete SMS item
    Verify SMS item in Activities list after deleting