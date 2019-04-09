<cfparam name="url.ID" default="0">
<cfset pageTitle="Chart: Edit">
<cfinclude template="pageHead.cfm">
<p><font size="5">pi<font color="#FFFF00">cks</font></font></p>
<p><a href="chart.cfm?showOld=false">current year&rsquo;s picks</a><br>
	<a href="chart.cfm?showOld=true">past years&rsquo; picks</a><br>
	<a href="chartAdd.cfm">add picks</a></p>
<cfquery name="thisChart" datasource="#DSN#">
	select *
	from picks
	where ID=#url.ID#
</cfquery>
<cfform name="chartDetails" action="chartEditAction.cfm" method="post">
<cfoutput query="thisChart">
<input type="hidden" name="ID" value="#url.ID#">
<table border="1" bordercolor="##999999" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <td class="oTabHead">picks month (2 digits)</td>
    <td colspan="2"><cfinput type="text" name="chartTitle" value="#chartTitle#" size="5" required="yes" message="picks month is required." maxlength="2"></td>
	</tr>
	<tr>
    <td class="oTabHead">picks year (2 digits)</td>
    <td colspan="2"><cfinput type="text" name="chartYear" value="#chartYear#" size="5" required="yes" message="picks year is required." maxlength="4"></td>
	</tr>
	<tr>
		<td class="oTabHead">visible?</td>
		<td colspan="2"><cfinput type="checkbox" name="active" value="Yes" checked="#YesNoFormat(active)#"></td>
	</tr>
	<tr>
    <td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">1</font></td>
		<td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos1Artist" size="38" value="#pos1Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos1Title" size="38" value="#pos1Title#"></td>//--->
  </tr>
	<tr>
    <td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">2</font></td>
		<td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos2Artist" size="38" value="#pos2Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos2Title" size="38" value="#pos2Title#"></td>//--->
  </tr>
	<tr>
    <td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">3</font></td>
		<td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos3Artist" size="38" value="#pos3Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos3Title" size="38" value="#pos3Title#"></td>//--->
  </tr>
	<tr>
    <td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">4</font></td>
		<td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos4Artist" size="38" value="#pos4Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos4Title" size="38" value="#pos4Title#"></td>//--->
  </tr>
	<tr>
    <td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">5</font></td>
		<td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos5Artist" size="38" value="#pos5Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos5Title" size="38" value="#pos5Title#"></td>//--->
  </tr>
	<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">6</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos6Artist" size="38" value="#pos6Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos6Title" size="38" value="#pos6Title#"></td>//--->
  </tr>
	<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">7</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos7Artist" size="38" value="#pos7Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos7Title" size="38" value="#pos7Title#"></td>//--->
  </tr>
	<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">8</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos8Artist" size="38" value="#pos8Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos8Title" size="38" value="#pos8Title#"></td>//--->
  </tr>
	<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">9</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos9Artist" size="38" value="#pos9Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos9Title" size="38" value="#pos9Title#"></td>//--->
  </tr>
	<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">10</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos10Artist" size="38" value="#pos10Artist#"></td>
		<!---<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos10Title" size="38" value="#pos10Title#"></td>//--->
  </tr>
	<!---<tr>
		<td class="oTabHead" style="vertical-align:middle; text-align:center;"><font size="5">Classic</font></td>
    <td class="oTabHead">title</td>
    <td><cfinput type="text" name="pos0Artist" size="38" value="#pos0Artist#"></td>
		<td class="oTabHead">Title</td>
    <td><cfinput type="text" name="pos0Title" size="38" value="#pos0Title#"></td>
  </tr>//--->
	<tr>
		<td>&nbsp;</td>
		<td colspan="4"><input type="submit" name="Save" value="Save"></td>
	</tr>
</table>
</cfoutput>
</cfform>
<cfinclude template="pageFoot.cfm">