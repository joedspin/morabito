<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<cfparam name="form.ID" default="">
<cfparam name="form.uploadFile" default="">
<cfif form.ID NEQ ""><cfset url.ID=form.ID></cfif>
<cfif form.uploadFile NEQ "">
<cffile action="upload"
	destination="c:\inetpub\susanmorabito\wwwroot"
	nameConflict="overwrite"
	fileField="uploadFile">
	</cfif>
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
<cfparam name="url.ID" default="">
<cfquery name="allPicks" datasource="susanmorabitoRecords">
	select *
	from picks
	where ID=#url.ID#
</cfquery>
<cfform action="picksLoad.cfm" method="post" enctype="multipart/form-data">
<cfoutput query="allPicks">
	<p><b>#chartTitle#<br>
	#chartYear#</b></p>
	<p><b>FILENAMES:</b> pick#NumberFormat(ID,"0000")#-00.mmm</p>
	<input type="hidden" name="ID" value="#ID#">
</cfoutput>
<cfdirectory directory="c:\inetpub\susanmorabito\wwwroot" filter="pick#NumberFormat(ID,"0000")#*.*" name="pickFiles" sort="ASC" action="list">
<p><b>Existing Files:</b><br><cfoutput query="pickFiles">
#name# <font size="1">(#NumberFormat(size,",")#) #DateLastModified#</font><br></cfoutput></p>
<p>Select a file to upload: <input type="file" name="uploadFile" size="45"></p>
<input type="submit" name="submit" value="Upload">
</cfform>
</blockquote>
</body>

</html>
</cfif>