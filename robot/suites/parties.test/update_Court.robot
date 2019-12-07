*** Settings ***
Documentation   Test update court
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./parties.resource.robot
Resource        ./parties.resource.court.robot



Suite Setup      Setup Parties Court Test Suite                         
Suite Teardown   Close Browser

*** Test Cases ***
Change property of dossier make change court
    Change property 
    Check court and court location in dossier overview
    Check court and court location in court form

Change Court and court location in court form
    Change court and court location 
    Check court details
    Check court and court location in Parties list

