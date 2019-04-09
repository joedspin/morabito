<cfquery name="fixBio" datasource="#DSN#">
update hit_counter
set pagename='biographyOLD' where pagename='biography'
</cfquery>	
<cfquery name="fixBio" datasource="#DSN#">
update hit_counter
set pagename='dicographyOLD' where pagename='discography'
</cfquery>	