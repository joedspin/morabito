<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SusanMorabito.com</title>
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
<p><a href="index.cfm"><font face="Arial, Helvetica, sans-serif">Admin Home</font></a></p>
<cfquery name="allVenues" datasource="susanmorabitoRecords">
	select *
	from venuesQuery
	order by name ASC
</cfquery>
<table border="1" cellpadding="5" style="border-collapse: collapse" bordercolor="##111111">
<tr><td colspan="2"><font face="Arial, Helvetica, sans-serif">Venues</font></td></tr>
<tr>
	<td><font face="Arial, Helvetica, sans-serif"><b>Name</b></font></td>
	<td><font face="Arial, Helvetica, sans-serif"><b>City</b></font></td>

</tr>
<cfoutput query="allVenues">
<tr>
	<td><font face="Arial, Helvetica, sans-serif"><a href="venueEdit.cfm?ID=#ID#">#name#</a></font></td>
	<td><font face="Arial, Helvetica, sans-serif">#city#</font></td>
</tr>
</cfoutput>
<tr>
	<td colspan="2"><font face="Arial, Helvetica, sans-serif"><a href="venueAdd.cfm">Add New Venue</a></font></td>
</tr>
</table>
</blockquote>
</body>

</html>
</cfif>