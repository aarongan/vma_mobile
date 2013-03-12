<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<html>
<head>
<title>Create your email address</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript">
//	Lib.LayerManager.layerIFrame.chrome.fillTitle('Create your email address');
</script>
</head>
<body class="pl" onload="changeTitle();">
<div id="layer_holder" style="width:700px;height:270px">

<s:form action="checkIfEmailIdAvailable.action">
	<div id="container">
		
		<div id="processingMessageDiv" class="processingMessageDiv">
			<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
			&nbsp;&nbsp;<i>Processing ...</i>
		</div>
		
	<div id="parentDiv" class="bodyDiv"> 
		<div style="float:left;padding-top:15px;padding-left:10px;padding-bottom:5px;width:550px;">
			<span id="introText" style="float:left;padding-left:10px;text-align:left;white-space:nowrap;width:540px;height:45px;">
				You will need to create a Sync & Connect email account if you wish to have a central <br/>
				location to view all your messaging.  Creating this email address will not limit your ability <br/> 
				to use your current email addresses to send and receive emails through Sync & Connect.
			</span><br/>
		</div>
	 
		<div id="leftDiv" style="float:left;width:400px;padding-top:10px;">
		
		<div style="float:left;width:400px;height:150px;padding-right:10px;border-right: 1px solid #CCCCCC;">
					 
			<span id="emailText" style="float:left; padding-left: 20px"><strong>Email Address</strong> </span><br/>
			<span style="float:left; padding-left: 20px">
				<input type="text" id="email" name="request.email" style="width:155px" maxlength="199"  
					value="<s:property value="request.email"/>" />
			</span>	
			
			<!-- div style="float:left;padding-bottom:15px;width:385px;" -->
			<span style="float:left;margin-left:2px;padding-right:10px;white-space: nowrap;">
				<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@EMAIL_ALIAS"/>
				<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@ICS_EMAIL_DOMAIN)"/>			
			</span>
					
			<button id="checkButton" style="float:left;" class="input_interface_sm" onclick="javascript:checkEmailAccount();return false;">
				<span><span><span><strong>Check</strong></span></span></span>
			</button> <br/><br/>
			
			<!-- /div  -->
			
			<div id="emailRequiredErrorBlock" style="display:none;float:left;background-color:ffe5e5;height:5px;width:300px;
						margin-left:20px;margin-right:20px;padding-top:5px;padding-left:5px;padding-bottom:10px;">
						<span style="float:left;padding-top:4px;"><img src="<%=staticContentURL%>styles/images/ics/provision/cross.gif"/></span> 
						<span style="float:left;padding-left:5px;">Please enter an email to continue.</span>
			</div>
			
			<s:div id="createEmailCheckMsg" cssStyle="float:left;margin-left:10px;">
				<s:if test="%{response.statusDesc == 'email_not_available'}">
					<div id="sorryThatAddressTakenDiv" style="float:left;background-color:#FFE5E5;height:10px;width:300px;
						margin-left:10px;margin-right:20px;padding-left:5px;padding-bottom:5px;" >
						<span style="float:left;padding-top:3px;"><img src="<%=staticContentURL%>styles/images/ics/provision/cross.gif"/></span> 
						<span style="float:left;padding-left:5px;">Sorry, that address is not available.</span>
					</div>			
				</s:if>
				<s:if test="%{response.statusDesc == 'email_available'}">	
					<div style="float:left;padding-left:20px;padding-bottom: 20px;margin-right: 20px" >
						<span style="float:leftpadding-top:4px;"><img src="<%=staticContentURL%>styles/images/ics/provision/right.gif"/></span> 
						<span style="float:left;padding-left:5px;padding-top:3px;">That address is available.</span>
					</div>
				</s:if>
			</s:div>
			
			<div style="width:400px;height:50px;margin-top:5px;padding-bottom:20px;padding-top:20px;">
				<span style="float:left; margin-left:20px;white-space:nowrap;text-align: left;">User names can be 4-199 characters. No spaces.</span><br/>
				<span style="float:left; margin-left:20px;white-space: nowrap; text-align: left;">You can use underscores, numbers, letters,</span><br/>
				<span style="float:left; margin-left:20px;white-space: nowrap; text-align: left;">special characters.</span><br/><br/>
				<span style="text-align: left; white-space: nowrap; margin-left: 20px; float: left;"><strong>Password</strong></span><br/>
				<span style="text-align: left; white-space: nowrap; margin-left: 20px; float: left;">Your password is the same as your current My Verizon password.</span><br/>
			</div>	
		 </div>	
		</div>
	
		<div id="recommendedEmailsParent" style="float:left;padding-top:15px;">			
			<span style="float:left; margin-left:20px;">Based on the information we have from</span><br/>
			<span style="float:left; margin-left:20px;padding-bottom: 15px">
				your My Verizon account, we recommend:
			</span><br/>
			<div id="recommendedEmailsChild" style="0066cc">
				<s:iterator id="suggestedEmailList" value="response.suggestedEmailList">
					<br/>
					<span style="float:left;margin-left:20px;color: 0066cc;" style="cursor:hand;" >
						<a href="#" class="a" onclick="javascript:acceptEmail('<s:property />');return false;"><s:property /> </a><br/>
					</span>
				</s:iterator>
			</div>
			<br/><br/><br/>
			<div style="float:left;padding-left:200px;padding-top:10px;margin-top:20px">
				<a href="javascript:submitNext();" class="button" id="nextButton">
					<span class="red"><span><span>Next</span></span></span>
				</a>
			</div>
		</div>

	</div>
	</div>
</s:form>

</div>
</body>
</html>



<script type="text/javascript">
function changeTitle() {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Create Your Email Address');
}
 
function checkEmailAccount() {
	var email = document.getElementById("email").value;
	if(email != '' && email != ' ') {
		document.forms[0].action ='<s:url value="/provisioning/checkIfEmailIdAvailable.action"/>';
		document.forms[0].submit();
		document.getElementById("container").className="processing";
	}
	else {
		if(document.getElementById("emailAvailableMsg") != null) {
			document.getElementById("emailAvailableMsg").style.display="none";
		}	
		if(document.getElementById("sorryThatAddressTakenDiv") != null) {
			document.getElementById("sorryThatAddressTakenDiv").style.display="none";
		}
		
		document.getElementById("email").style.border="1px solid red";
		document.getElementById("emailText").style.color="red";
		document.getElementById("emailRequiredErrorBlock").style.display="block";
		return ;
	}
	
}

function acceptEmail(email) {
	var position = email.indexOf('@');
	
	email = email.substring(0, position);
	document.getElementById("email").value = email;
	return ;
}

function submitNext() {
	var email = document.getElementById("email").value;
	if(email != '' && email != ' ') {
		document.forms[0].action ='<s:url value="/provisioning/createIcsEmailAccount.action"/>';
		document.forms[0].submit();
		document.getElementById("container").className="processing";
	}
	else {
		if(document.getElementById("emailAvailableMsg") != null) {
			document.getElementById("emailAvailableMsg").style.display="none";
		}	
		if(document.getElementById("sorryThatAddressTakenDiv") != null) {
			document.getElementById("sorryThatAddressTakenDiv").style.display="none";
		}
				
		document.getElementById("email").style.border="1px solid red";
		document.getElementById("emailText").style.color="red";
		document.getElementById("emailRequiredErrorBlock").style.display="block";
		return ;
	}
}
</script>
