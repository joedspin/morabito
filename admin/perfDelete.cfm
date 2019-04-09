<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">

<p><font size="5">play<font color="#FFFF00">dates</font></font></p>
<cfquery name="thisPerf" datasource="#DSN#">
	select *
	from playdates
	where ID=#url.ID#
</cfquery>
<cfoutput query="thisPerf">
<p><b>are you sure you want to delete this play date (CANNOT BE UNDONE!)?</b></p>
<table border="1" bordercolor="##999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
	<td><b>date</b></td>
	<td><b>event</b></td>
	<td><b>city</b></td>
</tr>
<tr>
	<td><a href="perfEdit.cfm?ID=#ID#">#DateFormat(playdate,"dddd mmmm d, yyyy")#</a></td>
	<td>#eventName#</td>
	<td>#cityLabel#</td>
</tr>
</table>
<p><a href="perfDeleteAction.cfm?ID=#url.ID#">YES</a> | <a href="perfAdmin.cfm">NO</a></p>
</cfoutput>

</body>

</html>