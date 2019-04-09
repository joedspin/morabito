<cfset pageTitle="Chart: Delete">
<cfparam name="url.ID" default="0">

<cfinclude template="pageHead.cfm">
<p><font size="5">pi<font color="#FFFF00">cks</font></font></p>
	<p><a href="chart.cfm?showOld=false">current year&rsquo;s picks</a><br>
	<a href="chart.cfm?showOld=true">past years&rsquo; picks</a><br>
	<a href="chartAdd.cfm">add picks</a></p>
	<cfform name="playdate" action="chartDeleteAction.cfm" method="post">
	<p>are you sure you want to permanently delete the following picks (CANNOT BE UNDONE!)?</p>
<cfquery name="thisChart" datasource="#DSN#">
	select *
	from picks
	where ID=#url.ID#
</cfquery>
<table border="0" cellspacing="0" cellpadding="2">
	<cfoutput query="thisChart">
	<tr>
		<td colspan="5" class="chartHead">
			picks <font color="yellow">#chartTitle#</font>#chartYear#
		</td>
	</tr>
	<tr>
			<td colspan="5"><img src="spacer.gif" width="1" height="3"></td>
		</tr>
	<cfloop from="1" to="10" index="x">
		<cfdirectory directory="#serverPath#\media" filter="pick#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.mmm" name="chartCheck" sort="ASC" action="list">
		<tr>
			<td class="chartNumber" align="right">#x#</td>
			<td>&nbsp;</td>
			<td align="center" valign="middle"><cfif chartCheck.recordCount GT 0><a href="media/chart#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.mmm"><img src="images/speaker.gif" width="16" height="14" border="0"></a><cfelse><img src="images/spacer.gif" width="1" height="1"></cfif></td>
			<td>&nbsp;</td>
			<td valign="top" class="chartArtist">
				#Evaluate("pos" & x & "Artist")#
				<span class="chartTitle">#Evaluate("pos" & x & "Title")#</span>
			</td>
		</tr>
	</cfloop>
	<cfdirectory directory="#serverPath#\media" filter="pick#NumberFormat(ID,"0000")#-00.mmm" name="chartCheck" sort="ASC" action="list">
		<tr>
			<td class="chartNumber" align="right">Classic</td>
			<td>&nbsp;</td>
			<td align="center" valign="middle"><cfif chartCheck.recordCount GT 0><a href="media/chart#NumberFormat(ID,"0000")#-00.mmm"><img src="images/speaker.gif" width="16" height="14" border="0"></a><cfelse><img src="images/spacer.gif" width="1" height="1"></cfif></td>
			<td>&nbsp;</td>
			<td valign="top" class="chartArtist">
				#pos0Artist#
				<span class="chartTitle">#pos0Title#</span>
			</td>
		</tr>
		<tr>
			<td colspan="5"><img src="spacer.gif" width="1" height="10"></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<input name="ID" type="hidden" value="#ID#">
				<input name="delete" type="submit" id="delete" value="Yes">	
				<input name="cancel" type="submit" id="cancel" value="No">
			</td>
		</tr>
</table>
	</cfoutput>
</cfform>

<cfinclude template="pageFoot.cfm">