PORTFOLIO/V1/JOBOPENINGS
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseUrl}     https://api.dev.javahome.in/portfolio/v1/
${endPoint}    jobopenings

*** Test Cases ***
Get Request
    # Creating a session
    Create Session    mysession    ${baseUrl}

    # Defining headers
    ${headers}=    Create Dictionary
    Set To Dictionary    ${headers}    X-Channel    app
    Set To Dictionary    ${headers}    Content-Type    application/json

    # Making GET request with headers
    ${response}=    Get Request    mysession    ${endPoint}    headers=${headers}

    # Log response content, status code, and headers
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}
    Log To Console    ${response.headers}

    # Convert status code to string
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal   ${code}    200

    # Convert content to string
    ${body}=    Convert To String    ${response.content}
#    Should Contain   ${body}    "Id"

    # Get Content-Type value from headers
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Log To Console    ${contentTypeValue}
    Should Be Equal   ${contentTypeValue}    application/json


