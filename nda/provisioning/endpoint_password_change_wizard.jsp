<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<html>

<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />

<style type="text/css">
.IE_Layer_Holder_CSS {
	margin-left: -60px;
}

.buttonsBlockCSS {
	display:block; 
	float:right;
	margin-top:90px;
	/*padding-left:375px;280px;
	width:450px;*/
}

.errorButtonsBlockCSS {
	display:block; 
	float:right;
	margin-top:35px;
	/*padding-left:375px;280px;
	width:450px;*/
}

</style>

</head>

<body class="pl" onload="onPageLoad();" >
<div id="layer_holder" style="/*width:750px;width:600px;height:375px;*/">
<s:div id="loginDiv" theme="ajax">
<s:form action="createIcsEmailAccount.action" method="post" theme="simple">
<div id="container">
	
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="padding-left:50px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>

<div id="main" style="/*width:600px;height:375px*/" class="bodyDiv"> 
	<div id="contentDiv" style="float:left;width:570px;padding-top:10px;padding-right:10px;">
		<div id="pageHeaderDiv" style="float:left;width:100px;clear:left;">
			<span style="float:left; padding-left: 20px;white-space: nowrap;">
				<strong>Update Password</strong>				
			</span><br/><br/>
		</div>
		
		<s:iterator id="masterProviderList" value="response.masterProviderList">
			<s:set id="masterProviderId" name="masterProviderId" value="%{providerId}" />
			<s:set id="providerId" name="providerId" value="%{response.endPointVO.endPointId}" />
			
			<s:if test="%{#masterProviderId == #providerId}" >				
				<div id="headingDiv" style="clear:left;padding-left:10px;padding-top:5px;white-space:nowrap;text-align:left;">
					<span style="float:left; padding-left: 5px">
						<span class="icsinline endpoints <s:property value='providerName'/>" ></span>																																																										
					</span>
					<span style="float:left; margin-left: 5px;padding-top:10px;">
						<strong>Connect with
						 	<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo!<!-- need this yahoo only. -->
							</s:if>
							<s:else>		
								<s:property value="providerDesc"/>
							</s:else>												 
						</strong>	
					</span><br/>			
				</div>
				<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ProvisioningConstants@OUTLOOK)">
					<div id="descDiv" style="float:left;padding-top:15px;margin-left: 5px;padding-left:5px;white-space: nowrap;">
						<span style="float:left; padding-left: 5px">
							To connect to your Outlook account, you just need to download 
						</span><br/>
						<span style="float:left; padding-left: 5px">	
							and run the Sync & Connect installer below. It will ask you to open 
						</span><br/>				 
						<span style="float:left; padding-left: 5px">
							or restart Outlook and to verify your Sync & Connect username and password.
						</span><br/>
						<span style="float:left;padding-left: 5px;padding-top:20px">
							<strong>Just download the Sync & Connect installer to begin</strong>
						</span><br/>							 							
					</div>		
					<div style="float:left;padding-top:15px;margin-left: 5px;padding-left:20px;white-space: nowrap;"> 
						<span id="downloadText" style="float:left;padding-left: 5px;">
							<a href="<%=staticContentURL%>outlook/<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ProvisioningConstants@ICS_DESKTOP_CONNECTOR_FILE_NAME)"/>" class="button" id="downloadButton">
								<span class="interface"><span><span>Download</span></span></span> 
							</a>
						</span>
					</div>					
				</s:if>
				<s:elseif test="%{providerName == 'VVM'}">
					<!-- TODO: need to implement this. We don't have a comp for this. -->
					
				</s:elseif>
				<s:else>
					<div id="descDiv" 
						style="float:left;width:550px;padding-top:15px;padding-left:20px;text-align:left;/*white-space: nowrap;padding-top:15px;padding-left:20px;white-space: nowrap;text-align:left;padding-right:10px;*/">
						<span style="float:left; ">
							Your account 
							<s:property value="endPointRequest.endPointVO.loginUserName"/> could not be authenticated. If you have recently changed your email password, 
							please enter the most current password below
						</span>
						<%--
						<span style="float:left; ">
							We'll first connect with your 
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ProvisioningConstants@YAHOO)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:else>
								<s:property value="providerName"/>
							</s:else>													 
							account, then give you options for syncing
						</span><br/>
						<span style="float:left; ">	
							the account. If you have multiple
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ProvisioningConstants@YAHOO)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:else>
								<s:property value="providerName"/>
							</s:else>													 
							accounts, please choose just one
						</span><br/>				 
						<span style="float:left; ">
							to connect.
						</span><br/>
						<span style="float:left;;padding-top:20px">
							<strong>Enter your
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ProvisioningConstants@YAHOO)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:else>
								<s:property value="providerName"/>
							</s:else>													 							 
							login information.</strong>
						</span><br/>--%>							 							
					</div>		
					<div style="float:left;width:550px;padding-top:15px;padding-left:20px;white-space: nowrap;"> 
						<span id="emailText" style="float:left;">
							<strong>Email Address</strong>
						</span>
						<span id="passwordText" style="float:left;margin-left: 25px;padding-left:64px;">
							<strong>Password</strong>
						</span>	<br/>		
					</div>
					
					<div id="textFieldsDiv" style="float:left;padding-left:15px;white-space: nowrap;"> 
						<span style="float:left;padding-left: 5px;">
						<s:if test="%{endPointRequest.endPointVO.loginUserName.trim() != ''}">	
							<s:textfield name="endPointRequest.endPointVO.loginUserName" id="userName" disabled="true" readonly="true"
							cssStyle="width:142;*margin-left:0px;" />
							<s:hidden name="endPointRequest.endPointVO.loginUserName" value="%{endPointRequest.endPointVO.loginUserName}" ></s:hidden>							
						 </s:if>
						 <s:else>
						 	<s:textfield name="endPointRequest.endPointVO.loginUserName" id="userName" cssStyle="width:142;*margin-left:6px;"/>
						 </s:else>
						</span>
						<span style="float:left;margin-left: 25px;">
							<s:password id="password" name="endPointRequest.endPointVO.loginPassword" cssStyle="width:142;" />
						</span>	
						
						<%--
							Setting all the hidden fields. So I don't have to construct the url at form submission in javascript.
						--%>
						<s:hidden name="endPointRequest.endPointVO.endPointId" value="%{response.endPointVO.endPointId}" />
						<s:hidden name="endPointRequest.endPointVO.endPointName" value="%{response.endPointVO.endPointName}" />
						<s:hidden name="endPointRequest.endPointVO.userEndPointId" value="%{response.endPointVO.userEndPointId}" />
						
						<s:hidden name="endPointRequest.alertId" value="%{endPointRequest.alertId}" />						
					</div>
					
					<div id="errorBlock" style="display:none;float:left;width:400px;margin-top:20px;margin-left:10px;
						border: 1px solid red;white-space: nowrap;"> 
						<span style="float:left;padding-left:0px;">
							<img alt="Error" src="<%=staticContentURL%>styles/images/ics/provision/error_alert.gif" /> 		
						</span>
						<span id="userNamePwordRequired" style="display:none;float:left;padding-left: 5px;color: red">
							Email Address and Password are required.  
						</span>				
								<s:property value="response.statusDesc"/>  
						<span id="wrongCredentials" style="float:left;padding-left: 5px;color: red">
								<!-- Here the value is set from the dynamically from js as inner html -->
						</span>	
						<span style="float:left;padding-left:25px;padding-right:5px;padding-top:3px;">
							Please try again.<a href="" class="a">Need Help?</a>
						</span>
					</div>
			   </s:else>		
							
			   <div id="buttonsBlock" class="buttonsBlockCSS" style="*float:right;">			   
					<span class="icsinline" style="float:left;padding-left:10px;padding-top:5px;width:50px;">
						<a href="javascript:onCancel();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
					</span>
					<span class="icsinline"  style="float:left;padding-left:10px;">
						<s:a id="nextButton" href="javascript:submitSave();" targets="loginDiv" cssClass="button">
							<span class="red"><span><span>Save</span></span></span>
						</s:a>							
					</span>
			   </div>
		
			</s:if>
	  </s:iterator>		
	  <s:set name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION"></s:set>
	  <div id="actionErrorBlock">
	  	<span style="float:left; padding-left:15px;">
	  		<strong>
	  			<s:actionerror cssStyle="float:left;margin-top:20px;margin-left: 35px;padding:5px;border: 1px solid red;"/>
	  		</strong>
	  	</span>
	  </div>							
	</div>
	<%--
	<div id="helpDiv" style="float:left;width:255px;height:290px;margin-left:10px;margin-top:20px;border:1px solid #CCCCCC;white-space: normal;background-color: rgb(230, 238, 242);">
		<span style="float:left; margin-left: 10px">
			<strong>Do you know?</strong>				
		</span><br/><br/>
		<div style="float:left; padding:10px; line-height:20px; white-space: normal; text-align: left ;width:95%">Syncing your data, like emails and contacts means that the information will be shared between both services. Updates or changes on one side will happen on the other side too.</div><br/>
		
		<div style="float:left; padding:10px; line-height:20px; white-space: normal; text-align: left; width:95%">Syncing happens automatically when you sign in and whenever you press the "Sync" button on the top right of each screen</div><br/>
 	</div>
 	--%>
