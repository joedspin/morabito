<cfset thisPage="contact">
<cfset menuL=5>
<cfset menuR=5>
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
<div id="logo"><a href="index.cfm"><img src="images/spacer.gif" width="572" height="56" title="MORABITO" alt="HOME" border="0" /></a></div>
<cfinclude template="menuBuilder.cfm">
<div id="contentHolder"><div id="contentFrame">
      <div id="pageTitle" style="float: left; width: 0px;">cont<span class="pagecolor">act</span></div>
      <div id="content" style="margin-left:4px; min-height: 500px; overflow: hidden; float: right; margin-right: 17px; margin-top: -115px;">
       <table width="300" border="0" cellpadding="0" cellspacing="0" align="right">
         <cfoutput query="thisMenuR">
           <tr>
             <cfif target NEQ "">
               <cfset targetInsert=' target="#target#"'>
             <cfelse>
               <cfset targetInsert=''>
             </cfif>
             <td align="right" height="91" style="font-size: 32px;"><a style="color: black;" href="#linkurl#"#targetInsert#>#Replace(Replace(linkname,'[','<span class="pagecolor">'),']','</span>')#</a></td>
           </tr>
         </cfoutput>
		</table>
      </div></div></div>

</div>
  <form name="booking" action="contactBooking.cfm" method="post">
  
  </form>
  
</body>
</html>