<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="/nda/common/taglibraries.jsp" %>


<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
 
<html>

<head>

<title>SC Terms Of Service Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>

<style type="text/css">
	.textSymbolStyle{
	margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none;
	}
</style>
</head>

<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" style="width:500px;height:370px">

<s:form action="/provisioning/agreeTermsAndConditions.action" method="post">
<div id="container">

	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>

	<div id="bodyDiv" class="bodyDiv" style="float:left;padding-left:25px;padding-bottom:20px;padding-right:25px;margin-top:20px;">
		<div style="float:left;">
		<s:if test="%{request.user.icsFlag == 'P'}">
			<span style="float:left;">$9.99 will be added to your monthly bill.</span> <br/>
		</s:if>
		<span style="float:left;">Please read and agree to these terms of services before using </span> <br/>
		<span style="float:left;padding-bottom: 10px;">Verizon Wireless'&nbsp; Sync & Connect.</span><br/>
	
		<%-- ENGLISH VERSION --%>
		<!-- mp_trans_remove_start -->
		<span style="float:left; padding-top:10px; padding-bottom: 10px;">
<div class="fieldset" style="padding:5px;text-align:left;border:1px solid;height:210px;width:440px;overflow:auto;">

<b><span style='color:blue'>SYNC &amp;
CONNECT TERMS AND CONDITIONS</span></b>

<b><span style='color:blue'>&nbsp;</span></b>
<br/><br/>
<span style='color:#333333'>Your use of Sync
&amp; Connect ("Sync &amp; Connect" or the "Service") is subject to your
Customer Agreement Terms and Conditions, the Verizon Wireless Privacy
Principles, the My Verizon Terms and Conditions, Backup Assistant<sup>SM</sup>
Terms and Conditions and the Verizon Wireless Website Use Terms and Conditions
(each of which can be found at verizonwireless.com), your Calling Plan, and the
following terms of use (the "Agreement"). Please visit 
<br/>
<b><a href="http://products.verizonwireless.com/index.aspx?id=messaging_syncandconnect" target="_blank">
http://products.verizonwireless.com/index.aspx?id=messaging_syncandconnect</a></b>
for information about supported devices and other technical
requirements and limitations for the Service. In the event of any conflict
between this Agreement and your Customer Agreement or Calling Plan, this
Agreement will control solely with respect to the subject matter addressed
herein. By clicking "Accept", you acknowledge that you are entering into a
legally binding agreement with Verizon Wireless. Do not use the Service if you
do not agree to be bound by this Agreement.</span>

<p >&nbsp;</p>
<b><span style='color:blue'>Mail Retention
Policy</span></b><span style='color:blue'><br>
<br>
The following rules apply to the retention of e-mails aggregated from ISP e-mail accounts.</span>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none;'>
<span style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman";'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>All e-mail will be retained indefinitely as long as you do not
exceed the maximum storage quota (currently 2 Gigabytes) for your mailbox. 
</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'>
<span style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>All e-mail in the trash folder will be deleted after 7 days. 
</p>

<br/>

<p>If the Sync &amp; Connect account is
cancelled, but you do not cancel your Verizon Wireless service, then the
following will occur:</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'>
<span style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>All connections to ISPs will be removed.
</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'>
<span style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>All e-mail messages associated with ISPs will be deleted. 
</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'>
<span style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>Contacts will be associated with a Backup Assistant account and
can be accessed via the Backup Assistant web interface.
</p>

<br>
<b><span style='color:blue'>Limitations on Sending Messages</span></b> <br>
<br>
The following limits apply with respect to the sending of messages from your Sync
&amp; Connect inbox. These rules are in place in order to help fight spam
(i.e., unsolicited e-mail). 

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>You may not send an SMS or MMS message to more than 20 recipients
from the Sync &amp; Connect website.</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>SMS/MMS groups created on the Sync &amp; Connect website may not
include more than 50 contacts.</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>You may not include more than 128 recipients in a single e-mail.
Messages will not be sent to any recipients in excess of 128. </p>

<p >The only SMS and MMS messages that will be
shown on the Sync &amp; Connect website are those sent from or received at the
Sync &amp; Connect website.</p>

<p >&nbsp;</p>

