<cfquery name="allLinks" datasource="#DSN#">
	select *
	from menuR
</cfquery>
<cfloop query="allLinks">
<cfparam name="form.linkname#ID#" default="">
<cfparam name="form.linkurl#ID#" default="">
<cfparam name="form.target#ID#" default="">
<cfquery name="updateLinks" datasource="#DSN#">
	update menuR
    set linkname='#Evaluate('form.linkname'&ID)#',
    	linkurl='#Evaluate('form.linkurl'&ID)#',
        target='#Evaluate('form.target'&ID)#'
    where ID=#ID#
</cfquery>
</cfloop>
<cflocation url="index.cfm">