*** Settings ***
Documentation   Test add/update contact type person
Library         SeleniumLibrary
#Library         Selenium2Library
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./addContact.resource.robot


Suite Setup      Setup Contact Test Suite                                  
Suite Teardown   Close Browser



*** Test Cases ***
Add contact person successfully
    Go To Contacts
    Open Add Contact form
    Complete Add Contact form
    Wait Address and City Are Filled
    Complete Add bank account form
    Check bank account after added
    Complete Add another bank account
    Check another bank account after added
    Click Button Submit
    Add Contact form is closed
    Search Contact Person Item in contact list
    Contact Person is added to Contact list 



Update contact person successfully
    Open again the contact person just added
    Clear text in the fiels in Edit contact person form
    Input new text into Edit contact person form
    Wait Address and City Are Filled
    Edit Add bank account form
    Check bank account after edited
    Click Button Submit
    Edit Contact form is closed
    Clear text in Search box
    Search Contact Person Item in contact list after editing
    Contact Person is edited in Contact list


Delete bank account in Contact Person
    Open again the contact person just edited
    Delete bank account
    Check bank account after deleted





