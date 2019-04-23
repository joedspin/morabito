
<cfdirectory
  directory="#serverpath#\images\#imgtype#"
  action="list"
  filter="0*.jpg"
  name="files"
  type="file"
  sort="name DESC">
<cfoutput query="files">
  <cfset ID=val(left(name,6))>
  <div id="modal#ID#" class="modal">
    <span id="close#ID#" class="close">&times;</span>
    <img id="mimg#ID#" class="modal-content">
  </div>
</cfoutput>