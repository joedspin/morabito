<cfset pageTitle="Presenter: Delete">
<cfinclude template="pageHead.cfm">
<cfoutput>formID: #form.deleteID#</cfoutput>
	<p>Are you sure you want to permanently delete the following presenter?</p>
<cfquery name="thisPresenter" datasource="#DSN#">
	select *
	from presenters
	where ID=#form.deleteID#
</cfquery>
<cfquery name="otherPresenters" datasource="#DSN#">
	select *
	from presenters
	where ID <> #form.deleteID#
	order by name
</cfquery>
<cfoutput query="thisPresenter">
<table border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td colspan="5" class="chartHead">
			DELETE: <b>#name#</b> AND
		</td>
	</tr>
		<tr>
			<td colspan="5" align="center">
				<cfform name="deletePresenter" action="presentersDeleteAction.cfm" method="post">
					Change deleted presenters to:<br>
					<cfselect name="changePresenters" display="name" value="ID" query="otherPresenters"></cfselect>
					<input name="ID" type="hidden" value="#ID#">
					<p><font size="2" color="red">NOTE: You must select a presenter to change existing performances to<br>
					in the database from the list above.</font></p>
					<input name="delete" type="submit" id="delete" value="Yes">	
					<input name="cancel" type="submit" id="cancel" value="No">
				</cfform>
			</td>
		</tr>
</table>
	</cfoutput>


<cfinclude template="pageFoot.cfm">