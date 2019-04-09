<cfparam name="url.ID" default="0">
<cfquery name="killPerf" datasource="susanMorabitoRecords">
	delete
	from playdates
	where ID=#url.ID#
</cfquery>
<cflocation url="perfAdmin.cfm">