<b><span style='color:blue'>The Verizon Wireless
Unsolicited Bulk E-Mail Policy</span></b><span style='color:blue'>:</span><br>
<br>
Verizon Wireless specifically does not authorize the use of its proprietary
computers, servers, routers and computer network (the &quot;Verizon Wireless Network&quot;)
to accept, transmit or distribute unsolicited bulk e-mail sent from the
Internet to Verizon Wireless subscribers (or to others). It is also a violation
of Verizon Wireless policy, and the law, to send email or cause e-mail that
makes use of or contains invalid or forged headers, invalid or non-existent
domain names or other means of deceptive addressing to be sent to, or through,
the Verizon Wireless Network. Verizon Wireless considers such e-mail to be
unlawful and a violation of our policy, and any attempt to send or cause such e-mail
to be sent to, or through, the Verizon Wireless Network is unauthorized.
Moreover, any e-mail relayed from a third party's mail servers without the
permission of that third party, or any e-mail that hides or obscures, or
attempts to hide or obscure, the source of an e-mail, also constitutes an
unauthorized use of the Verizon Wireless Network. E-mail sent or caused to be
sent to the Verizon Wireless Network that violates your agreement with Verizon Wireless
is also unauthorized, nor does Verizon Wireless authorize the harvesting or
collection of screen names from the Sync and Connect service for the purpose of
sending unsolicited e-mail. Any such action also constitutes violation of
Verizon Wireless policy.<br>
<br>
<b><span style='color:blue'>Limitations on Sending E-mail</span></b><br>
<br>


<p >Verizon Wireless reserves the right to
take all legal and technical steps available to prevent unsolicited bulk e-mail
or other unauthorized e-mail from originating from, entering, utilizing or
remaining within the Verizon Wireless Network. Such action may include, without
limitation, the use of filters or other network devices to scan e-mail
transmitted from or to the Verizon Wireless Network, immediate termination of Wireless
service, and prosecution of offenders through criminal or civil proceedings.
Nothing in this policy shall be construed to grant any right to transmit or
send e-mail to, or through, the Verizon Wireless Network, and in no event shall
any failure by Verizon Wireless to enforce this policy constitute a waiver of
Verizon Wireless rights.<br>
<br>
Unauthorized use of the Verizon Wireless Network in connection with the
transmission of unsolicited bulk e-mail, including the transmission of
counterfeit e-mail, may result in civil and criminal penalties against the
sender, including those provided by the Computer Fraud and Abuse Act (18 U.S.C.
&sect; 1030 et seq.); and various state laws, including the Virginia Computer Crimes
Act (Va. Code Ann. &sect; 18.2-152.2 et seq.) (as amended).<br>
<br>
Other Limitations on the Service</p>

<p >&nbsp;</p>

<p>The maximum storage space for each Sync
&amp; Connect Inbox is 2GB. Functionalities such as send/forward/receive
text/picture/video/email messages and contact/email synchronization will not
work when the storage utilization exceeds 2GB.</p>

<p >&nbsp;</p>

<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:0in;text-autospace:none'>Complete two-way synching of email is
only supported for Yahoo!<sup>&reg;</sup> Mail, AOL Mail, Microsoft<sup>&reg;</sup> <span
style='color:#1F497D'>Windows Live</span><sup>&reg;</sup><span style='color:#1F497D'>
Hotmail</span><sup>&reg;</sup> and Google<sup>TM </sup>Gmail<sup>TM</sup>. To
use your wireless phone for synching, you must have a Backup
Assistant-compatible phone and an active Backup Assistant Account. </p>

<p >When configuring the synching of email, emails from the previous
thirty (30) days will be retrieved for Google Gmail, AOL Mail, Yahoo! Mail.
For Microsoft Windows Live Hotmail, the lesser of the previous fifty (50)
emails or emails from the previous thirty (30) days will be retrieved.</p>

<p >&nbsp;</p>

<p >If email accounts are first added on the Sync &amp; Connect
website and a Sync &amp; Connect-compatible wireless device then is configured,
all such email accounts also will be accessible on that device. However, if
another email account then is added on the Sync &amp; Connect website, that account
cannot be accessed on the device.</p>

<p >&nbsp;</p>

<p >If a user initially sets up an email sync point from a Sync
&amp; Connect-compatible wireless device, then the user will only be able to
gain web access to his/her contacts via the Sync &amp; Connect website. Web
access to contacts via the Backup Assistant website will no longer be available
for such users.</p>

<p>
<br>
<b><span style='color:blue'>E-Mail Retention Policy</span></b><br>
<br>


