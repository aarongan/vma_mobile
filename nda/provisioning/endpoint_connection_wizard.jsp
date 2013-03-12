<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="/nda/common/taglibraries.jsp" %>



<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.common.ICSProviderConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSMasterProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<html>
<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<style type="text/css">
.buttonsBlockCSS {
	display:block; 
}

.errorButtonsBlockCSS {
	/*display:block; 
	float:left;
	margin-top:54px;
	width:400px;*/
}

.IE_Layer_Holder_CSS {
	
}
</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
 <div id="layer_holder">
<s:div id="loginDiv" theme="ajax">
<s:form method="post" theme="simple">
<div id="container" style="text-align: left">
<s:iterator id="masterProviderList" value="response.masterProviderList">
			<s:set id="masterProviderId" name="masterProviderId" value="%{providerId}" />
			<s:set id="providerId" name="providerId" value="%{endPointRequest.endPointVO.endPointId}" />
   <s:if test="%{#masterProviderId == #providerId}" >
		
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;margin-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
	<!-- <div id="leftDiv" class="icsinline" style="float:left;width:400;" class="bodyDiv"> -->
		<div id="main" style="/*width:400;*/height:250px;float:left;margin-left:10px;margin-right:5px;" class="bodyDiv">
			<s:hidden name="endPointRequest.page" value="%{@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_CONNECTION_WIZARD}"/>					
				<div id="headingDiv" style="clear:left;margin-left:5px;/*10px;*/margin-top:5px;white-space:nowrap;text-align:left;">
					<div style="margin-left: 1px;/*12px;*/ height:40px" class="icsinline">						
						<span class="icsinline endpoints <s:property value='providerName'/>"></span>																																																																																																																										
					</div>
					<div style="margin-left: 5px;vertical-align:top;margin-top: 10px"  class="icsinline">
						<strong>Connect with 
						<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
							Yahoo!&#174; <!-- need this yahoo only. -->
						</s:if>
						<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE)">
							Microsoft&#174; Outlook&#174; 
						</s:elseif>
						<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
							Gmail&#153;
						</s:elseif>
						<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)">
							Mozilla Thunderbird&#174;
						</s:elseif>
						<s:else>
							<s:property value="providerDesc"/>
						</s:else>	
										
						</strong>	
					</div><br/>			
				</div>
				<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE) || 
				providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)">
					<div id="descDiv" style="margin-top:10px;margin-left:5px;margin-left:5px;">
						<div style="margin-left: 20px;word-wrap:break-word;/*width:390px*/">
						<p>
						To connect your <s:property value="providerName"/> account, just download our helpful Verizon Wireless Desktop Connectoror to link with Sync & Connect.
						</p>
						<p>
						You'll need to restart <s:property value="providerName"/>. And then sign in to Sync & Connect with your user name and password.
						</p>
						<p>
						Downloading will take a few moments.
						</p>
						</div>					 							
					</div>	
					<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE)">	
						<div style="margin-top:10px;margin-left: 5px;margin-left:20px;white-space: nowrap;"> 
							<div id="downloadText" style="float:left;margin-left: 5px;">
								<a href="<%=staticContentURL%>outlook/<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ProvisioningConstants@ICS_DESKTOP_CONNECTOR_FILE_NAME)"/>" class="button" id="downloadButton">
									<span class="interface"><span><span>&nbsp;&nbsp;Download</span></span></span>
								</a>
							</div>
						</div>
					</s:if>
					<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)">
						<div style="float:left;margin-top:15px;margin-left: 5px;margin-left:20px;white-space: nowrap;"> 
							<div id="downloadText" style="float:left;margin-left: 5px;">
								<a href="<%=staticContentURL%>outlook/<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ProvisioningConstants@ICS_DESKTOP_CONNECTOR_FILE_NAME)"/>" class="button" id="downloadButton">
									<span class="interface"><span><span>Download</span></span></span> 
								</a>
							</div>
						</div>		
					</s:elseif>					
				</s:if>
				<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@VVM_MESSAGE_SOURCE)">
					<!-- TODO: need to implement this. We don't have a comp for this. -->
				</s:elseif>
				<s:else>
					<div id="descDiv" style="margin-top: 10px;margin-left:15px;margin-right:3px; /*25px;width: 380px;*/">
						<div style="text-align: left;">
							We'll first connect with your
							
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo!<!-- need this yahoo only. -->
							</s:if>
							<s:else>		
								<s:property value="providerDesc"/>
							</s:else>										 
							 account, then give you options for syncing the account. 
							 If you have more than one 
							 
							 <s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo!<!-- need this yahoo only. -->
							</s:if>
							<s:else>		
								<s:property value="providerDesc"/>
							</s:else> 
							 account, you can add the other ones later.
						</div>
						
						<div style="text-align: left;margin-top: 10px;margin-left:3px;">
							<strong>Enter Your
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo!<!-- need this yahoo only. -->
							</s:if>
							<s:else>		
								<s:property value="providerDesc"/>
							</s:else>
							login information:</strong>
						</div>
					</div>		
					<div id="fieldsTextDiv" style="text-align: left;/*width:350px;*/margin-top: 10px;margin-left:20px; /*25px;*/"> 
						<div id="emailText" class="icsinline" style="width: 140px">
						<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
						<strong>Yahoo! ID:</strong>
						</s:if>
							<s:else>
							<strong>Username</strong>
							</s:else>
						</div>
						<div id="passwordText" class="icsinline" style="margin-left: 25px;">
							<strong>Password</strong>
						</div>	<br/>		
					</div>
					<div id="fieldsTextFieldsDiv" style="white-space: nowrap;margin-left:20px; /*25px;*//*width:350px*/"> 
						<div style="width: 140px;" class="icsinline">
						 <s:if test="%{endPointRequest.endPointVO.loginUserName.trim() != '' && !(endPointRequest.operationType).equalsIgnoreCase(@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION)}">	
							<s:textfield name="endPointRequest.endPointVO.loginUserName" id="userName" disabled="true" readonly="true"
							cssStyle="width:142;*margin-left:-20px;" />
							<s:hidden name="endPointRequest.endPointVO.loginUserName" value="%{endPointRequest.endPointVO.loginUserName}" ></s:hidden>							
						 </s:if>
						 <s:else>
						 	<s:textfield name="endPointRequest.endPointVO.loginUserName" id="userName" cssStyle="width:142;*margin-left:-20px;" 
						 	onkeyup="javascript:changeNextButtonStyle();" onchange="javascript:changeNextButtonStyle();" 
						 	onblur="javascript:changeNextButtonStyle();" />
						 </s:else>
						</div>
						<div class="icsinline" style="margin-left: 25px;">
							<s:password id="password" name="endPointRequest.endPointVO.loginPassword" cssStyle="width:142;*margin-left:-20px;" />
						</div>	
					</div>
					<div style="/*width:315px;*/height:50px;margin-top:20px;margin-left:20px; /*25px;*/">
					<div id="errorBlock" style="width:308px;display:none;font-size:11px; border: 1px solid red;background-color:#FFCCCC;"> 
						<div>
							<span style="width:15px;display:inline-block;margin-left:0px;background-color:#FFCCCC;vertical-align:top;margin:2px;">
								<img alt="Error" src="<%=staticContentURL%>styles/images/ics/provision/error_alert.gif" /> 		
							</span>
							<span id="userNamePwordRequired" style="display:none;margin-left: 5px;color: red">
								Email Address and Password are required.  
							</span>	
							<span id="invalidEmail" style="display:none;margin-left: 5px;color: red">
								Email Address is invalid.  
							</span>							
							<s:if test="%{response.statusCode > 0}">
							<span id="wrongCredentials" style="width:270px;display:none;margin-left: 5px;color: red">
									<s:property value="response.statusDesc"/>. 
									&nbsp;Please try again. <a href="<s:property value='%{@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(providerId).helpUrl}'/>"  target="_blank">Need Help?</a>
							</span>	
							</s:if>
						</div>									
						
					</div>
					</div>
			   </s:else>		
								
			
		
			
	  <s:set name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION"></s:set>
	  <div id="actionErrorBlock">
	  	<div style="float:left; margin-left:15px;">
	  		<strong>
	  			<s:actionerror cssStyle="float:left;margin-top:20px;margin-left: 35px;margin:5px;border: 1px solid red;"/>
	  		</strong>
	  	</div>
	  </div>							
	
	</div>
	
	   
	<!-- </div> -->			
	 </s:if>
	  </s:iterator>	
	  <%--<div id="rightDiv" style="width:200px;float:right;">
	<div id="helpDiv" class="icsinline" style="vertical-align:top; width:175px;height:335px;margin-top:15px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">

						<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE) || 
									providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)">
		<div style="text-align: left;text-indent: 10px; padding-top: 10px; font-size: 15px;">
							<strong>Do you know?</strong>				
						</div>
						<div style="margin-left:5px; text-align: left ;word-wrap:break-word;">									
						<div style="font-family:arial;font-size:11px;margin-left:1px; text-align: left ;word-wrap:break-word;line-height: 1em;*line-height: 0.9em">			
							<strong>What does Sync mean?</strong>
							<p style="font-family:arial;font-size:10px;margin-bottom: 5px;">
								Sync & Connect only supports the syncing of your contacts from <s:property value="providerName"/>. 
							</p>
							<p style="font-family:arial;font-size:10px;margin-bottom: 5px;">
							Your account will Sync automatically when you sign in and when you click the Sync button. So any updates and changes you make on either <s:property value="providerName"/> or Sync & Connect will show up whenever the two accounts sync.
							</p>
							<p style="font-family:arial;font-size:10px;margin-bottom: 5px;">
								Your contacts from <s:property value="providerName"/> will also be automatically synced once per day.
							</p>
							
							<strong>Syncing from <s:property value="providerName"/> </strong>
							<p style="font-family:arial;font-size:10px;margin-bottom: 5px;">
							Once you have installed the Verizon Wireless Desktop Connector you can also sync directly from Outlook. To sync from Outlook click on "Outlook Connector" in the menu and then click "Verizon Wireless Sync".
							</p>
							</div>
							</div>
						</s:if>
						<s:else>
					<div style="text-align: left;text-indent: 10px; padding-top: 10px; font-size: 15px;">
							<strong>Do you know?</strong>				
						</div>
						<div style="margin-left:5px; text-align: left ;word-wrap:break-word;">						
						<div style="margin-left:5px;margin-top:5px; text-align: left ;word-wrap:break-word;">
							<strong>Multiple Email Accounts</strong>
							<!--<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! 
							</s:if> 
							<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
							Gmail
							</s:elseif>
							<s:else>
									<s:property value="providerName"/>
							</s:else>
								 accounts?</strong>
							<p style="margin-bottom: 5px;">
								Sync & Connect only supports one 
								<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">Gmail</s:if>
								<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
									Yahoo! 
								</s:elseif> 
								<s:else>
									<s:property value="providerName"/>
								</s:else> account at this time. if you have multiple <s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail</s:if>
								<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
									Yahoo! 
								</s:elseif> 								
								<s:else>
									<s:property value="providerName"/>
								</s:else> 
								accounts, please select the account you use the most or is most important to you.
							</p>-->
							<p style="margin-bottom: 5px;">
								You can add up to five email accounts each from Gmail, Yahoo, MSN, and AOL and access them from one Sync & Connect inbox. 
							</p>
							<!-- <strong> What emails will you see? </strong>-->
							<strong> Email History </strong>
							<p style="margin-bottom: 5px;">
							At the time of setup, emails sent and received from each account during the past 30 days will be added to your Sync & Connect inbox.   All new emails will also be saved.
							</p>
							</div>
							</div>
						</s:else>
                   	
	</div>--%>

	   
	  	<div  id="buttonsBlock" style="float:right;padding-top: 10px;margin-right:15px;/*margin-left:10px;#margin-left:15px;*/">
	   		<div class="icsinline" style="margin-left:10px;margin-top:5px;#margin-top:-5px;padding-bottom:5px;">
				<a href="javascript:onCancel();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
			</div>
			<!-- 
			<div class="icsinline" style="margin-top: 1px;">
				<a href="javascript:submitBack();" class="button" id="backButton"><span class="interface"><span><span>&nbsp;&nbsp;Back</span></span></span></a>
			</div>	-->		
			<div class="icsinline" style="margin-left:10px;margin-top: 1px;*margin-top: 5px">			
				<s:if test="%{providerName == 'Outlook' || providerName == 'Thunderbird'}">			
					<s:a id="doneButton" href="javascript:submitDone();" targets="loginDiv" cssClass="button">
						<span class="red"><span><span>Done</span></span></span>
					</s:a>
				</s:if>
				<s:else>
					<a id="nextButton" href="javascript:submitNext();" class="button disabled" ><span class="red"><span><span>Next</span></span></span></a>						
				</s:else> 
			</div>
	   </div>
	   <!-- </div> -->	
	   </div>

