*** Variables ***
${PORT}       8888
# ${ADDRESS}=    localhost


*** Settings ***
Library         pabot.PabotLib
Library         Remote    http://${ADDRESS}:${PORT}
Suite Setup     Get a device
Suite Teardown  Release the device

*** Keywords ***
Get a device
   ${valuesetname}=    pabot.PabotLib.Acquire Value Set
   ${tmp}=             Get Value From Set   address
   Set Global Variable  ${ADDRESS}  ${tmp}
   Log  ${ADDRESS}
   ${tmp}=   Get Value From Set   port
   Set Global Variable  ${PORT}  ${tmp}
   Log  ${PORT}
   Log    ${ADDRESS}:${PORT}

Release the device
   Log    ${ADDRESS}:${PORT}
   Sleep    5s
   pabot.PabotLib.Release Value Set
   Log   After value set release others can obtain the variable values


*** Test Cases ***
Count Items in Directory
    Log    ${ADDRESS}:${PORT}
    ${items1} =    Count Items In Directory    ${CURDIR}
    ${items2} =    Count Items In Directory    ${TEMPDIR}
    Log    ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'
    Log   Do something with the values (for example access host with username and password)

Failing Example
    Log    ${ADDRESS}:${PORT}
    Strings Should Be Equal    Hello    Hello
    Strings Should Be Equal    not      equal
