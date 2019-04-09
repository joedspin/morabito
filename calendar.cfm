<cfset thisPage="calendar">
<cfset menuL=3>
<cfset menuR=1>
<cfset menuRR=0>
<cfquery name="perfs" datasource="susanMorabitoRecords">
	select *
	from playdates
    where playdate>=<cfqueryparam value="#varDateODBC#" cfsqltype="cf_sql_date">
	order by playdate
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>
<title>MORABITO > playdates</title>
<cfinclude template="styleBuilder.cfm">
</head>
<body>
<div id="site">
<div id="logo"><a href="index.cfm"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" border="0" /></a></div>
<cfinclude template="menuBuilder.cfm">
<div id="contentHolder"><div id="contentFrame"><div id="pageTitle">play<span class="pagecolor">dates</span></div><div id="content">
<cfset datestarted=false>
<cfoutput query="perfs">
<table width="475" border="0" cellpadding="0" cellspacing="0">
<cfset cSpace=Find(" ",cityLabel)>
<cfif cSpace EQ 0>
	<cfset cSpace=Find("|",cityLabel)>
	<cfif cSpace EQ 0>
        <cfset cSpace=(Int(Len(cityLabel)/2))>
        <cfset city1=Left(cityLabel,cSpace)>
        <cfset city2=Trim(Right(cityLabel,Len(cityLabel)-cSpace))>
	<cfelse>
        <cfset city1=Left(cityLabel,cSpace-1)>
        <cfset city2=Trim(Right(cityLabel,Len(cityLabel)-cSpace))>
	</cfif>
<cfelseif cSpace EQ 0>
	<cfset cSpace=(Int(Len(cityLabel)/2))>
	<cfset city1=Left(cityLabel,cSpace)>
    <cfset city2=Trim(Right(cityLabel,Len(cityLabel)-cSpace))>
<cfelse>
    <cfset city1=Left(cityLabel,cSpace)>
    <cfset city2=Trim(Right(cityLabel,Len(cityLabel)-cSpace))>
</cfif>

<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">#LCase(city1)#<span class="pagecolor">#Lcase(city2)#</span></div></div></td>
    <td width="250" valign="top"><p class="playdate<cfif NOT datestarted> playdatetop</cfif>"><b>#DateFormat(playdate,"dddd, mmmm d, yyyy")#</b><br />
<cfif eventTime NEQ "">#eventTime#<br /></cfif>
&nbsp;<br />
<cfif presenter NEQ "">#presenter#<br /></cfif>
<cfif eventName NEQ ""><b><span class="pagecolor">#eventName#</span></b><br />
&nbsp;<br /></cfif>
<cfif venueName NEQ ""><span class="pagecolor">#venueName#</span><br /></cfif>
<cfif venueAddress NEQ "">#Replace(Replace(venueAddress,linefeed,"<br />","all"),hardfeed,"<br />","all")#<br /></cfif>
&nbsp;<br />
<cfif eventLink NEQ ""><a href="<cfif Find("http://",eventLink) EQ 0>http://</cfif>#eventLink#" target="_blank"><cfif Trim(eventLinkLabel NEQ "")>#eventLinkLabel#<cfelse>#eventLink#</cfif></a></cfif></p></td>
	<td width="3"><img src="images/spacer.gif" height="50" width="3" /></td>
    <td width="177" valign="top" ><cfif Trim(eventGraphic) NEQ ""><a href="images/flyers/#eventGraphic#" target="_blank"><img src="images/flyers/#eventGraphic#" width="177" border="0" /></a><cfelse><img src="images/spacer.gif" width="177" height="267" /></cfif></td>
    </tr></table>
	<img src="images/spacer.gif" height="35" width="500" /><cfset datestarted=true></cfoutput>

</div></div></div><!---<div id="superimpose"><img src="images/MorabitoWeb11calendarREV.jpg" width="960" height="768" /></div>//--->
</body>
</html>