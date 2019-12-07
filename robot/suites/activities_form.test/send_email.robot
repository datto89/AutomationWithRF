*** Settings ***
Documentation   Test add/update email 
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***
Send email with templates that are set receipients
    Open send email form
    Check the From field
    Select Email template
    Wait Addressees field and Message field are populated in email form
    Switch on the toggle 'Internal' for send email form
    Add attachments
    Change flow status for send email form
    Send email
    Verify email item in Activities list and Status Component

Send email with templates that aren't set receipients
    Open send email form
    Check the From field
    Select Email template that isn't set receipients
    Select Addressees and add additional email addresses for Email form
    Check Message block
    Add attachments with selecting document from activities
    Change flow status for send email form to Collection stage
    Send email
    Verify email item in Activities list and Status Component after changing to Collection stage

Delete email item in Activities list
    Make sure that Send email form is closed 
    Open email item again 
    Delete email item
    Verify email item in Activities list after deleting