The following rules apply to the retention of e-mails in your Sync &amp; Connect  online inbox. We will: <br>
<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>Retain messages in your mailbox for up to 30  calendar days after the last time you have logged into the Sync &amp; Connect website.</p>
<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>Facilitate elimination of &nbsp;&#147;deleted messages&#148; . Messages deleted or moved to the Trash folder will only be retained for 2 days after which time they will automatically be deleted.</p>
<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>Delete all tags you have created.</p>
<p style='margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt;
margin-left:.5in;text-indent:-.25in;text-autospace:none'><span
style='font-family:Symbol;'><b>&#46;</b><span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span>Messages deleted from your Sync &amp; Connect Online inbox will not be deleted from your connected Sync point. You may continue to access these messages on your email providers mail system.</p>


</p>
<br>
<p>
<b><span style='color:blue'>E-mail Inactivity and Sync Point Deletion Policy</span></b><br>
<br>

Inboxes  that are unused for 120 days or more will be closed and all configured sync points will be deleted.  Seven (7) days prior to sync points being deleted, we will notify you via an e-mail sent to all your connected sync points,  our intent to close the inbox.  If you access your inbox  during this seven day notice period, the inbox  will not be closed. 
</p>
<p>
For the purposes of this policy, an inbox will be considered "unused" if you: 
(i) do not access your inbox  to read your mail,(ii) do not send a message from your inbox (iii) do not log-into www.vzw.com/sync <http://www.vzw.com/sync>, or
(iv) do not have a qualifying device that synchronizes your device inbox  with the Sync &amp; Connect mailbox.<br>
</p>
<p>
Once closed, your inbox can be reopened at any time while you are still a qualified Verizon Wireless customer, however you will be required to setup your Sync points again.
</p>
</div>		
	
		<%--<textarea id="icsBasicTermsConditions" readonly="readonly" class="fieldset"
		style="width:400px;text-align: left;font-size:12px;font-family:arial;" cols="61" rows="13">
<s:property value="response.termsAndConditionsVO.description"/>


	   	 			
		</textarea>	--%>
		</span>
		<br/>
		<div style="float:left;padding-bottom:15px;padding-top:7px;">
			<!--[if gte IE 7]>
				<input type="checkbox" id="agreeTermsOfServices" name="agreeTermsOfServices" onClick="javascript:changeNextButtonStyle()" value="true"/>
			<![endif]--> 
			<!--[if !IE]><!--> 
				<input type="checkbox" id="agreeTermsOfServices" name="agreeTermsOfServices" onChange="javascript:changeNextButtonStyle()" value="true"/>
			<!--<![endif]-->  
			
				I have read and agree to Verizon Wireless' Terms and Conditions.
		</div>		
					
		<!-- mp_trans_remove_end -->
		
		<%-- SPANISH VERSION --%>
		<!-- mp_trans_add
			<textarea id="payAuth" readonly="readonly"  cols="42" rows="13">
			Test text.
			</textarea>
		-->
		<br/><br/>
		</div>
		<div id="buttonId" 
				style="float: right; margin-top:-7px;padding-left:300px;#margin-top:0px;#padding-left:0px;#width:150px;#margin-right:-50px;">
			<span style="float:left;padding-top:5px;">
			<a href="javascript:cancel('<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@MY_VZW_OVERVIEW_PAGE_URL)"/>');" 
				class="a" style="padding-right:15px">
				<span><span><span>Cancel</span></span></span>
			</a>
			</span>
			<span style="float:left;">
				<a href="javascript:submitNext();" style="float:left" class="button" id="nextButton">
					<span class="red"><span><span>Next</span></span></span>
				</a>
			</span>
		</div>
	</div>
</div>	
</s:form>
</div>

<script type="text/javascript">
function onPageLoad() {
	changeTitle();
	document.getElementById("nextButton").className="button disabled";

}

function changeTitle() {
	parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Sync & Connect Terms of Service');		
}
	
function submitNext() {
	if(document.getElementById("agreeTermsOfServices").checked) {
//		document.forms[0].submit();
//		document.getElementById("container").className="processing";
		var icsStatusId = '<s:property value="icsSessionVO.userVO.statusId"/>';
		var activeStatus = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ACTIVE"/>';
/*		if(icsStatusId == activeStatus)
		{
			window.parent.location.href= '<s:url value="/ics/icsOverview.action" includeParams="post"/>';	
		}
	else */	
		{
			document.forms[0].submit();
			document.getElementById("container").className="processing";
		}
		
	}
}

function cancel(url) {
	window.parent.location.href='<s:url value="'+url+' " includeParams="post"/>';
}

	
function changeNextButtonStyle() {
	if(document.getElementById("agreeTermsOfServices").checked == true) {
		document.getElementById("nextButton").className="button";
	}
	else { 
		document.getElementById("nextButton").className="button disabled";
	}

}
	

</script>
</body>
</html>