</div>
</div>
</s:form>
</s:div>
</div>

<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>

<script type="text/javascript">
function changeTitle() {
	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connection Wizard');
	}
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
			&& parent.ics.app.listener.setSyncDialogTitle){
		parent.ics.app.listener.setSyncDialogTitle('Connection Wizard',false);
	}
}

function onPageLoad() {
	var xmlhttp;
	
	var browser=navigator.appName;
	var b_version=navigator.appVersion;
	var version=parseFloat(b_version);
	
	/*if(browser == 'Microsoft Internet Explorer' && !parent.Lib) {
		document.getElementById("layer_holder").setAttribute("class", "IE_Layer_Holder_CSS");
		document.getElementById("layer_holder").className="IE_Layer_Holder_CSS";
			
	}*/
	if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
		parent.ics.app.listener.setDialogStyle({
			height: '400',
			width: '600'
		});	
		parent.ics.app.listener.setIframeStyle({
			height: '400',
			width: '600'
		});
	}
	changeTitle();
	var errorCode = '<s:property value="response.errorCode" />';
	errorCode = parseInt(errorCode);
	
	if(errorCode > 0) {
		if(document.getElementById("buttonsBlock")) {
		document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS");
		document.getElementById("buttonsBlock").className = "errorButtonsBlockCSS"; 
		}
		if(document.getElementById("errorBlock"))
			document.getElementById("errorBlock").style.display="block";
		if(document.getElementById("wrongCredentials"))
			document.getElementById("wrongCredentials").style.display="block";		
	} else {
		if(document.getElementById("errorBlock"))
			document.getElementById("errorBlock").style.display="none";
		if(document.getElementById("wrongCredentials"))	
			document.getElementById("wrongCredentials").style.display="none";
	}	
}

	function submitSave() {
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		userName = trim(userName);
		password = trim(password);
		var endPointId = '<s:property value="response.endPointVO.endPointId"/>';
		var endPointName='<s:property value="response.endPointVO.endPointName"/>';
		var loginUserName='<s:property value="response.endPointVO.loginUserName"/>';
		var userEndPointId = '<s:property value="response.endPointVO.userEndPointId"/>';
		var alertId = '<s:property value="endPointRequest.alertId"/>';
		
		
		if(userName == '' || password == '')
		{
			document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS"); 
			document.getElementById("buttonsBlock").className = "errorButtonsBlockCSS";
			document.getElementById("errorBlock").style.display="block";
			document.getElementById("userNamePwordRequired").style.display="block";
			document.getElementById("userName").style.border="1px solid red";
			document.getElementById("password").style.border="1px solid red";
			document.getElementById("emailText").style.color="red";
			document.getElementById("passwordText").style.color="red";
				
			return ;					
		}
		else {
			var urlString = 'endPointRequest.fmtType=jsp&endPointRequest.source=provision';
			urlString = urlString + '&endPointRequest.endPointVO.endPointId='+endPointId;
			urlString = urlString + '&endPointRequest.endPointVO.endPointName='+endPointName;
			urlString = urlString + '&endPointRequest.endPointVO.userEndPointId='+userEndPointId;
			urlString = urlString + '&endPointRequest.endPointVO.loginUserName='+loginUserName;
			urlString = urlString + '&endPointRequest.endPointVO.loginPassword='+password;
			urlString = urlString + '&endPointRequest.alertId='+alertId;
						
			var url = '<a href=/provisioning/modifyEndPointPassword.action?'+urlString +'&/>';
			//var url= '<s:url value="/provisioning/modifyEndPointPassword.action" includeParams="post"/>';
			if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}
			else { // code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}

			xmlhttp.onreadystatechange=state_Change
			xmlhttp.open("POST",url,true);
			xmlhttp.send(null);
			document.getElementById("container").className="processing";
		} 
	}


	function state_Change()
	{
		if(xmlhttp.readyState==4) {
		  try {
		    var xmlDoc=xmlhttp.responseXML.documentElement;
		    var statusCode = xmlDoc.getElementsByTagName("statusCode")[0].firstChild.nodeValue;
		    var showSyncInProgress = xmlDoc.getElementsByTagName("showSyncInProgress")[0].firstChild.nodeValue;
		    
		  	if(statusCode) {
		  		statusCode = parseInt(statusCode);
		  	}
		  
		  	if(statusCode == 0) {
			  	if(showSyncInProgress == 'true')
				{
					if(parent.ics && parent.ics.app && parent.ics.app.settings 
						&& parent.ics.app.settings.services&&parent.ics.app.settings.services.updateShowSyncPod) {
						parent.ics.app.settings.services.updateShowSyncPod(false);
					}		
				}
			  	
		  		//window.parent.location.href='<s:url value="/ics/icsOverview.action" includeParams="post"/>';		  				  		
		  		parent.ics.app.listener.closePWDialog();		  		
		  		document.getElementById("processingMessageDiv").className="processingMessageDiv"; 
		  	} else if(statusCode > 0) {
		  		var desc = xmlDoc.getElementsByTagName("statusDesc")[0];
		  		if(desc.firstChild) {
		  			desc = desc.firstChild.nodeValue;
		  		} else {
		  			desc = "The username or password you provided is incorrect.";
		  		}
		  		if(document.getElementById("errorBlock")) {
					document.getElementById("errorBlock").style.display="block";
				}
				if(document.getElementById("wrongCredentials")) {					
					document.getElementById("wrongCredentials").style.display="block";	
					document.getElementById("wrongCredentials").innerHTML = desc;
				}	
				document.getElementById("buttonsBlock").setAttribute("class", "errorButtonsBlockCSS"); 
				document.getElementById("buttonsBlock").className="errorButtonsBlockCSS";				
				document.getElementById("processingMessageDiv").className="processingMessageDiv"; 				
		  	}
		  } catch (err) {
		  		//Do nothing.
		  		document.getElementById("processingMessageDiv").className="processingMessageDiv";
		  }
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
		return ;
	}

	function onCancel() {
	if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.closePWDialog) {
				parent.ics.app.listener.closePWDialog();
			}	
	}
	
</script>
</body>
</html>
