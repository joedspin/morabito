<cfparam name="url.section" default="venues">
<cfparam name="url.delEntry" default="false">
<cfset pageTitle="Info: Venues and Events">
<cfinclude template="pageHead.cfm">
<p><font size="5">i<font color="#FFFF00">nfo:</font> venues &amp; events</font></p>
<p>
  <cfif url.section NEQ "venues"><a href="infoEvents.cfm?section=venues">venues</a><cfelse>venues</cfif><br />
  <cfif url.section NEQ "international"><a href="infoEvents.cfm?section=international">international</a><cfelse>international</cfif><br />
  <cfif url.section NEQ "parties"><a href="infoEvents.cfm?section=parties">dance parties</a><cfelse>dance parties</cfif><br />
  <cfif url.section NEQ "special"><a href="infoEvents.cfm?section=special">special events</a><cfelse>special events</cfif>   
</p>
<p>
  <cfoutput><a href="infoEventsAdd.cfm?section=#url.section#">add new</a></cfoutput>
</p>
<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
  <td>actions</td>
	<td class="oTabHead">city</td>
  <cfswitch expression="#url.section#">
    <cfcase value="venues">
      <td class="oTabHead">venue</td>
      <cfquery name="entries" datasource="susanmorabitoRecords">
        select infoVenues.ID as ID, cityName, venueName as col2
        from infoVenues LEFT JOIN infoCities ON infoVenues.cityID=infoCities.ID
        order by cityName, venueName
      </cfquery>
    </cfcase>
    <cfcase value="international">
      <td class="oTabHead">country</td>
      <cfquery name="entries" datasource="susanmorabitoRecords">
        select ID, cityName, countryName as col2
        from infoInternational
        order by cityName
      </cfquery>
    </cfcase>
    <cfcase value="parties">
      <td class="oTabHead">state</td>
      <td class="oTabHead">party</td>
      <cfquery name="entries" datasource="susanmorabitoRecords">
        select infoDanceParties.ID as ID, cityName, stateName as col2, danceParty as col3
        from infoDanceParties LEFT JOIN infoCities ON infoDanceParties.cityID=infoCities.ID
        order by danceParty
      </cfquery>
    </cfcase>
    <cfcase value="special">
      <td class="oTabHead">state</td>
      <td class="oTabHead">event</td>
      <cfquery name="entries" datasource="susanmorabitoRecords">
        select infoSpecialEvents.ID as ID, cityName, stateName as col2, specialEvent as col3
        from infoSpecialEvents LEFT JOIN infoCities ON infoSpecialEvents.cityID=infoCities.ID
        order by specialEvent
      </cfquery>
    </cfcase>
  </cfswitch>
</tr>
<cfif url.delEntry EQ "true">
	<tr>
		<td colspan="4" class="oTabHead"><span class="msg">entry deleted</span></td>
	</tr>
</cfif>
<cfoutput query="entries">
<tr>
	<td><a href="infoEventsEdit.cfm?ID=#ID#&section=#url.section#">EDIT</a>&nbsp;&nbsp;<a href="infoEventsDelete.cfm?ID=#ID#&section=#url.section#">DELETE</a>&nbsp;&nbsp;</td>
	<td>#cityName#</td>
	<td>#col2#</td>
  <cfif url.section EQ "parties" OR url.section EQ "special">
    <td>#col3#</td>
  </cfif>
</tr>
</cfoutput>
</table>
<cfinclude template="pageFoot.cfm">