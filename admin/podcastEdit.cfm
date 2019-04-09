<cfparam name="url.ID" default="0">
<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfif isDefined("Save")>
	<cfparam name="form.ID" default="0">
    <cfparam name="form.podcastDate" default="#varDateODBC#">
    <cfparam name="form.podcastLabel" default="">
    <cfparam name="form.url" default="">
	<cfquery name="editPodcast" datasource="susanMorabitoRecords">
		update podcasts
        set 
            podcastDate=<cfqueryparam value="#form.podcastDate#" cfsqltype="cf_sql_date">,
            podcastLabel=<cfqueryparam value="#form.podcastLabel#" cfsqltype="cf_sql_char">,
			url=<cfqueryparam value="#form.url#" cfsqltype="cf_sql_char">
         where ID=#form.ID#
	</cfquery>
	<cflocation URL="podcastAdmin.cfm">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">pod<font color="#FFFF00">casts</font></font></p>
<cfquery name="thisPodcast" datasource="#DSN#">
	select *
    from podcasts
    where ID=#url.ID#
</cfquery>
<cfform name="podcastDetails" action="podcastEdit.cfm" method="post">
<cfoutput query="thisPodcast">
<input type="hidden" name="ID" value="#ID#" />
<table border="0" cellpadding="2" cellspacing="0">
	<tr>
    <td>podcast label</td>
    <td><cfinput type="text" name="podcastLabel" value="#podcastLabel#" size="40" required="yes" message="podcast label is required - this is the text that appears sideways on the music page" class="formsize">
  <tr>
    <td>podcast date (mm/dd/yy)</td>
    <td><cfinput type="text" name="podcastDate" value="#DateFormat(podcastDate,"mm/dd/yyyy")#" size="40" required="yes" message="podcast date is required and must be a valid date" validate="date" class="formsize"></td>
  </tr>
  <tr>
    <td>url</td>
    <td><cfinput type="text" name="url" value="#url#" size="100" required="no" class="formsize" maxlength="200"></td>
  </tr>
  
  <tr>
  	<td>&nbsp;</td>
    <td><input type="submit" value="Save" name="Save"></td></tr>
</table>
</cfoutput>
</cfform>
</body></html>
</cfif>