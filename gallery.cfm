<cfdirectory
  directory="#serverpath#\images\#imgtype#"
  action="list"
  filter="0*.jpg"
  name="files"
  type="file"
  sort="name DESC">
<script>
window.addEventListener('DOMContentLoaded', (event) => {
    loadModals();
});
function loadModals() {
  var content = document.getElementById('content');
  <cfoutput query="files">
    <cfset ID=val(left(name,6))>
    var modal#ID# = document.getElementById('modal#ID#');
    var img#ID# = document.getElementById('img#ID#');
    var mimg#ID# = document.getElementById("mimg#ID#");
    img#ID#.onclick = function(){
      content.style.overflow = "hidden";
      modal#ID#.style.display = "block";
      mimg#ID#.src = this.src;
    }
    var close#ID# = document.getElementById("close#ID#");
    close#ID#.onclick = function() { 
      content.style.overflow = "auto";
      modal#ID#.style.display = "none";
    }
  </cfoutput>
}
</script>
<div style="width: 430px; height: 450px; display: flex; flex-wrap: wrap; align-items: flex-start; align-content: flex-start;">
  <cfoutput query="files">
    <cfset ID=val(left(name,6))>
    <cfset rn1=RandRange(0,9999)>
    <cfset rn2=RandRange(0,9999)>
    <div style="width: 135px; height: 135px; overflow: hidden; margin: 0 0 2px 2px; padding: 0 0 0 0;">
      <img id="img#ID#" width="130" class="popimg" src="images/#imgtype#/#name#?rn1=#rn1#&rn2=#rn2#" style="margin: 0 0 5px 5px; padding: 0 0 0 0;">
    </div>
    <div id="modal#ID#" class="modal">
      <span id="close#ID#" class="close">&times;</span>
      <img id="mimg#ID#" class="modal-content">
    </div>
  </cfoutput>
</div>