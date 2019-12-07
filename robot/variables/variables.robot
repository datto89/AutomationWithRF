*** Settings ***
Documentation       Setup variables used for test suites
Library             DateTime
Library             String

*** Variables ***
${RootURL}     https://kolekto-huur-integration.azurewebsites.net/
${ValidUser}        auto.sp.admin@kolekto.nl
${InactiveUser}     auto.do.reader@kolekto.nl
${KolektoPassword}  Kolekto@
${AccessDenied}     Toegang geweigerd
${BROWSER}          chrome
${PhoneNumber1}      +84932733681
${MobilePhone1}      +84948018747
${EmailAddress1}     linh.mai@koleko.nl
${TodayString}      DateTime.Get Current Date  time_zone=local  increment=0  result_format=%y%m%d%H%M%S
${PhoneNumber2}     +84932733681-222       
${MobilePhone2}     +84932733681-222         
${EmailAddress2}    linh.mai@idealogic.com.vn