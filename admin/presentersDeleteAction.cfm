<cfparam name="form.cancel" default="">
<cfparam name="form.delete" default="">
<cfparam name="form.ID" default="">
<cfif form.cancel NEQ "">
	<cflocation url="presentersAdmin.cfm">
</cfif>
<cfquery name="changePresenters" datasource="#DSN#">
	update playdates
		set presenterID=<cfqueryparam value="#form.changePresenters#" cfsqltype="cf_sql_char">
		where presenterID=<cfqueryparam value="#form.ID#" cfsqltype="cf_sql_char">
</cfquery>
<cfquery name="deletePresenter" datasource="#DSN#">
	delete from presenters
	where ID=#form.ID#
</cfquery>
<cflocation url="presentersAdmin.cfm">