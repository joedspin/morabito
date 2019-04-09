<cfparam name="menuL" default="1">
<cfparam name="menuR" default="1">
<cfparam name="menuRR" default="1">
<cfif menuL GT 1><cfset logoSelect=-60+(menuL-1)*-78><cfelse><cfset logoSelect=-60></cfif>
<style>
a {color:black;}
	<cfif menuL EQ 3>
a:link {color:black; text-decoration:none;}
	<cfelse>
a:link {<cfswitch expression="#menuL#"><cfcase value="1">color: #FFFF00;</cfcase><cfcase value="2">color: #FFA500;</cfcase><cfcase value="3">color: #FF0000;</cfcase><cfcase value="4">color:#6600B6;</cfcase><cfcase value="5">color: #003CFF;</cfcase></cfswitch> text-decoration:none;}
	</cfif>
a:hover {<cfswitch expression="#menuL#"><cfcase value="1">color: #FFFF00;</cfcase><cfcase value="2">color: #FFA500;</cfcase><cfcase value="3">color: #FF0000;</cfcase><cfcase value="4">color: #6600B6;</cfcase><cfcase value="5">color: #003CFF;</cfcase></cfswitch> text-decoration:underline;}
body {background-color:#000000; font-family:'Open Sans Condensed', sans-serif; overflow:hidden;}
p {margin-top: 0px; font-family:'Open Sans Condensed', sans-serif;}
.overlay {top: -768px;}
.pagecolor {<cfswitch expression="#menuL#"><cfcase value="1">color: #FFFF00;</cfcase><cfcase value="2">color: #FFA500;</cfcase><cfcase value="3">color: #FF0000;</cfcase><cfcase value="4">color: #6600B6;</cfcase><cfcase value="5">color: #003CFF;</cfcase></cfswitch>}
.playdate {font-size:18px; line-height:122%; max-width:250px; width:250px; margin-top:0px;}
.playdatetop {margin-top:-2px;}
.whitetext {color: white;}
#chartentry {font-size: 18px; line-height:60%; margin-top:4px; margin-bottom:8px; margin-left:0px;}
#comingsoon {position:relative; font-size:60px; color:white; width:600px; height:40px; margin-left:auto; margin-right:auto; text-align:center; margin-top: 200px;}
#content {position: relative; width:500px; height: 329px; padding-right: 20px; top: 28px; left: 22px; z-index:99; overflow: auto; -webkit-overflow-scrolling: touch;}
#contentFrame {position: absolute; width: 555px; height: 465px; top: 162px; left: 205px; background-color: white; border: 8px; border-style:solid; border-radius: 16px; <cfswitch expression="#menuL#"><cfcase value="2">border-color: #FFA500;</cfcase><cfcase value="3">border-color: #FF0000;</cfcase><cfcase value="4">border-color: #6600B6;</cfcase><cfcase value="5">border-color: #003CFF;</cfcase></cfswitch> z-index:98;}
#contentHolder {position: relative; z-index:100;}
#contentPadding {position absolute; width: 486px; height: 900px; top: -498px; left: 194px; z-index:0;}
#homeImage {position: absolute; top: 135px; left: 184px;}
#iconL1, #iconL2, #iconL3, #iconL4, #iconL5, #iconR1, #iconR2, #iconR3, #iconR4, #iconR5 {position: absolute; width: 78px; height: 78px;}
#iconL1, #iconL2, #iconL3, #iconL4, #iconL5 {left: 90px;}
#iconR1, #iconR2, #iconR3, #iconR4, #iconR5 {left: 812px;}
#iconL1, #iconR1 {top: 182px;}
#iconL2, #iconR2 {top: 273px;}
#iconL3, #iconR3 {top: 363px;}
#iconL4, #iconR4 {top: 454px;}
#iconL5, #iconR5 {top: 545px;}
#logo {position: absolute; width: 572px; height: 57px; top: 53px; left:205px; margin-right: auto; overflow: hidden; background: url("images/mw11_logo.png") no-repeat 0px 0px; background-position: -64px <cfoutput>#logoSelect#</cfoutput>px;}
#menuL1, #menuL2, #menuL3, #menuL4, #menuL5, #menuR1, #menuR2, #menuR3, #menuR4, #menuR5 {display: block; width: 78px; height: 78px;}
<cfoutput>
<cfloop index="mL" from="1" to="5">##menuL#mL# {background: url("images/menuL#ml#.png") no-repeat; background-position: <cfif mL EQ menuL>-156<cfelse>0</cfif>px 0px;}
</cfloop>
<cfloop index="mR" from="1" to="5">##menuR#mR# {background: url("images/menuR#menuR##mr#.png") no-repeat; background-position: <cfif mR EQ menuRR>-156<cfelse>0</cfif>px 0px;}
</cfloop>
</cfoutput>
#menuL1:hover, #menuL2:hover, #menuL3:hover, #menuL4:hover, #menuL5:hover, #menuR1:hover, #menuR2:hover, #menuR3:hover, #menuR4:hover, #menuR5:hover {background-position: -78px 0px;}
#menuL1:active {background-position: 156 0px;}
#morabitopad {color: white;}
#pageTitle {position:relative; margin-top:7px; margin-bottom:13px; margin-left:22px; font-size:51px; letter-spacing:-1px;}
#paypalstyle {position: absolute; width: 555px; height: 425px; top: 182px; left: 194px; text-align: center;}
#playbutton, .sm2_link, .sm2_loading, .sm2_playing, .sm2_paused {display:block; width:19px; height: 18px; background:url("images/mw11_play.png") no-repeat; background-position: 0px 0px; margin-right:6px;}
a #playbutton {background-position: 0px 0px;}
a:hover #playbutton, a:hover .sm2_link, a:active .sm2_playing {background-position: -19px 0px;}
a:active #playbutton {background-position: -19px 0px;}
a:visited #playbutton {background-position: 0px 0px;}
#playbutton:hover {background-position:-19px;}
#playbutton:active {background-position:-19px;}
#playdateCity {position:relative; padding:0px; margin:0px; top:0px; left:-28px; margin-right:-53px; color:black; width:auto; display:inline-block; height:45px; font-size: 33px; line-height:70%; background-color:white; text-align:right; overflow:hidden; transform:rotate(270deg);  -ms-transform:rotate(270deg); /* IE 9 */  -webkit-transform:rotate(270deg); /* Safari and Chrome */}
#sidecontainer {position:relative; top:0px; left: 0px; width:45px; height:300px; display:block; overflow:hidden; margin-bottom:-300px;}
#sidetitle {color:black; display: block; -webkit-transform: rotate(270deg); -webkit-transform-origin: top right; -moz-transform: rotate(270deg); -moz-transform-origin: top right; -o-transform: rotate(270deg); -o-transform-origin: top right; -ms-transform: rotate(270deg); -ms-transform-origin: top right; transform: rotate(270deg); transform-origin: top right; position:relative; left: -300px; /*.year width*/ top:4px; width:300px; height:45px; text-align:right; font-size:33px; line-height:70%;}
#site {position: relative; width: 980px; margin-left: auto; margin-right: auto; z-index:1;}
#spacer {color: white; line-height: 1px; font-size:4px;}
#superimpose {opacity:0.5; position: relative; width: 960px; margin-left: auto; margin-right: auto; z-index:2;}
.popimg {cursor: pointer; transition: 0.3s;}
.popimg:hover {opacity: 0.7;}
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 200; /* Sit on top */
  padding-top: 5vh; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%;  /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}
.modal-content {margin: auto; display: block; max-width: 80vw; max-height: 90vh; z-index: 200;}
.modal-content {animation-name: zoom; animation-duration: 0.6s;}
@keyframes zoom {from {transform:scale(0)} to {transform:scale(1)}}
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}
.close:hover, .close:focus {color: #bbb; text-decoration: none; cursor: pointer;}
/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){.modal-content {width: 100%;}}
</style>

