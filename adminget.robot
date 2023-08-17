*** Settings ***
Library    RequestsLibrary
Library    Collections
#Library    Warnings    ignore::InsecureRequestWarning
#Library    OperatingSystem
Library  SeleniumLibrary
Library  os
Library  JSONLibrary


*** Variables ***
${baseUrl}     https://api.dev.javahome.in/admin/v1
${endPoint}    /companies
${bearerToken}   "Bearer eyJraWQiOiI4d05JWXBHYUcraWtmckhjTWFNZzdMN0RnM1pXYTN6ZllDb1g3VkdLUVwvND0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJmMzM4ZjBmNy0wNzgzLTQzNDYtYTJiOC01ZTdhNDgwZmI2N2QiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoLTEuYW1hem9uYXdzLmNvbVwvYXAtc291dGgtMV8yU21OMWE3cUkiLCJjb2duaXRvOnVzZXJuYW1lIjoiZjMzOGYwZjctMDc4My00MzQ2LWEyYjgtNWU3YTQ4MGZiNjdkIiwib3JpZ2luX2p0aSI6IjY2MzQzZjQ3LWJiNjUtNDM2Yi05MTMwLTkyMDZlNjQzN2I3OCIsImF1ZCI6IjRjdnRiNWNycGk4dXA5cW1sY2FjbWIybGRiIiwiZXZlbnRfaWQiOiJlZjNmNDNhMy05MGVlLTQ2OWYtODhjYi1kMjI4ODc0YjgxNjIiLCJ0b2tlbl91c2UiOiJpZCIsImF1dGhfdGltZSI6MTY5MjE4OTQyMiwiZXhwIjoxNjkyMTkzMDIyLCJpYXQiOjE2OTIxODk0MjIsImp0aSI6IjFjZmM2ZTYzLTRlODktNDE2Zi04OGNiLWE5MTQxM2M0NjU2MCIsImVtYWlsIjoicmVkZHlqcjYwN0BnbWFpbC5jb20ifQ.pMe2uBY77imk_rp-zr-bHqT92-DUt5NLKxMcDWaB0G4cMgVkUiZK59rFs51qHltDJbuaUYr7c6irvJGXokfhZCLyOh833DMWugI2oJtgJgL66d-RXpkNFiI3ZJmBZALYeTWeWLx2OaqbvXeK2QTt5BbI2TVTy1KLq5V94FhARgo06nBIHKT_oeNbghvZM6Mw5G6vaFcgIshD4ZPuCf6s6ivvnBXpQRogt_Wc7VX7jYXyrR9R1CMSAr2BHlQ9I2aLj926V_l5-aOFLrCGVJlED-o6ckU5hxwZi2u3_iMipuMrvwF3T5kGU_-Uk0ZxppNT4wrcy2zaXbJHNS-ERkIJbQ"

*** Test Cases ***
Get Request
    # Create session
    Create Session    mysession    ${baseUrl}

    # Create dictionary for request headers
    ${headers}=    Create Dictionary
    Set To Dictionary    ${headers}    X-Channel    app
    Set To Dictionary    ${headers}    Content-Type    application/json
    Set To Dictionary    ${headers}    Authorization    Bearer ${bearerToken}

    # Making GET request with headers
    ${response}=    GET On Session    mysession    ${endPoint}    headers=${headers}


    # Convert status code to string
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal   ${code}    200

    # Convert content to string
    ${body}=    Convert To String    ${response.content}

    # Get Content-Type value from headers
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal   ${contentTypeValue}    application/json
