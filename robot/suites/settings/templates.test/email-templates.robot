*** Settings ***
Documentation   Test add/update email template
Library         SeleniumLibrary
Resource        ../../../keywords/kolekto.robot
Resource        ../../../variables/variables.robot
Resource        ./templates.resource.robot


Suite Setup      Setup Templates Test Suite                                           
Suite Teardown   Close Browser

*** Test Cases ***
Add email template
    Go To System Templates
    Add email template
    Check email template after adding

Edit email template
    Open edit email template form
    Change email template information
    Check email template after editing

Delete email template
    From email templates list, delete SMS template
    Check email template after deleting