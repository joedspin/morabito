<cfif isDefined("Cancel")>
	<cflocation URL="chart.cfm">
</cfif>
<cfparam name="form.chartTitle" default="">
<cfparam name="form.chartYear" default="">
<cfparam name="form.pos1Title" default="">
<cfparam name="form.pos1Artist" default="">
<cfparam name="form.pos2Title" default="">
<cfparam name="form.pos2Artist" default="">
<cfparam name="form.pos3Title" default="">
<cfparam name="form.pos3Artist" default="">
<cfparam name="form.pos4Title" default="">
<cfparam name="form.pos4Artist" default="">
<cfparam name="form.pos5Title" default="">
<cfparam name="form.pos5Artist" default="">
<cfparam name="form.pos6Title" default="">
<cfparam name="form.pos6Artist" default="">
<cfparam name="form.pos7Title" default="">
<cfparam name="form.pos7Artist" default="">
<cfparam name="form.pos8Title" default="">
<cfparam name="form.pos8Artist" default="">
<cfparam name="form.pos9Title" default="">
<cfparam name="form.pos9Artist" default="">
<cfparam name="form.pos10Title" default="">
<cfparam name="form.pos10Artist" default="">
<cfparam name="form.pos0Title" default="">
<cfparam name="form.pos0Artist" default="">
<cfparam name="form.active" default="no">
<cfif isDefined("Save")>
	<cfparam name="form.active" default="No">
	<cfquery name="addChart" datasource="#DSN#">
		insert into picks (chartTitle, chartYear, pos1Title, pos1Artist, pos2Title, pos2Artist,
			pos3Title, pos3Artist, pos4Title, pos4Artist, pos5Title, pos5Artist,
			pos6Title, pos6Artist, pos7Title, pos7Artist, pos8Title, pos8Artist, 
			pos9Title, pos9Artist, pos10Title, pos10Artist, pos0Title, pos0Artist, active)
		values (<cfqueryparam value="#form.chartTitle#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.chartYear#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos1Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos1Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos2Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos2Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos3Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos3Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos4Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos4Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos5Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos5Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos6Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos6Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos7Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos7Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos8Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos8Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos9Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos9Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos10Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos10Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos0Title#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.pos0Artist#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.active#" cfsqltype="cf_sql_bit">)
	</cfquery>
	<cflocation URL="chart.cfm">
</cfif>