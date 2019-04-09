<cfset menuL=2>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" />
<cfinclude template="styleBuilder.cfm">
<title>MORABITO</title>
<style type="text/css">
<!--
body {
	background-color: #000000;
}
-->
</style></head>

<body onload="javascript:paypalform.submit();">
<div id="site">
<div id="logo"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" /></div>
<div id="paypalstyle">
<p class="whitetext">You should be automatically redirected to the PayPal site in a moment.<br />
If not, click below to continue.</p>
<form name="paypalform" action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="WA8UCRGQKNH34">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form></div>
</div>

</body>
</html>
