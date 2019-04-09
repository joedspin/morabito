<cfparam name="url.ID" default="0">
<cfset pageTitle="Links">
<cfinclude template="pageHead.cfm">
<p><font size="5">li<font color="#FFFF00">nks</font></font></p>
<cfquery name="allLinks" datasource="#DSN#">
	select *
	from menuR
</cfquery>
<cfform name="allLinks" action="linksAction.cfm" method="post">

<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<cfoutput query="allLinks">
  <tr>
    <td><cfinput type="text" name="linkname#ID#" value="#linkname#" size="25" required="yes" message="link name is required" maxlength="50"></td>
    <td><cfinput type="text" name="linkurl#ID#" value="#linkurl#" size="60" required="yes" message="link url is required" maxlength="200"></td>
    <td>#menuRnum#</td>
    <td>#menuRRnum#</td>
    <td><cfinput type="text" name="target#ID#" value="#target#" size="20" required="no" maxlength="10"></td>
	</tr>
</cfoutput>
<tr>
		<td colspan="5"><input type="submit" name="Save" value="Save"></td>
	</tr>
</table>
</cfform>
<cfinclude template="pageFoot.cfm">