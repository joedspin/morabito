<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
	<cfif isDefined("Cancel")>
		<cflocation URL="presentersAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfparam name="form.name" default="">
		<cfquery name="addPresenter" datasource="susanMorabitoRecords">
			insert into presenters (name)
			values (<cfqueryparam value="#form.presenterName#" cfsqltype="cf_sql_char">)
		</cfquery>
		<cflocation URL="presentersAdmin.cfm">
	</cfif>
<html>


<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Presenter Details</title>
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
<form name="presenterDetails" action="presentersAdd.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">
  <tr>
    <td>Presenter Name </td>
    <td><input type="text" name="presenterName" size="22"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
	<tr>
    <td colspan="4" align="center">
    <p>
      <input type="submit" value="Save" name="Save">&nbsp;
			<input type="submit" value="Cancel" name="Cancel"></p>
    </td>
  </tr>
</table>
</form>

</blockquote>
</body></html>

</cfif>