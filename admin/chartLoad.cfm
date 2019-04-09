<cfset pageTitle="Chart: Upload">
<cfinclude template="pageHead.cfm">
<p><font size="5">pi<font color="#FFFF00">cks</font></font></p>
<p><a href="chart.cfm?showOld=false">current year&rsquo;s picks</a><br>
<a href="chart.cfm?showOld=true">past years&rsquo; picks</a><br>
<a href="chartAdd.cfm">add picks</a></p>
<cfparam name="url.ID" default="">
<cfquery name="thisChart" datasource="#DSN#">
	select *
	from picks
	where ID=#url.ID#
</cfquery>
<style>td {vertical-align:middle;} input {margin-top:0px; margin-bottom:0px; padding-top:0px; padding-bottom:0px;} form {margin:0px; padding:0px;}</style>
<table border="0" cellspacing="0" cellpadding="3">
	<cfoutput query="thisChart">
	<tr>
		<td colspan="2"><font size="6">picks <font color="##FFFF00">#chartTitle#</font>#chartYear#</font></td>
	</tr>
	<cfloop from="1" to="10" index="x">
		<cfdirectory directory="#serverPath#\media" filter="pick#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.mp3" name="chartCheck" sort="ASC" action="list">
		<tr>
			<td align="right">#x#</td>
			<td align="center"  ><cfif chartCheck.recordCount GT 0><a href="http://www.djmorabito.com/media/pick#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.mp3"><img src="images/speaker.gif" width="16" height="14" border="0"></a><cfelse><img src="images/spacer.gif" width="1" height="1"></cfif></td>
			<td class="chartArtist">
				#Evaluate("pos" & x & "Artist")# <span class="chartTitle">#Evaluate("pos" & x & "Title")#</span>
			</td>
			<td>
				<cfform name="chartLoad#x#" action="chartLoadAction.cfm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="ID" value="#ID#"><input type="hidden" name="x" value="#x#"><input type="hidden" name="ftype" value="mp3" />
					<cfif chartCheck.recordCount GT 0>
						<input type="submit" name="delete" value="Delete MP3">
					<cfelse>
						<input type="file" name="uploadFile" size="45"><input type="submit" name="upload" value="Upload MP3">
					</cfif>
				</cfform>
			</td>
            <!---<cfdirectory directory="#serverPath#\media" filter="pick#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.ogg" name="chartCheck" sort="ASC" action="list">
			<td align="center"><cfif chartCheck.recordCount GT 0><a href="http://www.djmorabito.com/media/pick#NumberFormat(ID,"0000")#-#NumberFormat(x,"00")#.ogg"><img src="images/speaker.gif" width="16" height="14" border="0"></a><cfelse><img src="images/spacer.gif" width="1" height="1"></cfif></td>
			<td><cfform name="chartLoad#x#" action="chartLoadAction.cfm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="ID" value="#ID#"><input type="hidden" name="x" value="#x#"><input type="hidden" name="ftype" value="ogg" />
					<cfif chartCheck.recordCount GT 0>
						<input type="submit" name="delete" value="Delete OGG">
					<cfelse>
						<input type="file" name="uploadFile" size="45"><input type="submit" name="upload" value="Upload OGG">
					</cfif>
				</cfform>
			</td>
			<td>
				
			</td>//--->
		</tr>
	</cfloop>
	</cfoutput></table>
			<cfform name="chartLoadCancel" action="chartLoadAction.cfm" method="post" enctype="multipart/form-data">
				 <input type="submit" value="Cancel" name="Cancel">
			</cfform>
<cfinclude template="pageFoot.cfm">