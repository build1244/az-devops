*** Settings ***
Library			SeleniumLibrary
Library     		RequestsLibrary

*** Variables ***
${BROWSER}		%{BROWSER}
${URL}			%{URL}

*** Keywords ***
Check Response
	Create Session  sess  ${URL}
	${res}=     Get Request     sess    /
	Log     ${res.status_code}
	Should Be Equal     ${200}  ${res.status_code}

*** Test Cases ***
Visit Web
	Check Response
	Open Browser			${URL}		${BROWSER}
	Capture Page Screenshot
