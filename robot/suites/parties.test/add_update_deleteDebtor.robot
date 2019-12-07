*** Settings ***
Documentation   Test add/update/delete claimant
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./parties.resource.robot
Resource        ./parties.resource.debtor.robot



Suite Setup      Setup Parties Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***
Add new debtor (company) from contact list
    Open Add party form
    Select role and company in Add party form for debtor
    Verify company information after adding debtor to party form 
    Submit
    Check the Debtor Company (added from contact list) item in the Parties List
    
Add new debtor (contact) from contact list
    Open Add party form
    Select role and contact in Add party form for debtor
    Verify information after adding debtor to party form
    Add date of birth and gender for debtor
    Submit
    Check the Debtor Contact (added from contact list) item in the Parties List
    Verify that the debtor is Insolvent and Deceased

Add new claimant (company) from party form 
    Open Add party form
    Add new debtor
    Complete Add debtor (company) form
    Submit Add debtor (company) form
    Check the Debtor Company (added from party form) item in the Parties List

Add new debtor (contact) from party form
    Open Add party form
    Add new debtor
    Complete Add debtor (contact) form
    Submit Add debtor (contact) form
    Check the Debtor Contact (added from party form) item in the Parties List

Delete debtor (contact)
    Open debtor contact (added from contact list) item again
    Delete debtor contact item
    Verify debtor contact item in parties list after deleting

Update claimant (company)
    Open debtor company (added from party form) item again
    Update information for debtor company 
    Switch on the toggle 'Save changes to contact list' in debtor company
    Submit for updating company
    Check the Debtor Company item in the Parties List after updating
    Open Contact page and verify changes in debtor company