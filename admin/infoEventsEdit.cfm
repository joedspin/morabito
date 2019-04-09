<cfparam name="url.ID" default="0">
<cfparam name="url.section" default="venues">
<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfif isDefined("Cancel")>
	<cflocation URL="infoEvents.cfm?section=#url.section#">
</cfif>
<cfif isDefined("Save")>
	<cfparam name="form.ID" default="0">
  <cfparam name="form.section" default="venues">
  <cfparam name="form.cityID" default="0">
  <cfparam name="form.cityName" default="">
  <cfparam name="form.col2" default="">
	<cfparam name="form.visible" default="No">
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
	<cfif form.section EQ "international">
    <cfquery name="editEntry" datasource="susanMorabitoRecords">
      UPDATE infoInternational
      SET 
        cityName=<cfqueryparam value="#form.cityName#" cfsqltype="cf_sql_char">,
        countryName=<cfqueryparam value="#form.col2#" cfsqltype="cf_sql_char">,
        active=<cfqueryparam value="#form.visible#" cfsqltype="cf_sql_bit">
      WHERE ID=#form.ID#
    </cfquery>
  <cfelse>
    <cfquery name="editEntry" datasource="susanMorabitoRecords">
      UPDATE #tableName#
      SET 
        cityID=<cfqueryparam value="#form.cityID#" cfsqltype="cf_sql_integer">,
        #col2#=<cfqueryparam value="#form.col2#" cfsqltype="cf_sql_char">,
        active=<cfqueryparam value="#form.visible#" cfsqltype="cf_sql_bit">
      WHERE ID=#form.ID#
    </cfquery>
  </cfif>
	<cflocation URL="infoEvents.cfm?section=#form.section#">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">i<font color="#FFFF00">nfo: <cfoutput>#url.section#</cfoutput></font></font></p>
  <cfswitch expression="#url.section#">
    <cfcase value="venues">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoVenues.ID as ID, cityName, cityID, venueName as col2, active
        from infoVenues LEFT JOIN infoCities ON infoVenues.cityID=infoCities.ID
        where infoVenues.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset col2label="venue">
    </cfcase>
    <cfcase value="international">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select ID, cityName, countryName as col2, active
        from infoInternational
        where infoInternational.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset col2label="country">
    </cfcase>
    <cfcase value="parties">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoDanceParties.ID as ID, cityName, cityID, danceParty as col2, active
        from infoDanceParties LEFT JOIN infoCities ON infoDanceParties.cityID=infoCities.ID
        where infoDanceParties.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset col2label="dance party">
    </cfcase>
    <cfcase value="special">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoSpecialEvents.ID as ID, cityName, cityID, specialEvent as col2, active
        from infoSpecialEvents LEFT JOIN infoCities ON infoSpecialEvents.cityID=infoCities.ID
        where infoSpecialEvents.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset col2label="special event">
    </cfcase>
  </cfswitch>
<cfquery name="infoCities" datasource="susanmorabitoRecords">
  select *
  from infoCities
  order by cityName
</cfquery>
<cfform name="entryDetails" action="infoEventsEdit.cfm" method="post">
<cfoutput query="entry">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
        <td><input type="checkbox" name="visible" value="Yes" <cfif active>checked</cfif>> visible</td>
	</tr>
  <tr>
    <td>city</td>
    <td>
      <cfif url.section EQ "international">
        <cfinput type="text" name="cityName" size="80" value="#cityName#" required="yes" message="city is required" class="formsize">
      <cfelse>
        <cfselect name="cityID" query="infoCities" required="yes" message="city is required" value="ID" display="cityName" selected="#entry.cityID#"><option value="0">Add New City</option></cfselect><br>
      </cfif>
  </tr>
  <tr>
    <td>#col2label#</td>
    <td><cfinput type="text" name="col2" size="80" value="#col2#" required="yes" message="#col2label# is required" class="formsize"></td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
    <td><input type="hidden" name="ID" value="#url.ID#" />
      <input type="hidden" name="section" value="#url.section#">
    	<input type="submit" value="Save" name="Save">
		<input type="submit" value="Cancel" name="Cancel"></td></tr>
</table>
</cfoutput>
</cfform>
</body></html>
</cfif>