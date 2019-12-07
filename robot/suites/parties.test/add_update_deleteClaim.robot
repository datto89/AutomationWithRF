*** Settings ***
Documentation   Test add/update/delete claimant
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./parties.resource.robot
Resource        ./parties.resource.claimant.robot



Suite Setup      Setup Parties Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***

Add new claimant (company) from contact list
    Open Add party form
    Select role and company in Add party form for claimant
    Verify company information after adding claimant to party form 
    Submit
    Check the Claimant Company (added from contact list) item in the Parties List

Add new claimant (contact) from contact list
    Open Add party form
    Select role and contact in Add party form for claimant
    Verify information after adding claimant to party form
    Add date of birth and gender for claimant 
    Submit
    Check the Claimant Contact (added from contact list) item in the Parties List

Add new claimant (company) from party form 
    Open Add party form
    Add new claimant
    Complete Add claimant (company) form
    Submit Add claimant (company) form
    Check the Claimant Company (added from party form) item in the Parties List


Add new claimant (contact) from party form
    Open Add party form
    Add new claimant
    Complete Add claimant (contact) form
    Submit Add claimant (contact) form
    Check the Claimant Contact (added from party form) item in the Parties List

Delete claimant (contact)
    Open claimant contact (added from contact list) item again
    Delete claimant contact item
    Verify claimant contact item in parties list after deleting

Update claimant (company)
    Open claimant company (added from party form) item again
    Update information for claimant company 
    Switch on the toggle 'Save changes to contact list' in claimant company
    Submit for updating company
    Check the Claimant Company item in the Parties List after updating
    Open Contact page and verify changes in claimant company