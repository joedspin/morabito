<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfif isDefined("Cancel")>
	<cflocation URL="perfAdmin.cfm">
</cfif>
<cfif isDefined("Preview") OR isDefined("Save")>
    <cfparam name="form.playdate" default="#varDateODBC#">
    <cfparam name="form.cityLabel" default="">
    <cfparam name="form.presenter" default="">
    <cfparam name="form.eventTime" default="">
    <cfparam name="form.eventName" default="">
    <cfparam name="form.venueName" default="">
    <cfparam name="form.venueAddress" default="">
    <cfparam name="form.eventLinkLabel" default="">
    <cfparam name="form.eventLink" default="">
	<cfparam name="form.visible" default="No">
	<cfquery name="addPerf" datasource="susanMorabitoRecords">
		insert into playdates (cityLabel, playdate, eventTime, presenter, eventName, venueName, venueAddress, eventLinkLabel, eventLink, active)
		values (			
			<cfqueryparam value="#form.cityLabel#" cfsqltype="cf_sql_char">,
            <cfqueryparam value="#form.playdate#" cfsqltype="cf_sql_date">,
			<cfqueryparam value="#form.eventTime#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.presenter#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.eventName#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.venueName#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.venueAddress#" cfsqltype="cf_sql_longvarchar">,
			<cfqueryparam value="#form.eventLinkLabel#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.eventLink#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.visible#" cfsqltype="cf_sql_bit">)
	</cfquery>
  <cfquery name="checkCity" datasource="susanMorabitoRecords">
    select ID from infoCities
    where cityName = <cfqueryparam value="#form.cityLabel#" cfsqltype="cf_sql_char">
  </cfquery>
  <cfif checkCity.recordCount EQ 0>
    <cfquery name="addCity" datasource="susanMorabitoRecords">
      insert into infoCities (cityName, stateName)
      values (<cfqueryparam value="#form.cityLabel#" cfsqltype="cf_sql_char">, 'USA')
    </cfquery>  
  </cfif>
<cfif isDefined("Save")>
		<cflocation URL="perfAdmin.cfm">
	</cfif>
<cfquery name="newPerf" datasource="susanmorabitoRecords">
	select Max(ID) AS perfID  FROM playdates
</cfquery> 
	<cflocation URL="perfEdit.cfm?ID=#newPerf.perfID#">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">play<font color="#FFFF00">dates</font></font></p>
<cfform name="perfDetails" action="perfAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
        <td><input type="checkbox" name="visible" value="Yes"> visible</td>
	</tr>
    <tr>
    <td>city label</td>
    <td><cfinput type="text" name="cityLabel" size="80" required="yes" message="city label is required - this is the text that appears sideways on the playdates page" class="formsize">
  <tr>
    <td>date (mm/dd/yy) </td>
    <td><cfinput type="text" name="playdate" size="68" required="yes" message="date is required and must be a valid date" validate="date" class="formbold formsize"></td>
  </tr>
  <tr>
    <td>event time </td>
    <td><cfinput type="text" name="eventTime" size="80" required="no" class="formsize"></td>
  </tr>
  <tr>
    <td>presenter </td>
    <td><cfinput type="text" name="presenter" size="80" required="no" class="formsize"></td>
  </tr>
  <tr>
    <td>event name</td>
    <td><cfinput type="text" name="eventName" size="68" required="yes" class="formbold formred formsize"></td>
  </tr>
  <tr>
    <td>venue</td>
    <td><cfinput type="text" name="venueName" size="80" required="yes" class="formred formsize"></td>
  </tr>
  <tr>
    <td valign="top">venue address</td>
    <td><textarea name="venueAddress" cols="77" rows="5" id="formtext"></textarea></td>
  </tr>
  <tr>
    <td>link label*</td>
    <td><cfinput type="text" name="eventLinkLabel" size="80" class="formsize" maxlength="100"></td>
  </tr>
  <tr>
    <td>link</td>
    <td><cfinput type="text" name="eventLink" size="80" class="formsize" maxlength="200"></td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
    <td><input type="submit" value="Save" name="Save">
      	<input type="reset" value="Clear" name="Reset">
		<input type="submit" value="Cancel" name="Cancel"></td></tr>
</table>
<p>*If link label is left blank, link will be displayed; [] = page color; {} = bold text</p>
</cfform>
</body></html>
</cfif>