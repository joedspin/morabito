<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">

<cfquery name="allPerfs" datasource="susanmorabitoRecords">
	select *
	from playdates
    where playdate>=<cfqueryparam value="#varDateODBC#" cfsqltype="cf_sql_date">
    order by playdate
</cfquery>
<p><font size="5">play<font color="#FFFF00">dates</font></font></p>
<p><a href="perfAdd.cfm">add new playdate</a></p>
<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<tr>
	<td><b>date</b></td>
	<td><b>delete</b></td>
	<td><b>event</b></td>
	<td><b>city</b></td>
    <td colspan="2"><b>flyer</b></td>
</tr>
<cfoutput query="allPerfs">
<tr>
	<td valign="top"><a href="perfEdit.cfm?ID=#ID#">#DateFormat(playdate,"dddd mmmm d, yyyy")#</a></td>
	<td valign="top"><a href="perfDelete.cfm?ID=#ID#">DELETE</a></td>
	<td valign="top">#eventName#</td>
	<td valign="top">#cityLabel#</td>
    <td valign="top"><form style="margin:0px; padding:0px;" name="loadgraphic#ID#" action="perfLoadGraphic.cfm" method="post" enctype="multipart/form-data"><input type="hidden" name="ID" value="#ID#" /><cfif Trim(eventGraphic) NEQ ""><a href="../images/flyers/#eventGraphic#" target="_blank"><img src="../images/flyers/#eventGraphic#" width="50" border="0" /></a><input type="submit" name="delete" value="delete flyer" /><cfelse><input type="file" name="uploadFile" size="15"><input type="submit" name="upload" value="upload flyer"></cfif></form></td>
</tr>
</cfoutput>
</table>
<p>NOTE: Flyers must be JPEGs</p>
</body>

</html>
