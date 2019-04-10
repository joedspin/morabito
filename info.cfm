<cfset menuL=4>
<cfset menuR=4>
<cfparam name="url.rr" default="1">
<cfparam name="menuRR" default="#url.rr#">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>
<title>MORABITO</title>
<cfinclude template="styleBuilder.cfm">
</head>
<body>
<div id="site">
<div id="logo"><a href="index.cfm"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" border="0" /></a></div>
<cfinclude template="menuBuilder.cfm">
<div id="contentHolder"><div id="contentFrame"><div id="pageTitle">i<span class="pagecolor">nfo</span></div><div id="content">
<cfswitch expression="#menuRR#">
<cfcase value="1">
<cfquery name="thebio" datasource="#DSN#">
	select *
    from bioText
    where ID=1
</cfquery>
<cfoutput query="thebio">
<cfset thisbio=Replace(Replace(Replace(Replace(Replace(bioText,linefeed,"<br />","all"),"{","<b>","all"),"}","</b>","all"),"[","<span class='pagecolor'>","all"),"]","</span>","all")>
<cfset thisbio=Replace(Replace(Replace(thisbio,"—","&mdash;","all"),"–","&ndash;","all"),"’","&rsquo;","all")>
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">bio<span class="pagecolor">graphy</span></div></div></td>
	<td valign="top" width="430" style="font-size:16px;">#thisbio#</td>
</tr>
</table>
</cfoutput>
</cfcase>
<cfcase value="2">
<cfquery name="infoVenues" datasource="#DSN#">
	select *
    from infoVenues LEFT JOIN infoCities ON infoVenues.cityID=infoCities.ID
    order by cityName, venueName
</cfquery>
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">selected&nbsp;<span class="pagecolor">venues</span></div></div></td>
	<td valign="top" width="430">
<cfset lastcity="">
<cfoutput query="infoVenues">
<cfif cityName NEQ lastcity><cfif lastcity NEQ ""></p>
</cfif><p><b>#Replace(cityName," ","&nbsp;","all")#<cfif stateName EQ "DC">&nbsp;D.C.</cfif></b><cfset vstart=false><br /></cfif><cfif vstart>&nbsp;&middot; </cfif>#Replace(venueName," ","&nbsp;","all")#<cfset lastcity=cityName><cfset vstart=true></cfoutput>
</p></td>
</tr>
</table>
<img src="images/spacer.gif" height="30" width="400" />
<cfquery name="infoInternational" datasource="#DSN#">
	select *
    from infoInternational
    order by cityName
</cfquery>
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">inter<span class="pagecolor">national</span></div></div></td>
	<td valign="top" nowrap width="430"><p><cfoutput query="infoInternational"><b>#cityName#</b> #countryName#<br /></cfoutput></p></td>
</tr>
</table>
<img src="images/spacer.gif" height="30" width="400" />
<cfquery name="infoDanceParties" datasource="#DSN#">
	select *
    from infoDanceParties LEFT JOIN infoCities ON infoDanceParties.cityID=infoCities.ID
    order by danceParty
</cfquery>
<table width="475"border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">selected&nbsp;<span class="pagecolor">dance&nbsp;parties</span></div></div></td>
	<td valign="top" nowrap width="430"><p><cfoutput query="infoDanceParties"><b>#Trim(danceParty)#</b>&nbsp; #cityName#<cfif Trim(stateName) NEQ "">, #stateName#</cfif><br /></cfoutput></p></td>
</tr>
</table>
<img src="images/spacer.gif" height="30" width="400" />
<cfquery name="infoSpecialEvents" datasource="#DSN#">
	select *
    from infoSpecialEvents LEFT JOIN infoCities ON infoSpecialEvents.cityID=infoCities.ID
    order by specialEvent
</cfquery>
<div style="min-height: 275px;">
  <table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">selected&nbsp;<span class="pagecolor">special&nbsp;events</span></div></div></td>
	<td valign="top" nowrap width="430"><p><cfoutput query="infoSpecialEvents"><b>#Trim(specialEvent)#</b>&nbsp; #Trim(cityName)#<cfif Trim(stateName) NEQ "">, #Trim(stateName)#</cfif><br /></cfoutput></p></td>
</tr>
</table>
</div>
</cfcase>
<cfcase value="3">
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">disc<span class="pagecolor">ography</span></div></div></td>
	<cfset imgtype="discography">
	<td valign="top" width="430"><cfinclude template="gallery.cfm"></td>
</tr>
</table>
</cfcase>
<cfcase value="4">
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">flyer <span class="pagecolor">gallery</span></div></div></td>
  <cfset imgtype="gallery">
	<td valign="top" width="430"><cfinclude template="gallery.cfm"></td>
</tr>
</table>
</cfcase>
<cfcase value="5">
<table width="475" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">sh<span class="pagecolor">op</span></div></div></td>
	<td valign="top" width="430"><p style="font-size:16px; font-weight:bold;">Coming Soon</p></td>
</tr>
</table>
</cfcase>
</cfswitch>
      </div>
    </div></div>
</div>
<!---<div id="superimpose"><img src="images/MorabitoWeb11infoREV.jpg" width="960" height="768" /></div>//--->
</body>
</html>


