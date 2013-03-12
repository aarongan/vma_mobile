<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<html>
<head>
<title>Create your email address</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<style type="text/css">
.emailTextSpanCSS {
	text-align:left;
	padding-top:5px;
}
.messageBoxClassNoBorder{
vertical-align: bottom; width: 159px; 
border: none; padding: 2px; 

}
.messageBoxClassBorder{
vertical-align: bottom; width: 159px; 
border-right: 1px solid rgb(178,178,178); padding: 2px; 
border-top: 1px solid rgb(178,178,178); border-left: 1px solid rgb(178,178,178);
background:none repeat scroll 0 0 #F3F3F3;
}
.messageBoxClassBorderError{
vertical-align: bottom; width: 159px; 
border-right: 0px solid rgb(178,178,178); padding: 2px; 
border-top: 0px solid rgb(178,178,178); border-left: 0px solid rgb(178,178,178);
background:none repeat scroll 0 0 rgb(255,229,229);
}
</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" >

<s:form action="checkIfEmailIdAvailable.action" theme="simple">
	<div id="container" style="width:610px">
		
		<div id="processingMessageDiv" class="processingMessageDiv">
			<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
			&nbsp;&nbsp;<i>Processing ...</i>
		</div>
		
		<div id="parentDiv" class="bodyDiv" style="text-align: left; width: 590px; height: 130px; padding-top: 15px;"> 

			<div id="mainDiv" style="width: 590px;margin-left:15px;height:245px;">
				<div id="topDiv" class="icsinline" >
					<div >
						<span id="introText" >
							<p align="justify">
							Creating Sync & Connect email is the first step. This email address will be used to consolidate all your messaging in one place . You can use it if you like - but don't worry - you'll be able to use Sync & Connect to send and receive email with other accounts just like normal.
							</p>
						</span><br/>
					</div>
				</div> 
				<div id="bottomDiv" class="icsinline">
				<div id="leftDiv" style="float:left;line-height:10px;border-right: 1px dotted;">
					<div style="line-height:10px;">					
						<span id="emailText" class="emailTextSpanCSS">
							<strong>Email Address</strong> <br/>
						</span><br/>
					</div>
					<div id="emailBox" style="">
						
						<div id="emailTextBox" class="icsinline">
							<div id="messageBox" class="messageBoxClassNoBorder">
								<input type="text" id="email" name="request.email" maxlength="199"  style="height: 22px; background: none repeat scroll 0% 0% rgb(242, 242, 242); border: 1px solid rgb(178,178,178); margin-left: -2px;" size="22"
									value="<s:property value="request.email"/>" onkeyup="javascript:changeNextButtonStyle();"  
							 	onblur=""/>
									<div id="msgDiv" style="">
						<span id="emailRequiredErrorBlock" style="display:none;float:left;background-color:#FFE5E5;height:10px;width:300px;
								margin-left:10px;margin-right:20px;padding-left:5px;padding-bottom:5px;">
										<span style="float:left;padding-top:4px;"><img src="<%=staticContentURL%>styles/images/ics/provision/cross.gif"/></span> 
									<span style="float:left;padding-left:5px;">Please enter an email to continue.</span>
						</span>
						
						<!--
						<span id="actionErrorDiv" style="padding-top:10px;padding-left:10px;text-align: left">
						<s:actionerror cssStyle="float:left;background-color:ffe5e5;height:10px;width:300px;
									margin-top:10px;padding-top:5px;padding-bottom:5px;"/>
						</span>			
						-->
						
	
						<div id="emailAvailableMsg" style="display: block; position: absolute; z-index: 2; background: none repeat scroll 0% 0% rgb(241, 241, 241);  width: 163px;margin-left:-3px; height: 40px;border-right: 1px solid rgb(178,178,178); border-bottom: 1px solid rgb(178,178,178); border-left: 1px solid rgb(178,178,178);" >
								<div style="width: 20px;vertical-align:top;margin-top:2px;" class="icsinline"><img src="<%=staticContentURL%>styles/images/ics/provision/right.gif"/></div> 
								<div style="width: 140px; font-size: 11px;#line-height:12px;vertical-align:top;margin-top:2px;" class="icsinline">That address is available.</div>
						</div>	
						
					<div id="sorryThatAddressTakenDiv" style="display: block; position: absolute; z-index: 2; background: none repeat scroll 0% 0% rgb(255, 229, 229); width: 163px; height: 40px; margin-left: -3px; border-right: 0px solid rgb(178,178,178); border-bottom: 0px solid rgb(178,178,178); border-left: 0px solid rgb(178,178,178);" >
						<div style="width: 12px; vertical-align: top; margin-top: 3px; margin-left: 1px;" class="icsinline" style="vertical-align: top;padding-top:2px;"><img src="<%=staticContentURL%>styles/images/ics/provision/cross.gif"/></div> 
						<div style="width: 140px; font-size: 11px;" class="icsinline">Sorry, that address is <br>not available.</div>
					</div>			
					
			
						
							<div id="invalidEmailAddressErrorDiv" style="float:left;background-color:#FFE5E5;height:10px;width:170px;
								margin-left:10px;margin-right:20px;padding-left:5px;padding-bottom:5px;" >
								<div class="icsinline"><img src="<%=staticContentURL%>styles/images/ics/provision/cross.gif"/></div> 
								<div class="icsinline">Invalid email address entered.</div>
							</div>
									
					</div>	
					
								
					<div id="emailRules" style="display:none;position: absolute; z-index: 2; background: none repeat scroll 0% 0% rgb(243, 243, 243); height: 80px; border-right: 1px solid rgb(178,178,178); border-bottom: 1px solid rgb(178,178,178); border-left: 1px solid rgb(178,178,178); width: 163px;margin-left:-3px;">			
					Use 4-15 characters. <br>No spaces.<br> You can use underscores, numbers, letters, special characters.<br/>
				 	</div>
							</div>
										
						</div>
						<span class="icsinline" style="padding-right:10px;#padding-right:0px;#margin-top:-2px;#margin-right:10px;" >
							<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@EMAIL_ALIAS"/>
							<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@ICS_EMAIL_DOMAIN)"/>
						</span>
									
					<!-- 	<span style="*margin-bottom:10px;" class="icsinline" style="padding-left:5px;">
						<button id="checkButton" class="input_interface_sm" onclick="javascript:checkEmailAccount();return false;">
							<span><span><span><strong>Check</strong></span></span></span>
						</button>
						</span> -->			
						</div>
		
				 	<div style=padding-top:5px;z-index:0">			
						<span style="">
							<div style="text-align:left;white-space:nowrap;"><strong>Password</strong></div><br/>
							<div style="padding-top:5px;">Same as your My Verizon password.</div><br/>
						</span><br/>
					</div>
				</div>
				<div id="recommendedEmailsParent" class="icsinline" 
									style="float:right;vertical-align:top; padding-left:15px;#padding-left:0px; width:265px;#width:255px;#margin-right:5px;#margin-right:30px;">			
					<span style="">Here are some suggestions based on the address you requested:
					</span>
					<div id="recommendedEmailsChild" style="0066cc;padding-top:5px;">
								
						<s:iterator id="suggestedEmailList" value="response.suggestedEmailList" status="suggestedEmail">
							<div id="suggestedEmail<s:property value="#suggestedEmail.count" />" style="cursor:hand;height:20px;" >							
							<!--<div id="suggestedEmail" style="cursor:hand;height:20px;"><s:property value="#suggestedEmail.count" />-->
								<a href="#" class="a" onclick="javascript:acceptEmail('<s:property />');return false;"><s:property /> </a>
				
							</div>
							
					 	</s:iterator>
					</div>

				</div>
				</div>
			</div>
			<div id="nextButtonDiv" style="float:right;height:20px;margin-right:-35px;#margin-right:-15px;/*width:500px;margin-left:500px;*/">
						<div class="icsinline" style="padding-left:10px;">
			<a href="javascript:goBack();" class="button" id="backButton">
			<span class="interface"><span><span>&nbsp;&nbsp;Back</span></span></span>
		
			</a>
				</div>
				<div class="icsinline"   style="padding-left:10px;">
			<a href="javascript:submitNext();" class="button" id="nextButton">
				<span class="red"><span><span>Next</span></span></span>
			</a>
				</div>&nbsp;&nbsp;
	
		</div>	
		
	</div>
	</div>
