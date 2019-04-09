<cfparam name="Session.username" default="">
<cfif Session.username IS "">
	<cflocation url="loginform.cfm">
</cfif>
<cfinclude template="pageHead.cfm">
<script>
function afterMe(n) {
  let imgnum = document.getElementById("imgnum");
  imgnum.value = n;
}
</script>
<cfdirectory
  directory="#serverpath#\images\gallery"
  action="list"
  filter="0*.jpg"
  name="files"
  type="file"
  sort="name DESC">
<cfset lastImage=val(left(files.name,6))>
<p><font size="5">flyer <font color="#FFFF00">gallery</font></font></p>
<p>To insert an image in the middle, click on the image that will be to the right of the insertion.</p>
<cfform name="loadimg" action="imgLoad.cfm" enctype="multipart/form-data">
  <input type="hidden" name="imgtype" value="gallery">insert after image &num;
  <cfoutput>
    <input type="text" id="imgnum" name="imgnum" value="#lastImage#" disabled style="text-align: center;" size="5">
  </cfoutput>
  <input type="file" name="imgfile">
  <input type="submit" value="Upload">
</cfform>
<div style="width: 360px; display: flex; align-items: flex-end; flex-wrap: wrap;">
  <cfset started=false>
  <cfoutput query="files">
    <cfset rn1=RandRange(0,9999)>
    <cfset rn2=RandRange(0,9999)>
    <div style="width: 120px; justify-content: center; text-align: center; padding-bottom: 30px;">
      <img onclick="afterMe(#val(left(name,6))#)" src="../images/gallery/#name#?rn1=#rn1#&rn2=#rn2#" width="100" style="padding: 10px; cursor: pointer;"><br />
      <span style="font-size: 20px;">#val(left(name,6))#</span><br />
      <cfif started>
        <a href="imgMove.cfm?left=#val(left(name,6))+1#&right=#val(left(name,6))#&imgtype=gallery">&lt;</a>&nbsp;&nbsp;
      <cfelse>
        <font color="black">&lt;&nbsp;&nbsp;</font>
      </cfif>
      <a href="imgDelete.cfm?imgnum=#val(left(name,6))#&imgtype=gallery">delete</a>&nbsp;&nbsp;
      <cfif name NEQ '000001.jpg'>
        <a href="imgMove.cfm?left=#val(left(name,6))#&right=#val(left(name,6))-1#&imgtype=gallery">&gt;</a>
      </cfif>
    </div>
    <cfset started=true>
  </cfoutput>
    <div style="width: 120px; justify-content: center; text-align: center;">
      <img onclick="afterMe(0)" src="images/spacer.gif" width="100" height="130" style="border: 1px solid white; cursor: pointer; margin: 10px;"><br />
      <span style="font-size: 20px;">0</span><br>
      &nbsp;
    </div>
</div>
<p>NOTE: Flyers must be JPEGs</p>
<cfinclude template="pageFoot.cfm">