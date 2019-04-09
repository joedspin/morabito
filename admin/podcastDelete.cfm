<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">

<p><font size="5">pod<font color="#FFFF00">casts</font></font></p>
<cfquery name="thisPodcast" datasource="#DSN#">
	select *
	from podcasts
	where ID=#url.ID#
</cfquery>
<cfoutput query="thisPodcast">
<p><b>are you sure you want to delete this podcast (CANNOT BE UNDONE!)?</b></p>
<table border="1" bordercolor="##999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
	<td><a href="perfEdit.cfm?ID=#ID#">#podcastLabel# <font color="yellow">#DateFormat(podcastDate,"mm")#</font>#DateFormat(podcastDate,"yy")#</a></td>
</tr>
</table>
<p><a href="podcastDeleteAction.cfm?ID=#url.ID#">YES</a> | <a href="podcastAdmin.cfm">NO</a></p>
</cfoutput>

</body>

</html>