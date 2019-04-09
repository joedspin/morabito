<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
	<cfif isDefined("Cancel")>
		<cflocation URL="picksAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfparam name="form.active" default="No">
		<cfquery name="addPicks" datasource="susanMorabitoRecords">
			insert into picks (chartTitle, chartYear, pos1Title, pos1Artist, pos2Title, pos2Artist, pos3Title, 
				pos3Artist, pos4Title, pos4Artist, pos5Title, pos5Artist, pos6Title, pos6Artist, pos7Title, pos7Artist, pos8Title, 
				pos8Artist, pos9Title, pos9Artist, pos10Title, pos10Artist, active)
			values ('#form.chartTitle#', '#form.chartYear#', '#form.pos1Title#', '#form.pos1Artist#', '#form.pos2Title#',
				'#form.pos2Artist#', '#form.pos3Title#', '#form.pos3Artist#', '#form.pos4Title#', '#form.pos4Artist#', '#form.pos5Title#', '#form.pos5Artist#', '#form.pos6Title#', '#form.pos6Artist#', '#form.pos7Title#',
				'#form.pos7Artist#', '#form.pos8Title#', '#form.pos8Artist#', '#form.pos9Title#', '#form.pos9Artist#', '#form.pos10Title#', '#form.pos10Artist#', #form.active#)
		</cfquery>
		<cflocation URL="picksAdmin.cfm">
	</cfif>
<html>


<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Picks Details</title>
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
<p style="line-height: 0; margin-top: 0; margin-bottom: 6">&nbsp;</p>
<blockquote>
<cfform name="picksDetails" action="picksAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">

  <tr>
          <td>Title</td>
    <td><cfinput type="text" name="chartTitle" size="22"></td>
          <td>Year</td>
    <td><cfinput type="text" name="chartYear" size="22"></td>
  </tr>
	  <tr>
          <td>Position 1 ARTIST</td>
    <td><cfinput type="text" name="pos1Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos1Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 2 ARTIST</td>
    <td><cfinput type="text" name="pos2Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos2Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 3 ARTIST</td>
    <td><cfinput type="text" name="pos3Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos3Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 4 ARTIST</td>
    <td><cfinput type="text" name="pos4Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos4Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 5 ARTIST</td>
    <td><cfinput type="text" name="pos5Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos5Title" size="22"></td>
  </tr>
	  <tr>
          <td>Position 6 ARTIST</td>
    <td><cfinput type="text" name="pos6Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos6Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 7 ARTIST</td>
    <td><cfinput type="text" name="pos7Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos7Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 8 ARTIST</td>
    <td><cfinput type="text" name="pos8Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos8Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 9 ARTIST</td>
    <td><cfinput type="text" name="pos9Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos9Title" size="22"></td>
  </tr>
	<tr>
          <td>Position 10 ARTIST</td>
    <td><cfinput type="text" name="pos10Artist" size="22"></td>
		<td>Title</td>
    <td><cfinput type="text" name="pos10Title" size="22"></td>
  </tr>
	<tr>
		<td>Active?</td>
		<td colspan="3"><cfinput type="checkbox" name="active" value="Yes"></td>
	</tr>
	<tr>
		<td colspan="4"><input type="submit" name="Save" value="Save"> <input type="submit" value="Cancel" name="Cancel"></td>
	</tr>
</table>
</cfform>

</blockquote>
</body></html>

</cfif>