<cfset thisPage="music">
<cfset menuL=2>
<cfset menuR=2>
<cfset menuRR=0>
<cfparam name="url.pickedID" default="0">
<cfquery name="currentPicks" datasource="#DSN#" maxrows="1">
	select *
	from picks
	where active=<cfqueryparam value="Yes" cfsqltype="cf_sql_bit"> 
    order by ID DESC
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>
<!---<link rel="stylesheet" type="text/css" href="css/inlineplayer.css" />//--->
<script type="text/javascript" src="script/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="script/soundmanager2.js"></script>
<script type="text/javascript" src="script/inlineplayer.js"></script>
<script>
function flipit(button) 
{
	$(button).toggle(
      function(){
	$(button).css('backgroundPosition', '0px 0px');
      }, 
      function () {
	$(button).css('backgroundPosition', '-19px 0px');
    });
}
</script>
<title>MORABITO > music</title>
<cfinclude template="styleBuilder.cfm">
</head>
<body>
<div id="site">
<div id="logo"><a href="index.cfm"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" border="0" /></a></div>
<cfinclude template="menuBuilder.cfm">
<div id="contentHolder"><div id="contentFrame">
<div id="pageTitle">m<span class="pagecolor">usic</span></div>
<div id="content">


<cfoutput query="currentPicks">
<table width="455" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td rowspan="5" valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">picks&nbsp;<span class="pagecolor">#chartTitle#</span>#chartYear#</div></div></td>
	<td width="25"><a href="media/pick#NumberFormat(currentPicks.ID,"0000")#-01.mp3" id="playbutton"><img src="images/spacer.gif" width="19" height="18" border="0" /></a></td><td width="200"><div id="chartentry">#pos1Artist# #pos1Title#</div></td>
	<td width="25"><cfif pos6Artist NEQ ""><a href="media/pick#NumberFormat(currentPicks.ID,"0000")#-06.mp3" id="playbutton"><img src="images/spacer.gif" width="19" height="18" border="0" /></a></cfif></td><td width="200"><cfif pos6Artist NEQ ""><div id="chartentry">#pos6Artist# #pos6Title#</div></cfif></td>
</tr>
<cfloop from="2" to="5" index="x">
<cfset y=x+5>
<tr>
<td width="25"><a href="media/pick#NumberFormat(currentPicks.ID,"0000")#-#NumberFormat(x,"00")#.mp3" id="playbutton"><img src="images/spacer.gif" width="19" height="18" border="0" /></a></td><td width="200"><div id="chartentry">#Evaluate("pos" & x & "Artist")# #Evaluate("pos" & x & "Title")#</div></td>
<td width="25"><cfif Evaluate("pos" & y & "Artist") NEQ ""><a href="media/pick#NumberFormat(currentPicks.ID,"0000")#-#NumberFormat(x+5,"00")#.mp3" id="playbutton"><img src="images/spacer.gif" width="19" height="18" border="0" /></a></cfif></td><td width="200"><cfif Evaluate("pos" & y & "Artist") NEQ ""><div id="chartentry">#Evaluate("pos" & y & "Artist")# #Evaluate("pos" & y & "Title")#</div></cfif></td>
</tr>
</cfloop>
</table>
</cfoutput>
<img src="images/spacer.gif" height="15" width="400" />
<cfquery name="podcasts" datasource="#DSN#">
	select *
    from podcasts
    order by podcastDate DESC
</cfquery>
<cfoutput query="podcasts">
<img src="images/spacer.gif" height="35" width="400" />
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td nowrap width="45" valign="top"><div id="sidecontainer"><div id="sidetitle">#LCase(podcastLabel)#&nbsp;<span class="pagecolor">#DateFormat(podcastDate,"mm")#</span>#DateFormat(podcastDate,"yy")#</div></div></td>
    <td width="432"><iframe width="432" height="166" scrolling="no" frameborder="no" src="#url#"></iframe></td></tr></table>
    </cfoutput>
<!---<div id="superimpose"><img src="images/MorabitoWeb11musicREV2.jpg" width="960" height="768" /></div>//--->
</body>
</html>