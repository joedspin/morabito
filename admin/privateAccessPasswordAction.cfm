<cfparam name="form.thePassword" default="">
<cfquery name="updatePassword" datasource="#DSN#">
	update musicSetPassword
	set password=<cfqueryparam value="#form.thePassword#" cfsqltype="cf_sql_char">
	where ID=1
</cfquery>
<cflocation URL="privateAccessPassword.cfm?saved=yes">