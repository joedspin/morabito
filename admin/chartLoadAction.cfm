<cfparam name="form.x" default="">
<cfparam name="form.ID" default="">
<cfparam name="form.ftype" default="mp3">
<cfparam name="form.uploadFile" default="">
<cfparam name="form.cancel" default="">
<cfparam name="form.delete" default="">
<cfif form.cancel NEQ "">
	<cflocation url="chart.cfm">
<cfelseif form.delete NEQ "">
	<cffile action="delete" file="#serverPath#\media\pick#NumberFormat(ID,"0000")#-#NumberFormat(form.x,"00")#.#ftype#">
	<cflocation url="chartLoad.cfm?ID=#form.ID#">
<cfelseif form.uploadFile NEQ "">
	<cffile action="upload"
		destination="#serverPath#\media"
		nameConflict="overwrite"
		fileField="uploadFile">
	<cffile action="rename"
		source="#serverPath#\media\#cffile.serverFile#"
		destination="#serverPath#\media\pick#NumberFormat(ID,"0000")#-#NumberFormat(form.x,"00")#.#ftype#">
		<cflocation url="chartLoad.cfm?ID=#form.ID#">
</cfif>