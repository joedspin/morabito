<cfform name="loadimg" action="imgLoad.cfm" enctype="multipart/form-data">
  <input type="hidden" name="imgtype" value="gallery">
  <input type="text" id="imgnum" name="imgnum" value="1" disabled style="text-align: center;" size="5">
  <input type="file" name="imgfile">
  <input type="submit" value="Upload">
</cfform>
<img id="img4" onclick="afterMe(0)" src="images/spacer.gif" width="100" height="100" style="border: 1px solid black;" data-imgnum="3">
<script>
function afterMe(n) {
  let imgnum = document.getElementById("imgnum");
  imgnum.value = n + 1;
}
</script>