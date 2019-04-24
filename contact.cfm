<cfset thisPage="contact">
<cfparam name="url.booking" default="">
<cfset menuL=5>
<cfset menuR=5>
<cfparam name="url.rr" default="0">
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
<div id="contentHolder">
  <div id="contentFrame">
    <div id="pageTitle"<cfif url.booking NEQ "form"> style="float: left; width: 0px;"</cfif>>cont<span class="pagecolor">act</span></div>
    <cfif url.booking NEQ "form">
      <div id="content" style="margin-left:4px; min-height: 500px; overflow: hidden; float: right; margin-right: 17px; margin-top: -115px;">
        <table width="300" border="0" cellpadding="0" cellspacing="0" align="right">
           <cfoutput query="thisMenuR">
             <tr>
               <cfif target NEQ "">
                 <cfset targetInsert=' target="#target#"'>
               <cfelse>
                 <cfset targetInsert=''>
               </cfif>
               <td align="right" height="91" style="font-size: 32px;"><cfif linkname EQ "booking [inquiry]" AND url.booking EQ "sent"><font color="red" size="4">successfully sent &nbsp;&nbsp;</font></cfif><a class="contactLink" href="#linkurl#"#targetInsert# style="color: black;">#Replace(Replace(linkname,'[','<span class="pagecolor">'),']','</span>')#</a></td>
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
      

      
      
      <div id="content">
<!--      <div style="width: 500px; height: 450px; overflow: auto; margin-top: 20px;">-->
        <table width="475" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" nowrap width="45"><div id="sidecontainer"><div id="sidetitle">booking <span class="pagecolor">inquiry</span></div></div></td>
            <td valign="top" align="right" width="430" style="font-size:16px;">
              *required
              <cfform name="booking" action="contactAction.cfm" method="post" style="line-height: 150%;" class="pagecolor">
                city* <cfinput type="text" size="19" name="ccty" id="ccty" required="yes" message="city is required"> country* <cfinput type="text" size="20" name="cntry" id="cntry" required="yes" message="country is required"><br>
                event name* <cfinput type="text" size="20" name="event" id="event" required="yes" message="event name is required"> 
                website <cfinput type="text" size="20" name="evewww" id="evewww"><br>
                venue* <cfinput type="text" size="20" name="venue" id="venue" required="yes" message="venue is required"> 
                website <cfinput type="text" size="20" name="venwww" id="venwww"><br>
                venue capacity* <cfinput type="text" size="10" name="capacity" id="capacity" required="yes" message="venue capacity is required"> 
                ticket price / cover charge* <cfinput type="text" size="10" name="price" id="price" required="yes" message="ticket price / cover charge is required"><br>
                promoter name / contact* <cfinput type="text" size="40" name="cntct" id="cntct" required="yes" message="promoter name / contact is required"><br>
                email* <cfinput type="text" size="20" name="grungr" id="grungr" required="yes" message="email is required and must be a valid email address" validate="email"> 
                phone* <cfinput type="text" size="20" name="phone" id="phone" required="yes" message="phone is required"><br>
                requested date* <cfinput type="text" size="11" name="rqstdate" id="rqstdate" required="yes" message="requested date is required">
                proposed set time* <cfinput type="text" size="11" name="settime" id="settime" required="yes" message="proposed set time is required"><br>
                artists booked for same event* <cfinput type="text" size="36" name="artistsb" id="artistsb" required="yes" message="artists booked for same event is required"><br>
                artists booked in the past <cfinput type="text" size="36" name="artistsp" id="artistsp"><br>
                offer details <cfinput type="text" size="50" name="offer" id="offer"><br>
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