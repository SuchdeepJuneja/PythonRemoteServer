*** Settings ***
Library         pabot.PabotLib
Suite Setup     Setup system
Suite Teardown  Close system
Library         Remote http://${ADDRESS}:${PORT}

*** Keywords ***
Setup system
   ${valuesetname}=    Acquire Value Set
   ${tmp}=   Get Value From Set   address
   Set Global Variable  ${ADDRESS}  ${tmp}
   Log  ${ADDRESS}
   ${tmp}=   Get Value From Set   port
   Set Global Variable  ${PORT}  ${tmp}
   Log  ${PORT}
   Log    ${address}:${PORT}

Close system
   Log    ${address}:${PORT}
   Sleep    5s
   Release Value Set
   Log   After value set release others can obtain the variable values

*** Variables ***


*** Test Cases ***
Count Items in Directory
	Log    ${ADDRESS}:${PORT}
    ${items1} =    Count Items In Directory    ${CURDIR}
    ${items2} =    Count Items In Directory    ${TEMPDIR}
    Log    ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'
    Log   Do something with the values (for example access host with username and password)

Failing Example
    Strings Should Be Equal    Hello    Hello
    Strings Should Be Equal    not      equal
