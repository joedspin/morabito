<cfparam name="form.cntry" default="">
<cfparam name="form.ccty" default="">
<cfparam name="form.event" default="">
<cfparam name="form.evewww" default="">
<cfparam name="form.venue" default="">
<cfparam name="form.venwww" default="">
<cfparam name="form.capacity" default="">
<cfparam name="form.rqstdate" default="">
<cfparam name="form.cntct" default="">
<cfparam name="form.grungr" default="">
<cfparam name="form.phone" default="">
<cfparam name="form.price" default="">
<cfparam name="form.artistsb" default="">
<cfparam name="form.artistsp" default="">
<cfparam name="form.settime" default="">
<cfparam name="form.offer" default="">
<cfparam name="form.avacado" default="">
<cfparam name="Session.booking" default="">
<cfif form.avacado EQ "" AND Session.booking EQ "">
<cfmail to="morabito@djmorabito.com" from="music@djmorabito.com" subject="Booking Inquiry from djmorabito.com" type="HTML">
  <table>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>city</b></td>
      <td>#form.ccty#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>country</b></td>
      <td>#form.cntry#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>event name</b></td>
      <td>#form.event#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>event website</b></td>
      <td>#form.evewww#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>venue</b></td>
      <td>#form.venue#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>venue website</b></td>
      <td>#form.venwww#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>venue capacity</b></td>
      <td>#form.capacity#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>ticket price / cover charge</b></td>
      <td>#form.price#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>promoter name / contact</b></td>
      <td>#form.cntct#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>email</b></td>
      <td>#form.grungr#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>phone</b></td>
      <td>#form.phone#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>requested date</b></td>
      <td>#form.rqstdate#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>proposed set time</b></td>
      <td>#form.settime#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>artists booked for same event</b></td>
      <td>#form.artistsb#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>artists booked in the past</b></td>
      <td>#form.artistsp#</td>
    </tr>
    <tr>
      <td align="right" style="padding-right: 10px;"><b>offer details</b></td>
      <td>#form.offer#</td>
    </tr>
  </table>
</cfmail>
<cfset Session.booking="done">
  <cflocation url="contact.cfm?booking=sent&rr=2">
</cfif>
<cflocation url="contact.cfm">