*** Settings ***
Documentation   Test add/update contact type bailiff
Library         SeleniumLibrary
Library         Selenium2Library
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./addContact.resource.robot

Suite Setup      Setup Contact Test Suite                                            
Suite Teardown   Close Browser


*** Test Cases ***
Add contact bailiff successfully
    Go To Contacts
    Open Add Contact form
    Wait Contact Bailiff form appears
    Complete Add Contact Bailiff form
    Wait Address and City Are Filled
    Complete Add bank account form
    Check bank account after added
    Complete Add another bank account
    Check another bank account after added
    Click Button Submit
    Add Contact form is closed
    Search Contact Bailiff Item in contact list
    Contact Bailiff is added to Contact list 

Update contact bailiff successfully
    Open again the contact bailiff just added
    Clear text in the fiels in Edit contact bailiff form
    Input new text into Edit contact bailiff form
    Wait Address and City Are Filled
    Edit Add bank account form
    Check bank account after edited
    Click Button Submit
    Edit Contact form is closed
    Clear text in Search box
    Search Contact Bailiff Item in contact list after editing
    Contact Bailiff is edited in Contact list

Delete bank account in Contact Bailiff
    Open again the contact bailiff just added just edited
    Delete bank account
    Check bank account after deleted