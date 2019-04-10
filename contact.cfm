<cfset thisPage="contact">
<cfparam name="url.booking" default="">
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
<div id="contentHolder">
  <div id="contentFrame">
    <div id="pageTitle" style="float: left; width: 0px;">cont<span class="pagecolor">act</span></div>
    <cfif url.booking EQ "" OR url.booking EQ "sent">
      <div id="content" style="margin-left:4px; min-height: 500px; overflow: hidden; float: right; margin-right: 17px; margin-top: -115px;">
        <table width="300" border="0" cellpadding="0" cellspacing="0" align="right">
           <cfoutput query="thisMenuR">
             <tr>
               <cfif target NEQ "">
                 <cfset targetInsert=' target="#target#"'>
               <cfelse>
                 <cfset targetInsert=''>
               </cfif>
               <td align="right" height="91" style="font-size: 32px;"><cfif linkname EQ "booking [inquiry]" AND url.booking EQ "sent"><font color="red" size="4">successfully sent &nbsp;&nbsp;</font></cfif><a style="color: black;" href="#linkurl#"#targetInsert#>#Replace(Replace(linkname,'[','<span class="pagecolor">'),']','</span>')#</a></td>
             </tr>
           </cfoutput>
		    </table>
      </div>
    <cfelse>
      <script>
        window.addEventListener('DOMContentLoaded', (event) => {
          loadJazz();
        });
        function loadJazz() {
          avacado = document.getElementById('avacado');
          avacado.style.display = 'none';
        }
      </script>
      <div style="width: 500px; height: 450px; overflow: auto; margin-top: 20px;">
        <table width="475" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" nowrap width="45"><div id="sidecontainer" style="padding-top: 60px;"><div id="sidetitle">booking <span class="pagecolor">inquiry</span></div></div></td>
            <td valign="top" align="right" width="430" style="font-size:16px;">
              *required
              <cfform name="booking" action="contactAction.cfm" method="post" style="line-height: 150%;" class="pagecolor">
                country* <cfinput type="text" size="40" name="cntry" id="cntry" required="yes" message="country is required"><br>
                city* <cfinput type="text" size="40" name="ccty" id="ccty" required="yes" message="city is required"><br>
                venue* <cfinput type="text" size="40" name="venue" id="venue" required="yes" message="venue is required"><br>
                venue address* <cfinput type="text" size="40" name="venadd" id="venadd" required="yes" message="venue address is required"><br>
                capacity* <cfinput type="text" size="40" name="capacity" id="capacity" required="yes" message="capacity is required"><br>
                club website <cfinput type="text" size="40" name="clubwww" id="clubwww"><br>
                requested date* <cfinput type="text" size="40" name="rqstdate" id="rqstdate" required="yes" message="requested date is required"><br>
                promoter name / contact* <cfinput type="text" size="40" name="cntct" id="cntct" required="yes" message="promoter name / contact is required"><br>
                email* <cfinput type="text" size="40" name="grungr" id="grungr" required="yes" message="email is required" validate="email"><br>
                phone* <cfinput type="text" size="40" name="phone" id="phone" required="yes" message="phone is required"><br>
                ticket price / cover charge* <cfinput type="text" size="40" name="price" id="price" required="yes" message="ticket price / cover charge is required"><br>
                artists booked playing <cfinput type="text" size="40" name="artistsb" id="artistsb"><br>
                artists booked in the past <cfinput type="text" size="40" name="artistsp" id="artistsp"><br>
                doors open <cfinput type="text" size="40" name="doors" id="doors"><br>
                proposed set time* <cfinput type="text" size="40" name="settime" id="settime" required="yes" message="proposed set time is required"><br>
                offer details / offer <cfinput type="text" size="40" name="offer" id="offer"><br>
                <input type="text" size="40" name="avacado" id="avacado">
                <input type="submit" class="smbutton" name="submit" value="submit inquiry">
              </cfform>
            </td>
          </tr>
        </table>
        </div>
      </cfif>
      </div>
    </div>
  </div>
</div>
</body>
</html>