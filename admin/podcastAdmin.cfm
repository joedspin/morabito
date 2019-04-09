<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">

<cfquery name="allPodcasts" datasource="susanmorabitoRecords">
	select *
	from podcasts
	order by podcastDate DESC
</cfquery>
<p><font size="5">pod<font color="#FFFF00">casts</font></font></p>
<p><a href="podcastAdd.cfm">add new podcast</a></p>
<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<cfoutput query="allPodcasts">
<tr>
	<td>#podcastLabel# <font color="yellow">#DateFormat(podcastDate,"mm")#</font>#DateFormat(podcastDate,"yy")#</td>
	<td><a href="podcastEdit.cfm?ID=#ID#">EDIT</a></td>
	<td><a href="podcastDelete.cfm?ID=#ID#">DELETE</a></td>
    <td><iframe width="432" height="166" scrolling="no" frameborder="no" src="#url#"></iframe></td>
</tr>
</cfoutput>
</table>
</body>

</html>
