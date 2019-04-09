<cfset isLogin=true>
<cfinclude template="pageHead.cfm">
<cfset refPage="#CGI.script_name#">
<cfif CGI.query_string IS NOT "">
<cfset refPage=refPage & "?#CGI.query_string#">
</cfif>
<cfoutput>
<form action="index.cfm" method="Post">
<p>&nbsp;</p>
  <table>
	<tr>	
	  <td class="textbold">username</td>
      <td rowspan="3">&nbsp;</td>
	  <td><input type="text" name="username" maxlength="10"></td>
	</tr>		
	<tr>   			
	  <td class="textbold">password</td>
	  <td><input type="password" name="password" maxlength="10"></td>
	</tr>
	<tr>
		<td class="textbold">&nbsp;</td>
	  <td><input type="submit" value="Log In" name="login"></td>
	</tr>
  </table>
    </form>
    </cfoutput>
</body>
</html>