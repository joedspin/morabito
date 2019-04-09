<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
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
		<cfquery name="addVenue" datasource="susanMorabitoRecords">
			insert into venues (name, address, cityID, phone, email, venueURL, defaultInfo)
			values ('#form.venueName#', '#form.address#', '#form.cityID#', '#form.phone#', '#form.email#',
					'#form.venueURL#', '#form.defaultInfo#')
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
<form name="venueDetails" action="venueAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
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
<cfoutput>
  <tr>
    <td>Venue Name </td>
    <td><input type="text" name="venueName" size="22"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
	<tr>
    <td>Venue Address </td>
    <td><input type="text" name="address" size="22"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
</cfoutput>
  <tr>
    <td>City </td>
    <td><select size="1" name="cityID">
			<cfoutput query="allCities">
				<option value="#allCities.ID#">#allCities.name#</option>
			</cfoutput>
		</select></td>
    <td>Add New City </td>
    <td><input type="text" name="addCity" size="15"> State (if new City)
		<select size="1" name="stateID">
			<option value="0">&nbsp;</option>
			<cfoutput query="allStates">
				<option value="#allStates.ID#">#allStates.name#</option>
			</cfoutput>
		</select> OR New State <input type="text" name="addState" size="10">
		</td>
  </tr>
<cfoutput>
  <tr>
    <td>Phone </td>
    <td colspan="3"><input type="text" name="phone" size="62"></td>
  </tr>
  <tr>
    <td>Email </td>
    <td colspan="3"><input type="text" name="email" size="62"></td>
  </tr>
  <tr>
    <td>Venue URL </td>
    <td colspan="3"><input type="text" name="venueURL" size="62"></td>
  </tr>
  <tr>
    <td>Default info:<br>
    &nbsp;</td>
    <td colspan="3">
    <textarea rows="7" name="defaultInfo" cols="80" wrap="soft"></textarea></td>
  </tr>
  <tr>
    <td colspan="4" align="center">
    <p>
      <input type="submit" value="Save" name="Save">&nbsp;
			<input type="submit" value="Cancel" name="Cancel"></p>
    </td>
  </tr>
  </table>
</cfoutput>
</form>

</blockquote>
</body></html>

</cfif>