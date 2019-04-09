<cfset thisPage="home">
<cfset menuL=1>
<cfset menuR=1>
<cfset menuRR=0>
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
<div id="logo"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" /></div>
<cfinclude template="menuBuilder.cfm">
<div id="homeImage"><img src="images/mw11_home.jpg" width="610" height="579" title="MORABITO" alt="MORABITO" /></div>
</div>
<!---<div id="superimpose"><img src="images/MorabitoWeb11homeREV.jpg" width="960" height="768" /></div>//--->
</body>
</html>
