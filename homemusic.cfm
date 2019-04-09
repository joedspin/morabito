<cfparam name="url.startit" default="false">
<cfquery name="podcasts" datasource="#DSN#" maxrows="1">
	select *
    from podcasts
    order by podcastDate DESC
</cfquery>
<cfoutput query="podcasts">
<img src="images/spacer.gif" height="35" width="400" />
<script language="javascript" type="text/javascript">
var iframeElement   = document.querySelector('iframe');
var iframeElementID = iframeElement.id;
var widget1         = SC.Widget(iframeElement);
var widget2         = SC.Widget(iframeElementID);
</script>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td nowrap width="45" valign="top"><div id="sidecontainer"><div id="sidetitle">#LCase(podcastLabel)#&nbsp;<span class="pagecolor">#DateFormat(podcastDate,"mm")#</span>#DateFormat(podcastDate,"yy")#</div></div></td>
    <td width="432"><iframe width="432" height="166" scrolling="no" frameborder="no" src="#url#?auto_play=#url.startit#"></iframe></td></tr></table>
    </cfoutput>