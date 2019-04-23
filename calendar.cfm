<cfset thisPage="calendar">
<cfset menuL=3>
<cfset menuR=3>
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
<script>
window.addEventListener('DOMContentLoaded', (event) => {
    loadModals();
});
function loadModals() {
  var content = document.getElementById('content');
  <cfoutput query="perfs">
    <cfif Trim(eventGraphic) NEQ "">
      // Get the modal
      var modal#ID# = document.getElementById('modal#ID#');
      // Get the image and insert it inside the modal - use its "alt" text as a caption
      var img#ID# = document.getElementById('img#ID#');
      var mimg#ID# = document.getElementById("mimg#ID#");
      img#ID#.onclick = function(){
        content.style.overflow = "hidden";
        modal#ID#.style.display = "block";
        mimg#ID#.src = this.src;
      }
      // Get the <span> element that closes the modal
      var close#ID# = document.getElementById("close#ID#");
      // When the user clicks on <span> (x), close the modal
      close#ID#.onclick = function() { 
        content.style.overflow = "auto";
        modal#ID#.style.display = "none";
      }
    </cfif>
  </cfoutput>
}
</script>
</head>
<body>
<cfoutput query="perfs">
  <div id="modal#ID#" class="modal">
    <span id="close#ID#" class="close">&times;</span>
    <img id="mimg#ID#" class="modal-content">
  </div>
</cfoutput>
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
    <td width="177" valign="top" >
      <cfif Trim(eventGraphic) NEQ "">
        <img id="img#ID#" class="popimg" src="images/flyers/#eventGraphic#" alt="#eventName#" style="width:177px; max-width:177px">
      <cfelse>
        <img src="images/spacer.gif" width="177" height="267" />
      </cfif>
    </td>
    </tr>
  </table>
	<img src="images/spacer.gif" height="35" width="500" />
  <cfset datestarted=true>
</cfoutput>
</div></div></div>
</body>
</html>