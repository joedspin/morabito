<cfparam name="form.cancel" default="">
<cfparam name="form.delete" default="">
<cfparam name="form.ID" default="">
<cfparam name="form.delDate" default="">
<cfif form.cancel NEQ "">
	<cflocation url="chart.cfm">
</cfif>
<cfquery name="deleteChart" datasource="#DSN#">
	delete from picks
	where ID=#form.ID#
</cfquery>
<cflocation url="chart.cfm?delDate=#form.delDate#">