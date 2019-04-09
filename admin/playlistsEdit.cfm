<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
	<cfif isDefined("Cancel")>
		<cflocation URL="playlistsAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfparam name="form.active" default="No">
		<cfparam name="form.ID" default="0">
		<cfquery name="updatePlaylist" datasource="susanMorabitoRecords">
			update playlists
			set shortTitle = '#form.shortTitle#',
				fullTitle = '#form.fullTitle#',
				subTitle = '#form.subtitle#',
				playdate = '#form.playdate#',
				playlist = '#form.playlist#',
				active = #form.active#
			where ID = #form.ID#
		</cfquery>
		<cflocation URL="playlistsAdmin.cfm">
	</cfif>
<html>


<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Playlist Details</title>
<base target="_self">
<style>
<!--
a            { font-family: Arial,Helvetica; text-decoration: none; color: #333333; 
               font-weight: bold }
a:link       { font-family: Arial,Helvetica; text-decoration: none; color: #333333; 
               font-weight: bold }
body         { font-family: Arial; font-size: 14pt }
table        { font-family: Arial; font-size: 12pt }
textarea 		{ font-family: Arial}
input				{ font-family: Arial}
//-->
</style>
</head>
<body leftmargin="0" topmargin="0">
    <table border="0" cellpadding="10" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
      <tr>      
    <td width="100%" bgcolor="#330066">
        <font face="Arial" size="5" color="#FFFFFF">
        <strong>SusanMorabito.com</strong> Site Administration</font></td>
      </tr>
    </table>
<p><b>Playlists</b></p>
<blockquote>
<cfquery name="thisPlaylist" datasource="susanmorabitorecords">
	select *
	from playlists
	where ID = #url.ID#
</cfquery>
<cfoutput query="thisPlaylist">
<cfform name="PlaylistDetails" action="playlistsEdit.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">

  <tr>
          <td>Title</td>
    <td><cfinput type="text" name="fullTitle" size="80" value="#fullTitle#"></td>
    </tr>
		<tr>
		<td>Subtitle</td>
    <td><textarea cols="80" rows="4" name="subTitle">#subTitle#</textarea></td>
  </tr>
	<tr>
	<td>Play Date</td>
    <td><cfinput type="text" name="playdate" size="80" value="#DateFormat(playdate,"mm/dd/yy")#" required="yes" validate="date" message="Play Date is required and must be in the form MM/DD/YY"></td>
  </tr>
	<td>Link Title</td>
    <td><cfinput type="text" name="shortTitle" size="80" value="#shortTitle#"></td>
  </tr>
	 <tr>
	 	<td valign="top">Playlist</td>
		<td><textarea cols="100" rows="25" name="playlist">#HTMLEditFormat(playlist)#</textarea></td>
	 </tr>
	<tr>
		<td>Active?</td>
		<td><cfinput type="checkbox" name="active" value="Yes" checked="#active#"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="ID" value="#url.ID#">
		<input type="submit" name="Save" value="Save"> <input type="submit" value="Cancel" name="Cancel"></td>
	</tr>
</table>
</cfform>
</cfoutput>
</blockquote>
</body></html>

</cfif>