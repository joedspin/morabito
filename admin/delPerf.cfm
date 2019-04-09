<cfparam name="url.ID" default="0">
<cfquery name="delPerf" datasource="#DSN#">
	delete *
	from playdates
	where ID=#url.ID#
</cfquery>