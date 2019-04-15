<cfset pageTitle="Links: Sprite">
<cfparam name="url.r" default="0">
<cfparam name="url.r" default="0">
<cfset rn1=RandRange(0,9999)>
<cfset rn2=RandRange(0,9999)>
<cfinclude template="pageHead.cfm">
	<cfoutput>
    <p>Choose a new file to replace this sprite.<br>
      This action will overwrite the sprite file on the server and can not be undone.</p>
    <p><img src="../images/menuR#url.r##url.rr#.png?rn1=#rn1#&rn2=#rn2#"></p>
    <p>Note: the sprite file must be in .png format and to conform with the <br>
    site layout, each one should be 238 pixels wide and 78 pixels tall <br>
    with each of the three frames of the sprite being 78 pixels wide.</p>
    <cfform name="sprite" method="post" enctype="multipart/form-data" action="linksSpriteAction.cfm">
      <input type="file" name="newfile">
      <input type="submit" name="submit" value="Replace Sprite">
      <input type="hidden" name="r" value="#url.r#">
      <input type="hidden" name="rr" value="#url.rr#">
    </cfform>
    <p><a href="links.cfm">Cancel</a></p>
  </cfoutput>
<cfinclude template="pageFoot.cfm">