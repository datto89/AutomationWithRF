*** Settings ***
Documentation   Test add/update contact type company
Library         SeleniumLibrary
Library         Selenium2Library
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./addContact.resource.robot

Suite Setup      Setup Contact Test Suite                                         
Suite Teardown   Close Browser


*** Test Cases ***
Add contact company successfully
    Go To Contacts
    Open Add Contact form
    Wait Contact Company form appears
    Complete Add Contact Company form
    Wait Address and City Are Filled
    Complete Add bank account form
    Check bank account after added
    Complete Add another bank account
    Check another bank account after added
    Click Button Submit
    Add Contact form is closed
    Search Contact Company Item in contact list
    Contact Company is added to Contact list 

Update contact company successfully
    Open again the contact company just added
    Clear text in the fiels in Edit contact company form
    Input new text into Edit contact company form
    Wait Address and City Are Filled
    Edit Add bank account form
    Check bank account after edited
    Click Button Submit
    Edit Contact form is closed
    Clear text in Search box
    Search Contact Company Item in contact list after editing
    Contact Company is edited in Contact list

Delete bank account in Contact Company
    Open again the contact company just added just edited
    Delete bank account
    Check bank account after deleted