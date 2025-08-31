*** Settings ***
Documentation    Test Windows environment variables

*** Variables ***
${API_URL}       %{API_URL}
${SECRET_KEY}    %{SECRET_KEY}

*** Test Cases ***
Check Windows Env Vars
    Log    API URL = ${API_URL}
    Log    Secret Key = ${SECRET_KEY}