</s:form>

</div>

<script type="text/javascript">

function changeTitle() {
	if(parent.Lib) {
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Create Your Email Address');
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Create Your Email Address',true);
		}
	
}
 
function checkEmailAccount() { 
	if(document.getElementById("checkButton") && document.getElementById("checkButton").className == "input_interface_sm") {
		var email = document.getElementById("email").value;
		
		if(email != '' && email != ' ') {
	
			ajaxCall();
		}

	}
}

function acceptEmail(email) {
	
	document.getElementById("emailAvailableMsg").style.display ="none";
	document.getElementById("sorryThatAddressTakenDiv").style.display="none";
   	document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
	document.getElementById("messageBox").className="messageBoxClassNoBorder";
	var position = email.indexOf('@');
	
	email = email.substring(0, position);
	document.getElementById("email").value = email;
//	document.getElementById("checkButton").className = "input_interface_sm";
	document.getElementById("nextButton").className = "button";
	return ;
}

function submitNext() {
	if(document.getElementById("nextButton").className == "button") {
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
			if(document.getElementById("invalidEmailAddressErrorDiv") != null) {
				document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
			}
			if(document.getElementById("sorryThatAddressTakenDiv") != null) {
				document.getElementById("sorryThatAddressTakenDiv").style.display="none";
			}	
			
			document.getElementById("email").style.border="1px solid red";
			document.getElementById("emailText").style.color="red";
			document.getElementById("emailRequiredErrorBlock").style.display="block";
			return ;
		}
	}else return;
}


