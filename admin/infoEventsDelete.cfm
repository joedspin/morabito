<cfparam name="Session.username" default="">
<cfparam name="url.section" default="venues">
<cfparam name="url.ID" default="0">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">
  <cfswitch expression="#url.section#">
    <cfcase value="venues">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoVenues.ID as ID, cityName, cityID, venueName as col2, active
        from infoVenues LEFT JOIN infoCities ON infoVenues.cityID=infoCities.ID
        where infoVenues.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset tableName="infoVenues">
      <cfset col2label="venue">
    </cfcase>
    <cfcase value="international">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select ID, cityName, cityID, countryName as col2, active
        from infoInternational
        where infoInternational.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset tableName="infoInternational">
      <cfset col2label="country">
    </cfcase>
    <cfcase value="parties">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoDanceParties.ID as ID, cityName, cityID, stateName, danceParty as col2, active
        from infoDanceParties LEFT JOIN infoCities ON infoDanceParties.cityID=infoCities.ID
        where infoDanceParties.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset tableName="infoDanceParties">
      <cfset col2label="dance party">
    </cfcase>
    <cfcase value="special">
      <cfquery name="entry" datasource="susanmorabitoRecords">
        select infoSpecialEvents.ID as ID, cityName, cityID, stateName, specialEvent as col2, active
        from infoSpecialEvents LEFT JOIN infoCities ON infoSpecialEvents.cityID=infoCities.ID
        where infoSpecialEvents.ID=<cfqueryparam value="#url.ID#" cfsqltype="CF_SQL_INTEGER">
      </cfquery>
      <cfset tableName="infoSpecialEvents">
      <cfset col2label="special event">
    </cfcase>  
  </cfswitch>
<p><font size="5">i<font color="#FFFF00">nfo:</font> venues &amp; events</font></p>
<cfoutput query="entry">
<p><b>are you sure you want to delete this entry (CANNOT BE UNDONE!)?</b></p>
<table border="1" bordercolor="##999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
	<td><b>city</b></td>
	<td><b>#cityName#</b></td>
</tr>
<tr>
	<td><b>#col2label#</b></td>
	<td><a href="infoEventEdit.cfm?ID=#ID#&section=#url.section#" title="EDIT">#col2#</a></td>
</tr>
</table>
<p><a href="InfoEventsDeleteAction.cfm?ID=#url.ID#&section=#url.section#&tname=#tableName#">YES</a> | <a href="infoEventsEdit.cfm?section=#url.section#">NO</a></p>
</cfoutput>

</body>

</html>