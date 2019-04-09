
<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfparam name="url.imgtype" default="gallery">
<cfparam name="url.confirm" default="">
<cfparam name="url.imgnum" default="0">
<cfswitch expression="#url.imgtype#">
  <cfcase value="gallery">
    <cfset returnurl="flyerGallery.cfm">
    <cfset pagelabel='flyer <font color="#FFFF00">gallery</font>'
  </cfcase>
  <cfcase value="discography">
    <cfset returnurl="discography.cfm">
    <cfset pagelabel='disc<font color="#FFFF00">ography</font>'
  </cfcase>    
</cfswitch>
<cfif url.confirm EQ "">
<cfinclude template="pageHead.cfm">
  <p><font size="5">#pagelabel#</font></p>
  <p><b>are you sure you want to delete this image (CANNOT BE UNDONE!)?</b></p>
  <p>
    <a href="imgDelete.cfm?imgnum=#url.imgnum#&imgtype=#url.imgtype#&confirm=yes">YES</a> |
    <a href="#returnurl#">NO</a>
  </p>
  <img width="300" src="../images/#url.imgtype#/#NumberFormat(url.imgnum,"000000")#.jpg">
<cfelseif url.confirm EQ "yes">
  <cffile
    action="delete"
    file="#serverPath#\images\#form.imgtype#\#NumberFormat((Left(name,6)+1),"000000")#.jpg">
  <cflocation url="#returnurl#">
</cfif>
<cfinclude template="pageFoot.cfm">