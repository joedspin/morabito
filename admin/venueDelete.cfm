<cfset pageTitle="Venue: Delete">
<cfparam name="form.venueID" default="0">

<cfinclude template="pageHead.cfm">
	<p>Are you sure you want to permanently delete the following venue?</p>
<cfquery name="thisVenue" datasource="#DSN#">
	select *
	from venuesQuery
	where ID=#form.venueID#
</cfquery>
<cfquery name="otherVenues" datasource="#DSN#">
	select *
	from venuesQuery
	where ID <> #form.venueID#
	order by name
</cfquery>
<cfoutput query="thisVenue">
<table border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td colspan="5" class="chartHead">
			DELETE:<br>
			<b>#name#<br>
			#address#<br>
			#phone#<br>
			#email#</b><br>
			AND
		</td>
	</tr>
		<tr>
			<td colspan="5" align="center">
				<cfform name="deleteVenue" action="venueDeleteAction.cfm" method="post">
					Change deleted venues to:<br>
					<cfselect name="changeVenue" display="name" value="ID" query="otherVenues"></cfselect>
					<input name="ID" type="hidden" value="#ID#">
					<p><font size="2" color="red">NOTE: You must select a venue to change existing performances to<br>
					in the database from the list above.</font></p>
					<input name="delete" type="submit" id="delete" value="Yes">	
					<input name="cancel" type="submit" id="cancel" value="No">
				</cfform>
			</td>
		</tr>
</table>
</cfoutput>

<cfinclude template="pageFoot.cfm">