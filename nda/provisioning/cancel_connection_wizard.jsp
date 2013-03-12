<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.common.ICSProviderConstants"%>

<html>
<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<style type="text/css">
.IE_Layer_Holder_CSS {
	
}
</style>
</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
 <div id="layer_holder" >
<s:form action="cancelEndPointRequest.action" method="post" theme="simple">
<div id="container" >
	<s:iterator id="masterProviderList" value="response.masterProviderList">
		<s:set id="masterProviderId" name="masterProviderId" value="%{providerId}" />
		<s:set id="providerId" name="providerId" value="%{icsSessionVO.endPointRequest.endPointVO.endPointId}" />
		<s:if test="%{#masterProviderId == #providerId}" >	
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;margin-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>

<s:hidden name="endPointRequest.page" value="%{@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_CANCEL_CONNECTION_WIZARD}"/>

<div id="main" style="width:515px;height:295px;"  class="bodyDiv">
	<div id="contentDiv" class="icsinline" style="float:left;/*width:400px;*/margin-top:10px;margin-left: 15px;/*5px;*/margin-right:10px;">
				<s:set id="icsProviderName" name="icsProviderName" value="%{providerName}" />
							
				<div id="headingDiv" style="clear:left;margin-top:5px;white-space:nowrap;text-align:left;height: 50px">
					<div style="height:40px" class="icsinline">	
						<span class="icsinline endpoints <s:property value="providerName"/>" ></span>																																																																																																																											
					</div>
					<div style="margin-left: 5px;vertical-align:top;margin-top: 10px"  class="icsinline">
						<strong>Are you sure you wish to cancel the Connection Wizard? 					
						</strong>	
					</div><br/>			
				</div>
				
				<div style="height: 150px">
				<div style="/*width:350px;*/margin-left: 5px;margin-top: 5px;text-align: left">
					 Don't you want to complete connecting 
					 	<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
							Yahoo!<!-- need this yahoo only. -->
						</s:if>
						<s:else>		
							<s:property value="providerDesc"/>
						</s:else>
					 to Sync & Connect? 			
				</div>
				<div style="/*width:340px;*/margin-left: 5px;margin-top: 10px;text-align: left">
					(if you don't complete setup, you'll go ahead to Sync & Connect without connecting any of your 
						<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
							Yahoo!<!-- need this yahoo only. -->
						</s:if>
						<s:else>		
							<s:property value="providerDesc"/>
						</s:else>
					 services.)
					</div>
					</div>					
	
	</div>
	<div id="buttonsBlock" style="width:400px;float:right;margin-right:10px;"  >
		<div class="icsinline"  style="margin-top:5px;" align="left">
			<a href="javascript:submitCancelSyncEndPoint();" class="a" style="margin-right:10px">
				<span><span><span>Yes, cancel the Connection Wizard</span></span></span>
			</a>
		</div>
		<div class="icsinline" align="left" style="margin-top: 1px;*margin-top: 5px">			
			<s:a id="nextButton" href="javascript:continueToConnectionWizard();" cssClass="button">
				<span class="red"><span><span>No, Continue Syncing Services</span></span></span>
			</s:a> 
		</div>
	</div>	
	<%--
	<div id="helpDiv" class="icsinline" style="vertical-align:top; width:175px;height:275px;margin-top:15px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">
		<div style="text-align: left;text-indent: 10px; padding-top: 5px; font-size:15px;">
							<strong>Do you know?</strong>				
						</div>
						<div style="margin-left:5px; margin-left:10px;text-align: left ;word-wrap:break-word;padding-top:10px;">
							<strong>What does Sync mean?</strong>
							<p>
								When you sync your data - like emails and contacts - you're sharing the information between 
							 	<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail
								</s:if>
								<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! <!-- need this yahoo only. -->
								</s:elseif> 					
								<s:else>
								<s:property value="providerName"/>
								</s:else> 						 and Sync & Connect.
							</p>
							<p>
								Your account will Sync automatically when you sign in and when you click the Sync buton. So any updates and changes you make on either 
							 	<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail
								</s:if>
								<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! <!-- need this yahoo only. -->
								</s:elseif> 					
								<s:else>
								<s:property value="providerName"/>
								</s:else> 
								 or Sync & Connect will show up whenever the two accounts sync.
							</p>
						</div>
						
	</div> --%>
</div>
</s:if>
</s:iterator>
</div>
</s:form>
</div>


<script type="text/javascript">

	function onPageLoad() {
		var browser=navigator.appName;
		var b_version=navigator.appVersion;
		var version=parseFloat(b_version);
		
		if(browser == 'Microsoft Internet Explorer' && !parent.Lib) {
			document.getElementById("layer_holder").setAttribute("class", "IE_Layer_Holder_CSS");
			document.getElementById("layer_holder").className="IE_Layer_Holder_CSS";
				
		}
		/*if (navigator.userAgent.indexOf('MSIE') !=-1){
			if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
				parent.ics.app.listener.setDialogStyle({
					height: '325',
					width: '630'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '325',
					width: '630'
				});
			}else{
				document.getElementById('layer_holder').style.width="630px";
				document.getElementById('layer_holder').style.height="325px";
			}
		}else{
			if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
				parent.ics.app.listener.setDialogStyle({
					height: '315',
					width: '620'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '315',
					width: '620'
				});
			}else{
				document.getElementById('layer_holder').style.width="620px";
				document.getElementById('layer_holder').style.height="315px";
			}
	    }*/
	    if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setDialogStyle({
				height: '315',
				width: '520'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '315',
				width: '520'
			});
		}else{
			document.getElementById('layer_holder').style.width="520px";
			document.getElementById('layer_holder').style.height="315px";
		}
		changeTitle();
	}
		
	function changeTitle() {
		if(parent.Lib) {
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connection Wizard');
	}
	}
	
	function submitCancelSyncEndPoint() {
		var page = '<s:property value="icsSessionVO.endPointRequest.redirectSource"/>';
		if(page=='')
		{
			page='connectionWizard';
		}
		document.forms[0].action ='<s:url action="'+page+'.action" includeParams="post"/>';
		document.forms[0].submit();
		document.getElementById("container").className="processing";
	}	
	
	function continueToConnectionWizard() {
		var page = '<s:property value="endPointRequest.page"/>';
		var endPointConnectionWizard = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_CONNECTION_WIZARD" />';
		var endPointSynchornizeWizard = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_SYNCHRONIZATION_WIZARD" />';
		
		if(endPointConnectionWizard == page) { 
			document.forms[0].action ='<s:url action="endPointConnectionWizard.action" includeParams="post"/>';
		} else {
			document.forms[0].action ='<s:url action="endPointSynchronizationWizard.action" includeParams="post"/>';
		}
		document.forms[0].submit();
		document.getElementById("container").className="processing";		
	}
		
</script>
</body>
</html>
