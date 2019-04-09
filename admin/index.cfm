<cfset ishome="true">
<cfinclude template="pageHead.cfm">


<cfparam name="Session.username" default="">
<cfparam name="form.username" default="">
<cfparam name="form.password" default="">
<cfif form.username IS NOT "" OR form.password IS NOT "">
	<cfquery name="checkUser" datasource="susanmorabitoRecords">
		select *
		from adminUsers
		where username='#form.username#' AND password='#form.password#'
	</cfquery>
	<cfif checkUser.recordCount IS 0>
		<cfoutput>
		<font size="2" color="red">INVALID USERNAME or PASSWORD<br>
		<a href="loginform.cfm">Click here</a> to try again</font>
		</cfoutput><cfabort>
	<cfelse>
		<cfloop query="checkUser">
			<cfset Session.username=#checkUser.username#>
		</cfloop>
	</cfif>
</cfif>
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
<cfelse>
<table border="0" cellpadding="0" cellspacing="0" width="650">
<tr><td width="300" valign="top">
  <p><font size="5">administrative <font color="#FFFF00">tasks</font></font></p>
  <p>
    <a href="links.cfm">links</a><br>
    <a href="chart.cfm">picks</a><br>
    <a href="podcastAdmin.cfm">podcasts</a><br>
    <a href="perfAdmin.cfm">playdates</a><br>
    <a href="biography.cfm">biography</a><br>
    <a href="infoEvents.cfm">places</a><br>
    <a href="discography.cfm">discography</a><br>
    <a href="flyerGallery.cfm">flyer gallery</a><br>
    <a href="privateAccessPassword.cfm">private access password</a></p>
  </td>
  <td width="350" valign="top">
  <cfquery name="hitLog" datasource="susanmorabitoRecords">
    select *
    from hit_counter
    where pagename NOT LIKE '%OLD' AND sinceDate><cfqueryparam value="2013-01-01" cfsqltype="cf_sql_date">
      order by pagename
  </cfquery>
<p><font size="5">site <font color="#FFFF00">statistics</font></font></p>
<table border="0" cellpadding="0" cellspacing="0">
	<td><b>page</b></td>
    <td><img src="images/spacer.gif" width="10" height="10" /></td>
	<td align="center"><b>hits</b></td>
    <td><img src="images/spacer.gif" width="10" height="10" /></td>
	<td><b>since</b></td>
</tr>
<cfoutput query="hitLog">
<tr>
	<td>#Trim(pagename)#</td>
    <td><img src="images/spacer.gif" width="10" height="10" /></td>
	<td align="right">#NumberFormat(hit_count,",")#</td>
    <td><img src="images/spacer.gif" width="10" height="10" /></td>
	<td>#DateFormat(sinceDate,"mmmm d, yyyy")#</td>
</tr>
</cfoutput>
</table></td></tr></table>


</body>

</html>
</cfif>