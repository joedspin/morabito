<cfparam name="url.section" default="venues">
<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfif isDefined("Cancel")>
	<cflocation URL="infoEvents.cfm?section=#url.section#">
</cfif>
<cfif isDefined("Save")>
  <cfparam name="form.section" default="venues">
  <cfparam name="form.cityID" default="0">
  <cfparam name="form.col2" default="">
  <cfswitch expression="#form.section#">
    <cfcase value="venues">
      <cfset tableName="infoVenues">
      <cfset col2 ="venueName">
    </cfcase>
    <cfcase value="international">
      <cfset tableName="infoInternational">
      <cfset col2 ="countryName">
    </cfcase>
    <cfcase value="parties">
      <cfset tableName="infoDanceParties">
      <cfset col2 ="danceParty">
    </cfcase>
    <cfcase value="special">
      <cfset tableName="infoSpecialEvents">
      <cfset col2 ="specialEvent">
    </cfcase>  
  </cfswitch>
	<cfquery name="addEntry" datasource="susanMorabitoRecords">
		INSERT INTO #tableName# (cityID, #col2#, active)
    VALUES( 
			<cfqueryparam value="#form.cityID#" cfsqltype="cf_sql_integer">,
			<cfqueryparam value="#form.col2#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="Yes" cfsqltype="cf_sql_bit">)
	</cfquery>
	<cflocation URL="infoEvents.cfm?section=#form.section#">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">i<font color="#FFFF00">nfo: <cfoutput>#url.section#</cfoutput></font></font></p>
  <cfswitch expression="#url.section#">
    <cfcase value="venues">
      <cfset col2label="venue">
    </cfcase>
    <cfcase value="international">
      <cfset col2label="country">
    </cfcase>
    <cfcase value="parties">
      <cfset col2label="dance party">
    </cfcase>
    <cfcase value="special">
      <cfset col2label="special event">
    </cfcase>
  </cfswitch>
<cfquery name="infoCities" datasource="susanmorabitoRecords">
  select *
  from infoCities
  order by cityName
</cfquery>
<cfform name="entryDetails" action="infoEventsAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
        <td><input type="checkbox" name="visible" value="Yes" checked> visible</td>
	</tr>
  <tr>
    <td>city</td>
    <td>
      <cfif url.section EQ "international">
        <cfinput type="text" name="cityName" size="80" required="yes" message="city is required" class="formsize">
      <cfelse>
        <cfselect name="cityID" query="infoCities" required="yes" message="city is required" value="ID" display="cityName"><option value="0" selected>Choose a city</option></cfselect><br>
      </cfif>
  </tr>
  <tr>
    <td><cfoutput>#col2label#</cfoutput></td>
    <td><cfinput type="text" name="col2" size="80" required="yes" message="#col2label# is required" class="formsize"></td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
    <td>
      <cfoutput><input type="hidden" name="section" value="#url.section#"></cfoutput>
    	<input type="submit" value="Save" name="Save">
		<input type="submit" value="Cancel" name="Cancel"></td></tr>
</table>
</cfform>
</body></html>
</cfif>