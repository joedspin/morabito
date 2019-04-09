<cfparam name="menuR" default="1"><div id="iconL1"><a id="menuL1" href="<cfif menuL EQ 1>#<cfelse>index.cfm</cfif>" title="Home"><img alt="Home" src="images/spacer.gif" width="78" height="78" border="0" /></a></div>
<div id="iconL2"><a id="menuL2" href="<cfif menuL EQ 2>#<cfelse>music.cfm</cfif>" title="Music"><img alt="Music" src="images/spacer.gif" width="78" height="78" border="0" /></a></div>
<div id="iconL3"><a id="menuL3" href="<cfif menuL EQ 3>#<cfelse>calendar.cfm</cfif>" title="Calendar"><img alt="Calendar" src="images/spacer.gif" width="78" height="78" border="0" /></a></div>
<div id="iconL4"><a id="menuL4" href="<cfif menuL EQ 4>#<cfelse>info.cfm</cfif>" title="Info"><img alt="Info" src="images/spacer.gif" width="78" height="78" border="0" /></a></div>
<div id="iconL5"><a id="menuL5" href="<cfif menuL EQ 5>#<cfelse>contact.cfm</cfif>" title="Contact"><img alt="Contact" src="images/spacer.gif" width="78" height="78" border="0" /></a></div>
<cfquery name="thisMenuR" datasource="#DSN#">
	select *
    from menuR
    where menuRnum=<cfqueryparam value="#menuR#" cfsqltype="cf_sql_char">
    order by menuRRnum
</cfquery>
<cfoutput query="thisMenuR"><div id="iconR#menuRRnum#"><a id="menuR#menuRRnum#" href="#linkurl#" title="#linkname#" target="#target#"><img alt="#linkname#" src="images/spacer.gif" width="78" height="78" border="0" title="#linkname#" /></a></div><cfif menuR EQ 4 AND menuRRnum EQ url.rr><cfset thisPage=Replace(linkname," ","","all")></cfif>
</cfoutput>
<cflock scope="Session" timeout="30" type="Exclusive">
	<cfparam name="Session.hitThis#thisPage#" default="false">
	<cfif NOT #Evaluate("Session.hitThis" & thisPage)#>
		<cfquery name="updateHits" datasource="susanmorabitoRecords">
			UPDATE hit_counter SET hit_count = hit_count + 1 where pagename='#thisPage#'
		</cfquery>
	</cfif>
	<cfset "Session.hitThis#thisPage#"=true>
</cflock>
<CFSET referer = cgi.http_referer>
<CFIF NOT LEN(referer)>
	<CFSET referer = "unknown">
</CFIF>
<cfoutput><!-- REFERER: [[#referer#]] --></cfoutput>
<cfquery name="GetHits" datasource="susanmorabitoRecords">
	SELECT hit_count, sinceDate FROM hit_counter WHERE pagename='#thisPage#'
</cfquery>
<CFIF GetHits.recordcount is 0>
	<cfquery name="CreateHit" datasource="susanmorabitoRecords">
		INSERT into hit_counter(pagename, hit_count, sinceDate)
		VALUES (
			<cfqueryparam value="#thisPage#" CFSQLType="CF_SQL_CHAR">,
			<cfqueryparam value="1" cfsqltype="cf_sql_integer">,
			<cfqueryparam value="#varDateODBC#" CFSQLType="CF_SQL_DATE">
			)
	</cfquery>
	<cfset thisHits=1>
	<cfset thisSince=#varDateODBC#>
<cfelse>
	<cfset thisHits=#GetHits.hit_count#>
	<cfset thisSince=#GetHits.sinceDate#>
</cfif>