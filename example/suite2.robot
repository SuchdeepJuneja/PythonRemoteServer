*** Settings ***
Library         pabot.PabotLib
Suite Setup     Get a resource
Suite Teardown  Release the resource


*** Keywords ***
Get a resource
   ${valuesetname}=    pabot.PabotLib.Acquire Value Set
   ${tmp}=             Get Value From Set   ADDRESS
   Set Suite Variable  ${ADDRESS}  ${tmp}
   ${tmp}=   Get Value From Set   port
   Set Suite Variable  ${PORT}  ${tmp}
   Log    ${ADDRESS}:${PORT}
   Import Library    Remote    http://${ADDRESS}:${PORT}

Release the resource
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
    Strings Should Be Equal    equal      equal
