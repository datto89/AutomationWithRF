*** Settings ***
Documentation   Test add/update/delete client
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./parties.resource.robot
Resource        ./parties.resource.client.robot


Suite Setup      Setup Parties Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***

Add new client (company) from contact list
    Open Add party form
    Select role and company in Add party form (client)
    Verify company information after adding to party form
    Submit
    Check the Client Company (added from contact list) item in the Parties List

Add new client (contact) from new party form
    Open Add party form
    Add new contact
    Complete Add Client (contact) form 
    Submit Add Client (contact) form
    Check the Client Contact item in the Parties List

Add new client (contact) from contact list
    Open Add party form
    Select role and contact in Add party form for client 
    Verify information after adding client to party form
    Add date of birth and gender for client
    Submit
    Check the Client Contact (added from contact list) item in the Parties List

Delete client (company)
    Open client company (added from contact list) item again
    Delete client company item
    Verify client company item in parties list after deleting

Add new client (company) from new party form 
    Open Add party form
    Add new contact 
    Complete Add Client (company) form 
    Submit Add Client (company) form
    Check the Client Company item in the Parties List

Unable to add 2nd client that is company 
    Open Add party form
    Select role and check contact list
    Click on title of form to lose forcus 
    Open party form and check Company icon
    Close form

Update client (company)
    Open client company (added from party form) item again
    Update information for client company 
    Switch on the toggle 'Save changes to contact list' in client company
    Submit for updating company
    Check the Client Company item in the Parties List after updating
    Open Contact page and verify changes in client company





