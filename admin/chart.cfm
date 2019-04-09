<cfparam name="Session.chartOld" default="false">
<cfparam name="url.showOld" default="false">
<cfparam name="url.editID" default="0">
<cfparam name="url.addID" default="0">
<cfparam name="url.delDate" default="">
<cfif url.showOld NEQ ""><cfset Session.chartOld=url.showOld></cfif>
<cfset pageTitle="Chart">
<cfinclude template="pageHead.cfm">
<CFSET varDateODBC = CreateODBCDateTime(Now())>
<cfset thisYear="#dateFormat(varDateODBC,"yy")#">
<cfif Session.chartOld EQ true>
	<cfquery name="allPicks" datasource="#DSN#">
		select *
		from picks
		where chartYear <> <cfqueryparam value="#thisYear#" cfsqltype="cf_sql_char"> AND ID>=98
		order by ID DESC
	</cfquery>
<cfelse>
	<cfquery name="allPicks" datasource="#DSN#">
		select *
		from picks
		where chartYear = <cfqueryparam value="#thisYear#" cfsqltype="cf_sql_char"> AND ID>=98
		order by ID DESC
	</cfquery>
</cfif>
<p><font size="5">pi<font color="#FFFF00">cks</font></font></p>
<p><cfif Session.chartOld EQ true><a href="chart.cfm?showOld=false">current year&rsquo;s picks</a><br>past years&rsquo; picks<cfelse>current year&rsquo;s picks<br><a href="chart.cfm?showOld=true">past years&rsquo; picks</a></cfif><br>
		<a href="chartAdd.cfm">add picks</a></p>

<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
	<td class="oTabHead">actions</td>
	<td class="oTabHead">title</td>
	<td class="oTabHead">year</td>
</tr>
<cfif url.delDate NEQ "">
	<tr>
		<td colspan="4" class="oTabHead"><span class="msg"><cfoutput>#url.delDate#</cfoutput> picks Deleted</span></td>
	</tr>
</cfif>
<cfoutput query="allPicks">
<tr>
	<td><a href="chartEdit.cfm?ID=#ID#">EDIT</a>&nbsp;&nbsp;<a href="chartDelete.cfm?ID=#ID#">DELETE</a>&nbsp;&nbsp;<a href="chartLoad.cfm?ID=#ID#">UPLOAD</a></td>
	<td>#chartTitle#</td>
	<td>#chartYear#</td>
</tr>
</cfoutput>
</table>
<cfinclude template="pageFoot.cfm">