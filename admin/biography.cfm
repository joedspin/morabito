<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">
<p><font size="5">bio<font color="#FFFF00">graphy</font></font></p>
	<cfquery name="thisBio" datasource="#DSN#">
		select * from
		bioText
		where ID=1
	</cfquery>
	<cfform name="bioForm" action="biographyAction.cfm" method="post" enctype="application/x-www-form-urlencoded">
		<p>
		  <textarea cols="100" rows="25" name="bioText" id="formtext" ><cfoutput query="thisBio">#HTMLEditFormat(bioText)#</cfoutput></textarea>
</p>
		<p>
		  <input name="save" type="submit"  value="Save Changes" id="formtext">	
		  <input name="cancel" type="submit" value="Cancel" id="formtext">
		      </p>
	</cfform>
    <p>NOTE: use braces to define bold text { }</p>
</body></html>
