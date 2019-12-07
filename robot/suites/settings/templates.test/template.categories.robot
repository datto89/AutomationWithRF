*** Settings ***
Documentation   Test add/update template categories
Library         SeleniumLibrary
Resource        ../../../keywords/kolekto.robot
Resource        ../../../variables/variables.robot
Resource        ./templates.resource.robot


Suite Setup      Setup Templates Test Suite                                           
Suite Teardown   Close Browser

*** Test Cases ***
Add templates categories
    Go To System Templates
    Add template category
    Check template category aftef adding


Edit templates categories
    Open again add category form
    Edit category
    Check template category after editting

Delete templates category that used by some templates
    From template category list, delete category that used by some templates
    Check the warning message
    Cancel

Delete templates category that isn't used by some templates
    From template category list, delete category that isn't used by some templates
    Confirm the warning message
    Check template category after deleting
    


    
