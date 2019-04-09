<cfparam name="form.cancel" default="">
<cfparam name="form.delete" default="">
<cfparam name="form.ID" default="">
<cfif form.cancel NEQ "">
	<cflocation url="venueAdmin.cfm">
</cfif>
<cfquery name="changeVenues" datasource="#DSN#">
	update playdates
		set venueID=<cfqueryparam value="#form.changeVenue#" cfsqltype="cf_sql_char">
		where venueID=<cfqueryparam value="#form.ID#" cfsqltype="cf_sql_char">
</cfquery>
<cfquery name="deleteVenue" datasource="#DSN#">
	delete from venues
	where ID=#form.ID#
</cfquery>
<cflocation url="venueAdmin.cfm">