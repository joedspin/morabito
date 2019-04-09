<cfquery name="updateHitCounterName" datasource="#DSN#">
	update hit_counter
	set pagename='musicArchives'
    where pagename='music'
</cfquery>
<cfquery name="updateHitCounterName" datasource="#DSN#">
	update hit_counter
	set pagename='contactArchive'
    where pagename='contact'
</cfquery>
<cfquery name="updateHitCounterName" datasource="#DSN#">
	update hit_counter
	set pagename='music'
    where pagename='MORABITOmusic'
</cfquery>
<cfquery name="updateHitCounterName" datasource="#DSN#">
	update hit_counter
	set pagename='contact'
    where pagename='MORABITOcontact'
</cfquery>
