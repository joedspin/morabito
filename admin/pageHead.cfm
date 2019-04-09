<cfparam name="isHome" default="false">
<cfparam name="isLogin" default="false">
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>
<style type="text/css">
<!--
a:link {
	color:#FFFF00;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color:#FFFF00;
}
a:hover {
	text-decoration: none;
	color:#FF9900
}
a:active {
	text-decoration: none;
	color:#FF9900
}
input {font-family:'Open Sans Condensed', sans-serif; font-size:14px;}
.formsize {font-size:14px;}
.formbold {font-weight:bold;}
.formred {color:red;}
body {background-color:#000000; font-family:'Open Sans Condensed', sans-serif; color:white; margin-left:250px; margin-top:75px;
scrollbar-face-color: #000000;
scrollbar-shadow-color: #2D2C4D;
scrollbar-highlight-color:#7D7E94;
scrollbar-3dlight-color: #7D7E94;
scrollbar-darkshadow-color: #2D2C4D;
scrollbar-track-color: #7D7E94;
scrollbar-arrow-color: #C1C1D1;
}
#formtext {font-family:'Open Sans Condensed', sans-serif; font-size:14px;}
.oTabHead {text-transform:lowercase;}
-->
</style>
<title>MORABITO > admin</title>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="scripts/cfform.js"></SCRIPT>
</head>

<body>
<p style="margin-top:20px; margin-bottom:20px;"><font size="7" color="#FFFFFF"><strong>MORABITO</strong> site <font color="#FFFF00">administration</font></font></p>
<cfif NOT isHome AND NOT isLogin><p style="line-height: 0; margin-top: 0; margin-bottom: 6"><a href="index.cfm">admin home</a></p></cfif>
