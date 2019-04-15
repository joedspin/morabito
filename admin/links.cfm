<cfparam name="url.ID" default="0">
<cfset pageTitle="Links">
<cfinclude template="pageHead.cfm">
<p><font size="5">li<font color="#FFFF00">nks</font></font></p>
<cfquery name="allLinks" datasource="#DSN#">
	select *
	from menuR
  order by menuRnum, menuRRnum
</cfquery>
<cfset rn1=RandRange(0,9999)>
<cfset rn2=RandRange(0,9999)>
<cfform name="allLinks" action="linksAction.cfm" method="post">
<p>Click on a sprite to replace it. Put _blank in the target column to open the link in a new tab.</p>
<table border="1" bordercolor="#999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
<cfoutput query="allLinks">
  <tr>
    <td><cfinput type="text" name="linkname#ID#" value="#linkname#" size="25" required="yes" message="link name is required" maxlength="50"></td>
    <td><cfinput type="text" name="linkurl#ID#" value="#linkurl#" size="60" required="yes" message="link url is required" maxlength="200"></td>
    <td>#menuRnum#</td>
    <td>#menuRRnum#</td>
    <td><cfinput type="text" name="target#ID#" value="#target#" size="20" required="no" maxlength="10"></td>
    <td><a href="linksSprite.cfm?r=#menuRnum#&rr=#menuRRnum#"><img src="../images/menuR#menuRnum##menuRRnum#.png?rn1=#rn1#&rn2=#rn2#" height="30"></a></td>
	</tr>
</cfoutput>
<tr>
		<td colspan="5"><input type="submit" name="Save" value="Save"></td>
	</tr>
</table>
  <p>On page 5, use square brackets [] to indicate which part of the label is to appear in blue</p>
</cfform>
<cfinclude template="pageFoot.cfm">