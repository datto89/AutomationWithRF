*** Settings ***
Documentation   Test add/update home visit
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***
Register phonecall
    Open Register phonecall form
    Select direction Incoming 
    Select Parties involved
    Select Subject
    Specify date and time for Register phonecall
    Add Message
    Switch on the toggle 'Internal' for Register phonecall form
    Change flow status for Register phonecall form
    Save for Register phonecall form
    Verify phonecall item in Activities list and Status Component

Update phonecall
    Open Register phonecall form again
    Switch off the toggle 'Internal' for Phonecall form
    Submit for Register phonecall form
    Make sure that Register phonecall form is closed 

Delete phonecall
    Open Register phonecall form again
    Delete phonecall item
    Verify phonecall item in Activities list
