<cfparam name="url.imgtype" default="gallery">
<cfparam name="url.left" default="1">
<cfparam name="url.right" default="0">
<cffile action="rename"
  nameconflict="overwrite"
  source="#serverPath#\images\#url.imgtype#\#NumberFormat(url.left,"000000")#.jpg"
  destination="#serverPath#\images\#url.imgtype#\tempfile.jpg">
<cffile action="rename"
  nameconflict="overwrite"
  source="#serverPath#\images\#url.imgtype#\#NumberFormat(url.right,"000000")#.jpg"
  destination="#serverPath#\images\#url.imgtype#\#NumberFormat(url.left,"000000")#.jpg">
<cffile action="rename"
  nameconflict="overwrite"
  source="#serverPath#\images\#url.imgtype#\tempfile.jpg"
  destination="#serverPath#\images\#url.imgtype#\#NumberFormat(url.right,"000000")#.jpg">
<cfswitch expression="#url.imgtype#">
  <cfcase value="gallery">
    <cflocation url="flyerGallery.cfm">
  </cfcase>
  <cfcase value="discography">
    <cflocation url="discography.cfm">
  </cfcase>    
</cfswitch>
