*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
*** Variables ***
${baseUrl}     https://api.dev.javahome.in/portfolio/v1/
${endPoint}    /enquireNow
${bearertoken}

*** Test Cases ***
Post Request
    # Create session
    Create Session    mysession    ${baseUrl}

    # Create dictionary for request body
    ${body}=    Create Dictionary    name              Lokesh Soni


    ${header}=    Create Dictionary    Content-Type=application/json
    ${header}=    Create Dictionary    X-Channel=app

    # Make a post request
    ${response}=    Post Request    mysession    ${endPoint}    json=${body}    headers=${header}

    # Convert status code to string
    ${code}=    Convert To String    ${response.status_code}

    # Validation of status code should be equal 200
    Should Be Equal   ${code}    200

    # Convert response content to string
    ${body}=    Convert To String    ${response.content}

    # Validation of response.content should contain 'statusCode' and 'body' fields
    Should Contain   ${body}    "statusCode"
    Should Contain   ${body}    "body"
