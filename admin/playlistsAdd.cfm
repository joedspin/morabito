<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
	<cfif isDefined("Cancel")>
		<cflocation URL="playlistsAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfparam name="form.active" default="No">
		<cfquery name="addPlaylist" datasource="susanMorabitoRecords">
			insert into playlists (fullTitle, subTitle, shortTitle, playdate, playlist, active)
			values ('#form.fullTitle#','#form.subTitle#','#form.shortTitle#','#form.playdate#','#form.playlist#',#form.active#)
		</cfquery>
		<cflocation URL="playlistsAdmin.cfm">
	</cfif>
<html>


<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Playlists</title>
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
<cfform name="PlaylistDetails" action="playlistsAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">

  <tr>
          <td>Title</td>
    <td><cfinput type="text" name="fullTitle" size="80"></td>
		</tr>
	 <tr>
          <td>Subtitle</td>
    <td><textarea cols="80" rows="4" name="subTitle"></textarea></td>
  </tr>
	<td>Play Date</td>
    <td><cfinput type="text" name="playdate" size="80" required="yes" validate="date" message="Play Date is required and must be in the form MM/DD/YY"></td>
  </tr>
	<td>Link Title</td>
    <td><cfinput type="text" name="shortTitle" size="80"></td>
  </tr>
	 <tr>
	 	<td valign="top">Playlist</td>
		<td><textarea cols="100" rows="25" name="playlist"></textarea></td>
	 </tr>
	<tr>
		<td>Active?</td>
		<td><cfinput type="checkbox" name="active" value="Yes" checked="yes"></td>
	</tr>
	<tr>
		<td>
		<input type="submit" name="Save" value="Save"> <input type="submit" value="Cancel" name="Cancel"></td>
	</tr>
</table>
</cfform>

</blockquote>
</body></html>

</cfif>