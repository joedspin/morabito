<cfparam name="url.ID" default="0">
<cfparam name="url.section" default="venues">
<cfparam name="url.tname" default="infoVenues">
<cfquery name="killPerf" datasource="susanMorabitoRecords">
	delete
	from #url.tname#
	where ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
</cfquery>
<cflocation url="infoEvents.cfm?section=#url.section#&delEntry=true">