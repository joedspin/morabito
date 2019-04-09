<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfif isDefined("Cancel")>
	<cflocation URL="podcastAdmin.cfm">
</cfif>
<cfif isDefined("Save")>
    <cfparam name="form.podcastDate" default="#varDateODBC#">
    <cfparam name="form.podcastLabel" default="podcast">
    <cfparam name="form.url" default="">
	<cfquery name="addPodcast" datasource="susanMorabitoRecords">
		insert into podcasts (podcastDate, podcastLabel, url)
		values (			
			<cfqueryparam value="#form.podcastDate#" cfsqltype="cf_sql_date">,
			<cfqueryparam value="#form.podcastLabel#" cfsqltype="cf_sql_char">,
			<cfqueryparam value="#form.url#" cfsqltype="cf_sql_char">)
	</cfquery>
<cfif isDefined("Save")>
		<cflocation URL="podcastAdmin.cfm">
	</cfif>
<cfquery name="newPodcast" datasource="susanmorabitoRecords">
	select Max(ID) AS podcastID  FROM podcasts
</cfquery> 
	<cflocation URL="podcastEdit.cfm?ID=#newPodcast.podcastID#">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">pod<font color="#FFFF00">casts</font></font></p>
<cfform name="podcastDetails" action="podcastAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
    <tr>
    <td>podcast label</td>
    <td><cfinput type="text" name="podcastLabel" value="podcast" size="40" required="yes" message="podcast label is required - this is the text that appears sideways on the music page" class="formsize">
  <tr>
    <td>podcast date (mm/dd/yy)</td>
    <td><cfinput type="text" name="podcastDate" value="#DateFormat(varDateODBC,"mm/dd/yyyy")#" size="40" required="yes" message="podcast date is required and must be a valid date" validate="date" class="formsize"></td>
  </tr>
  <tr>
    <td>url</td>
    <td><cfinput type="text" name="url" size="100" required="no" class="formsize" maxlength="200"></td>
  </tr>
  
  <tr>
  	<td>&nbsp;</td>
    <td><input type="submit" value="Save" name="Save"></td></tr>
</table>
</cfform>
</body></html>
</cfif>