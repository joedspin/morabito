<cfparam name="form.imgtype" default="gallery">
<cfparam name="form.imgfile" default="">
<cfparam name="form.imgnum" default="0">
<cffile
  action="upload"
  destination="#serverpath#\images\#form.imgtype#"
  fileField="form.imgfile"
  nameConflict="MakeUnique"
  result="loaded">
<cffile action="rename"
    nameconflict="overwrite"
		source="#serverPath#\images\#form.imgtype#\#loaded.serverFile#"
		destination="#serverPath#\images\#form.imgtype#\newfile.jpg">
<cfdirectory
  directory="#serverpath#\images\#form.imgtype#"
  action="list"
  filter="0*.jpg"
  name="files"
  type="file">
<cfif files.recordCount EQ 0>
  <cffile action="rename"
    nameconflict="overwrite"
		source="#serverPath#\images\#form.imgtype#\newfile.jpg"
		destination="#serverPath#\images\#form.imgtype#\000001.jpg">
<cfelse>
  <cfquery name="changeFiles" dbtype="query">
    SELECT *
    FROM files
    WHERE name > '#NumberFormat(form.imgnum,"000000")#.jpg'
    ORDER BY name DESC
  </cfquery>
  <cfloop query="changeFiles">
    <cffile action="rename"
      nameconflict="overwrite"
      source="#serverPath#\images\#form.imgtype#\#name#"
      destination="#serverPath#\images\#form.imgtype#\#NumberFormat((Left(name,6)+1),"000000")#.jpg">
  </cfloop>
  <cffile action="rename"
    nameconflict="overwrite"
		source="#serverPath#\images\#form.imgtype#\newfile.jpg"
		destination="#serverPath#\images\#form.imgtype#\#NumberFormat(form.imgnum+1,"000000")#.jpg">
</cfif>
<cflocation url="imgGallery.cfm?imgtype=#form.imgtype#">