function changeNextButtonStyle() {//alert("in nextbuttonstyle");

	var email = "";
	if(document.getElementById("email")) {
			email = document.getElementById("email").value;
	}
	
	email = trim(email);
	
	if(email.length >= 4) {
		document.getElementById("emailRules").style.display ="none";
		if(document.getElementById("checkButton")) {		 
			document.getElementById("checkButton").setAttribute("class", "input_interface_sm");
			document.getElementById("checkButton").className="input_interface_sm";
		} 	
		ajaxCall();
	}
	else if(email.length == 2 || email.length == 3) {
		document.getElementById("messageBox").className ="messageBoxClassBorder";
		document.getElementById("emailRules").style.display ="block";
	   	document.getElementById("emailAvailableMsg").style.display ="none";
   		document.getElementById("sorryThatAddressTakenDiv").style.display="none";
   		document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
				  			  		
	} else {
		disableButtons();
		document.getElementById("emailRules").style.display ="none";
	   	document.getElementById("emailAvailableMsg").style.display ="none";
   		document.getElementById("sorryThatAddressTakenDiv").style.display="none";
   		document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
   		document.getElementById("messageBox").className ="messageBoxClassNoBorder";
	}		
}
function ajaxCall(){
	var email = "";
	if(document.getElementById("email")) {
			email = document.getElementById("email").value;
	}
	
	email = trim(email);
	//check if the email is available
	var urlString = 'request.email='+email;
					
	var url = '/ics/provisioning/checkIfEmailIdAvailable.action?'+urlString ;

	//var url='<s:url action="/provisioning/checkIfEmailIdAvailable.action"><s:param name="provisioningRequest.email">"${email}"</s:param></s:url>';
	//	var url= '<s:url value="/provisioning/checkIfEmailIdAvailable.action"><s:param name="provisioningRequest.email">${email}</s:param></s:url>';
	//	var url= '<s:url value="/provisioning/checkIfEmailIdAvailable.action" includeParams="post"/>';
	//	alert(url);
		if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else { // code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=state_Change;
		xmlhttp.open("POST",url,true);
		xmlhttp.send(null);
}

function state_Change()
{
	if(xmlhttp.readyState==4) {

	  try {
	    var xmlDoc=xmlhttp.responseXML.documentElement;
	  
	    var statusCode = xmlDoc.getElementsByTagName("statusCode")[0].firstChild.nodeValue;
	    var statusDesc = xmlDoc.getElementsByTagName("statusDesc")[0].firstChild.nodeValue;
	    var suggestedEmailList = xmlDoc.getElementsByTagName("suggestedEmailList")[0].firstChild.nodeValue;
	  
 		updateSuggestedEmails(suggestedEmailList);	  
 		document.getElementById("messageBox").className ="messageBoxClassBorder";
 		if(statusDesc == "email_available"){ 
		   	document.getElementById("emailAvailableMsg").style.display ="block";
	   		document.getElementById("sorryThatAddressTakenDiv").style.display="none";
	   		document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
	   		
	   		enableButtons();
		}
		else if(statusDesc == "email_not_available"){
	   		document.getElementById("emailAvailableMsg").style.display ="none";
	   		document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
	   		document.getElementById("sorryThatAddressTakenDiv").style.display="block";
	   		document.getElementById("messageBox").className ="messageBoxClassBorderError";
	   		if(document.getElementById("nextButton")) {		
	   			document.getElementById("nextButton").setAttribute("class", "button disabled");
	   			document.getElementById("nextButton").className="button disabled";
	   		}
		}
		else if(statusDesc == "invalid_email_address"){
	   		document.getElementById("emailAvailableMsg").style.display ="none";
	   		document.getElementById("sorryThatAddressTakenDiv").style.display="none";
		   	document.getElementById("invalidEmailAddressErrorDiv").style.display="block";
			if(document.getElementById("nextButton")) {		
				document.getElementById("nextButton").setAttribute("class", "button disabled");
				document.getElementById("nextButton").className="button disabled";
			}
		}

	  } catch (err) {
	  		//Do nothing.
	  		document.getElementById("processingMessageDiv").className="processingMessageDiv";
	  }
	}
}
//update the suggested EmailList
function updateSuggestedEmails(sugEmailList) {
	if(sugEmailList != null || sugEmailList != ''){
		 var emailList = sugEmailList.substring(1,sugEmailList.length-1);
		 var emailArr = emailList.split(",");
		 for(i = 0; i < emailArr.length; i++){
			 document.getElementById("suggestedEmail"+(i+1)).innerHTML='<a href="#" class="a" onclick="javascript:acceptEmail(\''+emailArr[i]+'\');return false;">'+emailArr[i]+'</a>';
		 }
	}
 }
function onPageLoad() {

	var xmlhttp;
	var emailResponse = '<s:property value="response.statusDesc"/>';
	if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
		parent.ics.app.listener.setDialogStyle({
			height: '300',
			width: '640'
		});	
		parent.ics.app.listener.setIframeStyle({
			height: '300',
			width: '640'
		});
	}else{
		document.getElementById('layer_holder').style.width="640px";
		document.getElementById('layer_holder').style.height="300px";
	}
	changeTitle();
	
//	changeNextButtonStyle();
	document.getElementById("emailAvailableMsg").style.display ="none";
	document.getElementById("sorryThatAddressTakenDiv").style.display="none";
   	document.getElementById("invalidEmailAddressErrorDiv").style.display="none";
	document.getElementById("messageBox").className="messageBoxClassNoBorder";
	disableButtons();

	if(emailResponse != null && "email_not_available" == emailResponse){
		document.getElementById("sorryThatAddressTakenDiv").style.display="block";
		document.getElementById("messageBox").className="messageBoxClassBorder";
	}
	
}

function removeRules(){
	document.getElementById("emailRules").style.display ="none";
	document.getElementById("messageBox").className="messageBoxClassNoBorder";
}

function disableButtons(){
	if(document.getElementById("nextButton")) {		
		document.getElementById("nextButton").setAttribute("class", "button disabled");
		document.getElementById("nextButton").className="button disabled";
	}
 
	if(document.getElementById("checkButton")) {		 
		document.getElementById("checkButton").setAttribute("class", "input_interface_sm disabled");
		document.getElementById("checkButton").className="input_interface_sm disabled";
	}
}
function enableButtons(){
	if(document.getElementById("nextButton")) {		 
		document.getElementById("nextButton").setAttribute("class", "button");
		document.getElementById("nextButton").className="button";
	} 
}
function goBack() {

			document.forms[0].action ='<s:url value="/provisioning/showCreateEmailIdConfirmation.action"/>';
			document.forms[0].submit();
			document.getElementById("container").className="processing";

}
</script>


</body>
</html>



