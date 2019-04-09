<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfparam name="form.ID" default="">
<cfparam name="url.ID" default="">
<cfif url.ID IS NOT "" OR form.ID IS NOT "">
	<cfif isDefined("Cancel")>
		<cflocation URL="presentersAdmin.cfm">
	</cfif>
	<cfif isDefined("Save")>
		<cfquery name="updatePresenter" datasource="susanMorabitoRecords">
			update presenters
			set name = <cfqueryparam value="#form.presenterName#" cfsqltype="cf_sql_char">
			where ID = #form.ID#
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
<cfquery name="thisPresenter" datasource="susanmorabitoRecords">
	select *
	from presenters
	where ID=#url.ID#
</cfquery>

<cfoutput query="thisPresenter">
<form name="presenterDetails" action="presentersEdit.cfm" method="post">
<table border="0" cellpadding="2" cellspacing="0">

  <tr>
    <td>Presenter Name </td>
    <td><input type="text" name="presenterName" size="22" value="#thisPresenter.name#"></td>
		<td colspan="2">&nbsp;</td>
  </tr>
	
  <tr>
    <td colspan="4" align="center">
    <p><input type="hidden" name="ID" value="#thisPresenter.ID#">
      <input type="submit" value="Save" name="Save">&nbsp;
      <input type="reset" value="Reset" name="Reset">&nbsp;
			<input type="submit" value="Cancel" name="Cancel"></p>
    </td>
  </tr>
  </table>

</form>
<form name="deletePresenter" action="presentersDelete.cfm" method="post">
<input type="hidden" name="deleteID" value="#thisPresenter.ID#">
<input type="submit" value="Delete" name="Delete">
</form>
</cfoutput>
</blockquote>
</body></html>



<cfelse>
You have reached this page in error.
</cfif>
</cfif>