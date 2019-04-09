<cfparam name="url.saved" default="no">
<cfset pageTitle="Private Access Password">
<cfinclude template="pageHead.cfm">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="scripts/cfform.js"></SCRIPT>
<cfquery name="privatePassword" datasource="#DSN#">
	select *
	from musicSetPassword
	where ID=1
</cfquery>
<cfif url.saved EQ "yes">
<p><font color="red">The password has been saved</font></p>
</cfif>
<p>&nbsp;</p>
<cfform name="privatePassword" action="PrivateAccessPasswordAction.cfm" method="post">
<cfoutput query="privatePassword">
	<cfinput type="text" name="thePassword" size="20" maxlength="10" required="yes" message="You must type a password" value="#privatePassword.password#">
	<input type="submit" name="save" value=" Save ">
</cfoutput>
</cfform>
<cfinclude template="pageFoot.cfm">