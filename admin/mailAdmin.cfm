<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">
<cfquery name="allMail" datasource="susanmorabitoRecords">
	select *
	from mailingList
	order by dateAdded DESC
</cfquery>
<table border="0" cellpadding="2" cellspacing="0">
<tr><td colspan="3"><font size="5">mailing list</font></td></tr>
<tr>
	<td colspan="3"><a href="mailAdd.cfm">add new entry</a></font></td>
</tr>
<tr>
	<td><b>name</b></td>
	<td><b>email</b></td>
	<td><b>date added</b></td>
</tr>
<cfoutput query="allMail">
<tr>
	<td><a href="mailEdit.cfm?ID=#ID#">#name#</a></td>
	<td>#email#</td>
	<td>#DateFormat(dateAdded,"mm/d/yyyy")#</td>
</tr>
</cfoutput>

</table>
</body>

</html>