</s:form>
</s:div>
</div>

<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>

<script type="text/javascript">
function changeTitle() {
	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points - ISP Connection');
	}
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
			&& parent.ics.app.listener.setSyncDialogTitle){
		parent.ics.app.listener.setSyncDialogTitle('Connect Sync Points - ISP Connection',true);
	}
}

function onPageLoad() {
		var browser=navigator.appName;
		var b_version=navigator.appVersion;
		var version=parseFloat(b_version);
		
		/*if(browser == 'Microsoft Internet Explorer' && !parent.Lib) {
			document.getElementById("layer_holder").setAttribute("class", "IE_Layer_Holder_CSS");
			document.getElementById("layer_holder").className="IE_Layer_Holder_CSS";
				
		}*/
		
	    if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){	
			parent.ics.app.listener.setIframeStyle({
				height: '300',
				width: '560'
			});
			parent.ics.app.listener.setDialogStyle({
				height: '300',
				width: '560'
			});
		}else{
			/*if(browser == 'Microsoft Internet Explorer'){
				document.getElementById('layer_holder').style.width="680px";
				document.getElementById('layer_holder').style.height="400px";
				document.getElementById('buttonsBlock').style.width='200px';
				/*document.getElementById('buttonsBlock').style.marginRight='-15px';
				document.getElementById('helpDiv').style.marginRight='20px';*/
			/*}else{
				document.getElementById('layer_holder').style.width="650px";
				document.getElementById('layer_holder').style.height="400px";
			}*/
			document.getElementById('layer_holder').style.width="560px";
			document.getElementById('layer_holder').style.height="300px";
		}
		
	changeTitle();
	var errorCode = '<s:property value="response.errorCode" />';
	errorCode = parseInt(errorCode);
	
	changeNextButtonStyle();
	 
	if(errorCode > 0) {
		document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS");
		document.getElementById("buttonsBlock").className = "errorButtonsBlockCSS";
		if(document.getElementById("errorBlock"))
		document.getElementById("errorBlock").style.display="block";
		if(document.getElementById("wrongCredentials")) {
		document.getElementById("wrongCredentials").style.display="inline-block";		
		document.getElementById("userName").style.border="1px solid red";
		document.getElementById("password").style.border="1px solid red";
		document.getElementById("userName").style.backgroundColor="#FFCCCC";
		document.getElementById("password").style.backgroundColor="#FFCCCC";
		}
		
	} else {
		if(document.getElementById("errorBlock"))
		document.getElementById("errorBlock").style.display="none";
		if(document.getElementById("wrongCredentials"))	
		document.getElementById("wrongCredentials").style.display="none";
	}	
}

	function submitNext() {
		if(document.getElementById("nextButton").className == "button") {
			var userName = "";
			var EMAIL_PATTERN = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(document.getElementById("userName")) {
				userName = document.getElementById("userName").value;
			}
			
			var password = "";
			if(document.getElementById("password")) {
				password = document.getElementById("password").value;
			}
			
		userName = trim(userName);
		password = trim(password);
		
		if(userName == '' || password == '')
		{
				document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS"); 
				document.getElementById("buttonsBlock").className = "errorButtonsBlockCSS";
				if(document.getElementById("wrongCredentials")){
					document.getElementById("wrongCredentials").style.display="none";}
				document.getElementById("errorBlock").style.display="block";
				document.getElementById("userNamePwordRequired").style.display="inline-block";
				document.getElementById("userName").style.border="1px solid red";
				document.getElementById("password").style.border="1px solid red";
				document.getElementById("userName").style.backgroundColor="#FFCCCC";
				document.getElementById("password").style.backgroundColor="#FFCCCC";
				document.getElementById("emailText").style.color="red";
				document.getElementById("passwordText").style.color="red";
				document.getElementById("invalidEmail").style.display="none";
				changeNextButtonStyle();				
				return ;					
			}	
			else if(userName.search(EMAIL_PATTERN) == -1){
				document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS"); 
				document.getElementById("buttonsBlock").className = "errorButtonsBlockCSS";
				document.getElementById("errorBlock").style.display="block";
				document.getElementById("userNamePwordRequired").style.display="none";
				document.getElementById("invalidEmail").style.display="inline-block";
				document.getElementById("userName").style.border="1px solid red";
				document.getElementById("userName").style.backgroundColor="#FFCCCC";
				document.getElementById("password").style.backgroundColor="#FFFFFF";
				document.getElementById("emailText").style.color="red";
				if(document.getElementById("wrongCredentials")){
					document.getElementById("wrongCredentials").style.display="none";}
				
				changeNextButtonStyle();
				return;
			}
			else {						
			 	document.forms[0].action ='<s:url value="/provisioning/endPointSynchronizationWizard.action"/>';
				document.forms[0].submit();
				if(document.getElementById("container")) {
				document.getElementById("container").className="processing";
			} 
			} 
		} else {
			return ;
		}
	}
	
	function submitBack() {
		document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
			document.forms[0].submit();
		if(document.getElementById("container")) {
		document.getElementById("container").className="processing";
	}
	}
	
	function submitDone() {
	
		if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setRefresh) {
				parent.ics.app.listener.setRefresh(true);
		}	
					
		document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
		document.forms[0].submit();
		if(document.getElementById("container")) {
		document.getElementById("container").className="processing";		
	}	
	}	
	function onError() {
		document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS"); 
		document.getElementById("buttonsBlock").className="errorButtonsBlockCSS";
		document.getElementById("errorBlock").style.display="block";
		document.getElementById("userName").style.border="1px solid red";
		document.getElementById("password").style.border="1px solid red";
		document.getElementById("emailText").style.color="red";
		document.getElementById("passwordText").style.color="red";
		
		changeNextButtonStyle();	
		return ;
	}

	function onCancel() {
		document.forms[0].action ='<s:url value="/provisioning/cancelEndPointWizard.action"><s:param name="icsSessionVO.endPointRequest.redirectSource"><s:property value="endPointRequest.redirectSource" /></s:param></s:url>';
		document.forms[0].submit();
		if(document.getElementById("container")) {
		document.getElementById("container").className="processing";			
	}
	}
	
	function changeNextButtonStyle() {
		var userName = "";
		var ALTERNATE_MAIL = "@aim.com";
		var MAIN_MAIL = "@aol.com";
		
		if(document.getElementById("userName")) {
				userName = document.getElementById("userName").value;
		}
		
		userName = trim(userName);
			
		if(userName.length >= 3) {
			if(document.getElementById("nextButton")) {		 
				document.getElementById("nextButton").setAttribute("class", "button");
				document.getElementById("nextButton").className="button";
			}
			var startIndex = userName.indexOf(ALTERNATE_MAIL);
			if(startIndex > -1) {
				userName = userName.replace(ALTERNATE_MAIL,MAIN_MAIL);
				document.getElementById("userName").value = userName;
			}		  			  		
		} else {
			if(document.getElementById("nextButton")) {		
				document.getElementById("nextButton").setAttribute("class", "button disabled");
				document.getElementById("nextButton").className="button disabled";
			} 
		}		
	}
	
</script>

</body>
</html>
