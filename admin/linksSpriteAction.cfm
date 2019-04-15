<cfparam name="form.r" default="gallery">
<cfparam name="form.rr" default="">
<cfparam name="form.newfile" default="0">
<cffile
  action="upload"
  destination="#serverpath#\images\"
  fileField="form.newfile"
  nameConflict="MakeUnique"
  result="loaded">
<cffile action="rename"
    nameconflict="overwrite"
		source="#serverPath#\images\#loaded.serverFile#"
		destination="#serverPath#\images\menuR#form.r##form.rr#.png">
<cflocation url="links.cfm">