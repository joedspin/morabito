<cfparam name="form.ID" default="">
<cfparam name="form.uploadFile" default="">
<cfparam name="form.delete" default="">
<cfif form.delete NEQ "">
	<cffile action="delete" file="#serverPath#\images\flyers\flyer#NumberFormat(form.ID,"00000")#.jpg">
    <cfquery name="flyerloaded" datasource="#DSN#">
    	update playdates
        set eventGraphic=''
        where ID=#form.ID#
    </cfquery>
	<cflocation url="perfAdmin.cfm">
<cfelseif form.uploadFile NEQ "">
	<cffile action="upload"
		destination="#serverPath#\images\flyers"
		nameConflict="overwrite"
		fileField="uploadFile">
	<cffile action="rename"
    	nameconflict="overwrite"
		source="#serverPath#\images\flyers\#cffile.serverFile#"
		destination="#serverPath#\images\flyers\flyer#NumberFormat(form.ID,"00000")#.jpg">
    <cfquery name="flyerloaded" datasource="#DSN#">
    	update playdates
        set eventGraphic='flyer#NumberFormat(ID,"00000")#.jpg'
        where ID=#form.ID#
    </cfquery>
	<cflocation url="perfAdmin.cfm">
</cfif>