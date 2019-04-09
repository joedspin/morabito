<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfparam name="url.ID" default="">
<cfparam name="form.venueID" default="">
<cfif url.ID IS NOT "" OR form.venueID IS NOT "">
	<cfif isDefined("Cancel")>
		<cflocation URL="venueAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfparam name="form.addCity" default="">
		<cfparam name="form.addState" default="">
		<cfif form.addState IS NOT "">
			<cfquery name="addState" datasource="susanmorabitoRecords">
				insert into states (name) values (<cfqueryparam value="#form.addState#" CFSQLType="CF_SQL_CHAR">)
			</cfquery>
			<cfquery name="newState" datasource="susanmorabitoRecords">
				select Max(ID) AS stateID FROM states
			</cfquery>
			<cfset form.stateID=newState.stateID>
		</cfif>
		<cfif form.addCity IS NOT "">
			<cfquery name="addCity" datasource="susanmorabitoRecords">
				insert into cities (name, stateID) values (<cfqueryparam value="#form.addCity#" CFSQLType="CF_SQL_CHAR">,
					<cfqueryparam value="#form.stateID#" CFSQLType="CF_SQL_CHAR">)
			</cfquery>
			<cfquery name="newCity" datasource="susanmorabitoRecords">
				select Max(ID) AS cityID  FROM cities
			</cfquery> 
			<cfset form.cityID=newCity.cityID>
		</cfif>
		<cfset thisID = url.ID>
		<cfquery name="updateVenue" datasource="susanMorabitoRecords">
			update venues
			set name = '#form.venueName#',
				address = '#form.address#',
				cityID = '#form.cityID#',
				phone = '#form.phone#',
				email = '#form.email#',
				venueURL = '#form.venueURL#',
				defaultInfo = '#form.defaultInfo#'
			where ID = #form.venueID#
		</cfquery>
		<cflocation URL="venueAdmin.cfm">
	</cfif>
<html>


<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Venue Details</title>
<base target="_self">
<style>
<!--
a            { font-family: Arial,Helvetica; text-decoration: none; color: #333333; 
               font-weight: bold }
a:link       { font-family: Arial,Helvetica; text-decoration: none; color: #333333; 
               font-weight: bold }
body         { font-family: Arial; font-size: 14pt }
table        { font-family: Arial; font-size: 12pt }
textarea 		{ font-family: Arial}
input				{ font-family: Arial}
//-->
</style>
</head>
<body leftmargin="0" topmargin="0">
    <table border="0" cellpadding="10" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
      <tr>      
    <td width="100%" bgcolor="#330066">
        <font face="Arial" size="5" color="#FFFFFF">
        <strong>SusanMorabito.com</strong> Site Administration</font></td>
      </tr>
    </table>
<p style="line-height: 0; margin-top: 0; margin-bottom: 6">&nbsp;</p>
<blockquote>
<cfquery name="thisVenue" datasource="susanmorabitoRecords">
	select *
	from venuesQuery
	where ID=#url.ID#
</cfquery>
<cfquery name="allCities" datasource="susanmorabitoRecords">
	select *
	from citiesQuery
	order by name
</cfquery>
<cfquery name="allStates" datasource="susanmorabitoRecords">
	select *
	from states
	order by name
</cfquery>
<cfoutput query="thisVenue">
<form name="venueDetails" action="venueEdit.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
  <tr>
    <td>Venue Name </td>
    <td><input type="text" name="venueName" size="22" value="#thisVenue.name#"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
	<tr>
    <td>Venue Address </td>
    <td><input type="text" name="address" size="22" value="#thisVenue.address#"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>City </td>
    <td><select size="1" name="cityID">
			<cfset venueCity=#thisVenue.cityID#>
			<cfloop query="allCities">
				<option value="#allCities.ID#"<cfif allCities.ID IS venueCity> selected</cfif>>#allCities.name#</option>
			</cfloop>
		</select></td>
    <td>Add New City </td>
    <td><input type="text" name="addCity" size="15"> State (if new City)
		<select size="1" name="stateID">
			<option value="0">&nbsp;</option>
			<cfloop query="allStates">
				<option value="#allStates.ID#">#allStates.name#</option>
			</cfloop>
		</select> OR New State <input type="text" name="addState" size="10">
		</td>
  </tr>
  <tr>
    <td>Phone </td>
    <td colspan="3"><input type="text" name="phone" size="62" value="#thisVenue.phone#"></td>
  </tr>
  <tr>
    <td>Email </td>
    <td colspan="3"><input type="text" name="email" size="62" value="#thisVenue.email#"></td>
  </tr>
  <tr>
    <td>Venue URL </td>
    <td colspan="3"><input type="text" name="venueURL" size="62" value="#thisVenue.venueURL#"></td>
  </tr>
  <tr>
    <td>Default info:<br>
    &nbsp;</td>
    <td colspan="3">
    <textarea rows="7" name="defaultInfo" cols="80" wrap="soft">#thisVenue.defaultInfo#</textarea></td>
  </tr>
  <tr>
    <td colspan="4" align="center">
    <p><input type="hidden" name="venueID" value="#thisVenue.ID#">
      <input type="submit" value="Save" name="Save">&nbsp;
      <input type="reset" value="Reset" name="Reset">&nbsp;
			<input type="submit" value="Cancel" name="Cancel"></p>
    </td>
  </tr>
  </table>

</form>
<form name="deleteVenue" action="venueDelete.cfm" method="post">
<input type="hidden" name="venueID" value="#thisVenue.ID#">
<input type="submit" value="Delete" name="Delete" id="Delete">
</form>
</cfoutput>
</blockquote>
</body></html>



<cfelse>
You have reached this page in error.
</cfif>
</cfif>