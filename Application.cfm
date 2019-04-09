<cfapplication name="smremote" sessionmanagement="yes">
<cfset DSN="susanmorabitorecords">
<CFSET varDateODBC = CreateODBCDateTime(Now())>
<cfset lineFeed=chr(13)&chr(10)>
<cfset hardFeed=chr(10)&chr(34)>