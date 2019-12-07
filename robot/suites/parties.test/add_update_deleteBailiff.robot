*** Settings ***
Documentation   Test add/update/delete claimant
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./parties.resource.robot
Resource        ./parties.resource.bailiff.robot



Suite Setup      Setup Parties Test Suite                            
# Suite Teardown   Close Browser

*** Test Cases ***

Add new bailiff (company) from contact list
    Open Add party form
    Select role and company in Add party form for bailiff
    Verify company information after adding bailiff to party form 
    Submit
    Check the Bailiff Company (added from contact list) item in the Parties List

Add new bailiff (contact) from contact list
    Open Add party form
    Select role and contact in Add party form for bailiff
    Verify information after adding bailiff to party form
    Add date of birth and gender for bailiff
    Submit
    Check the Bailiff Contact (added from contact list) item in the Parties List

Add new bailiff (company) from party form 
    Open Add party form
    Add new bailiff
    Complete Add bailiff (company) form
    Submit Add bailiff (company) form
    Check the Bailiff Company (added from party form) item in the Parties List


Add new bailiff (contact) from party form
    Open Add party form
    Add new bailiff
    Complete Add bailiff (contact) form
    Submit Add bailiff (contact) form
    Check the Bailiff Contact (added from party form) item in the Parties List

Delete bailiff (contact)
    Open bailiff contact (added from contact list) item again
    Delete bailiff contact item
    Verify bailiff contact item in parties list after deleting

Update bailiff (company)
    Open bailiff company (added from party form) item again
    Update information for bailiff company 
    Switch on the toggle 'Save changes to contact list' in bailiff company
    Submit for updating company
    Check the Bailiff Company item in the Parties List after updating
    Open Contact page and verify changes in bailiff