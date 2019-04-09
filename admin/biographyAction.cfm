<cfparam name="form.bioText" default="">
<cfparam name="form.cancel" default="">
<cfparam name="form.save" default="">
<cfif form.cancel NEQ "">
	<cflocation url="index.cfm">
</cfif>
<cfif form.save NEQ "">
	<cfquery name="saveBio" datasource="#DSN#">
		update bioText
		set bioText=<cfqueryparam value="#form.bioText#" cfsqltype="cf_sql_longvarchar">
		where ID=1
	</cfquery>
	<cflocation url="index.cfm">
</cfif>