*** Settings ***
Documentation   Test add/update dossier types
Library         SeleniumLibrary
Resource        ../../../keywords/kolekto.robot
Resource        ../../../variables/variables.robot
Resource        ./process-flow.resource.robot


Suite Setup      Setup Process Test Suite                                           
#Suite Teardown   Close Browser

*** Test Cases ***
Add dossier types
    Go To System Process
    Add new dossier type
    Check dossier type in dossier types list

Edit process flow
    Go to Flow management
    Add manual action for Debt management stage
    Add auto action for Debt management stage
    # Add manual action for Collection stage
    # Add auto action for Collection stage
    # Add manual action for Litigation stage
    # Add auto action for Litigation stage
    # Add manual action for Execution stage
    # Add auto action for Execution stage



