<cfparam name="url.ID" default="0">
<cfquery name="killPodcast" datasource="susanMorabitoRecords">
	delete
	from podcasts
	where ID=#url.ID#
</cfquery>
<cflocation url="podcastAdmin.cfm">