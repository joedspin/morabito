
<cfquery name="addit" datasource="susanmorabitoRecords">
  INSERT INTO menuR (linkname, linkurl, menuRnum, menuRRnum, target)
  values ('mailing [list]', '', 3, 1, '')
</cfquery>
<cfquery name="addit" datasource="susanmorabitoRecords">
  INSERT INTO menuR (linkname, linkurl, menuRnum, menuRRnum, target)
  values ('booking [inquiries]', '', 3, 2, '')
</cfquery>
<cfquery name="addit" datasource="susanmorabitoRecords">
  INSERT INTO menuR (linkname, linkurl, menuRnum, menuRRnum, target)
  values ('other [inquiries]', '', 3, 3, '')
</cfquery>
<cfquery name="addit" datasource="susanmorabitoRecords">
  INSERT INTO menuR (linkname, linkurl, menuRnum, menuRRnum, target)
  values ('text [message]', '', 3, 4, '')
</cfquery>
<cfquery name="addit" datasource="susanmorabitoRecords">
  INSERT INTO menuR (linkname, linkurl, menuRnum, menuRRnum, target)
  values ('voice[mail]', '', 3, 5, '')
</cfquery>

<cfquery name="killextra" datasource="susanmorabitoRecords">
  DELETE * FROM menuR
  WHERE target='delete'
</cfquery>