<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="/nda/common/taglibraries.jsp" %>


<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.common.ICSMasterStatus"%>
<%@page import="com.vzw.is.ics.utils.props.ICSMasterProps"%>
<%@page import="com.vzw.is.ics.common.ICSServiceConstants"%>
<%@page import="com.vzw.is.ics.common.ICSProviderConstants"%>

<html>
<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />

<style type="text/css">

.IE_Layer_Holder_CSS {
	
}

.buttonsBlockWithOneCSS {
	display:block; 
	margin-top:28px;
	*margin-top:36px;
	width:420px;
}

.buttonsBlockWithTwoCSS {
	display:block; 
	margin-top:28px;
	*margin-top:36px;
	width:420px;
}

.buttonsBlockWithThreeCSS {
	display:block; 
	margin-top:28px;
	*margin-top:36px;
	width:420px;
}

</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" >
<s:form theme="simple"  method="post">
<div id="container">

	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
	<s:iterator id="masterProviderList" value="response.masterProviderList">
		<s:set id="masterProviderId" name="masterProviderId" value="%{providerId}" />	
		<s:set id="providerId" name="providerId" value="%{endPointRequest.endPointVO.endPointId}" />
			<s:if test="%{#masterProviderId == #providerId}" >		
		<div id="main" style="text-align: left; margin-left: 5px" class="bodyDiv">
		<s:hidden name="endPointRequest.page" value="%{@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_SYNCHRONIZATION_WIZARD}"/>
	
		<div id="contentDiv" class="icsinline" style="width:440px;height:200px; margin-top:5px;margin-right:5px;">

		<s:set name="premium" value="@com.vzw.is.ics.common.ProvisioningConstants@ICS_FLAG_PREMIUM"/>
			
					<s:set id="icsProviderName" name="icsProviderName" value="%{providerName}" />		
				<div id="headingDiv" style="float:left;padding-left:10px;padding-top:5px;margin-bottom:5px;white-space:nowrap;width:435px;height:40px;text-align:left;">
					<div id="iconDiv" style="float:left;">	
						<span class="icsinline endpoints <s:property value='providerName'/>" ></span>																																																										
					</div>
					<div id="headingTextDiv" style="float:left;padding-left:5px;padding-top:10px;margin-bottom:10px;white-space: nowrap;width:380px;">
						<strong>How would you like to connect your
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo!<br> <!-- need this yahoo only. -->
							</s:if>
							<s:else>		
								<s:property value="providerDesc"/><br>
							</s:else>		
						 and Sync & Connect Services.</strong>
						<br/>		
					</div>
		
				</div>
				<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@VVM_MESSAGE_SOURCE)">
					<!-- TODO: need to implement this. We don't have a comp for this. -->
					<div style="padding-top:15px;padding-left:10px;white-space:nowrap;"> 
					</div><br/>
				</s:if>
				<s:else>
					<s:set name="mailServiceStatus" value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@MAIL).getStatus()"/>
					<s:set name="contactsServiceStatus" value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@CONTACTS).getStatus()"/>
					<s:set name="calendarServiceStatus" value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@CALENDAR).getStatus()"/>
					
					<s:if test="@com.vzw.is.ics.common.ICSMasterStatus@ACTIVE == #mailServiceStatus">	
					<div id="emailsDiv" style="padding-left:12px;margin:5px; text-align: left ;word-wrap:break-word;">						
						<div class="icsinline" style="text-align: left; padding-top:10px;">
							<s:checkbox id="syncEmails" cssStyle="padding-right: 5px;"  disabled="true"
								name="endPointRequest.endPointVO.syncEmails"
								fieldValue="endPointRequest.endPointVO.syncEmails" 
								value="true" />
								<!-- value="endPointRequest.endPointVO.syncEmails" /> -->
						</div>	 
						<div class="icsinline" style="padding-left:5px;text-align: left;padding-top:10px;"><strong>Sync my emails </strong></div><br/>	
						<!-- <input type="checkbox" id="syncEmails" name="endPointRequest.endPointVO.syncEmails" style="padding-right: 5px;"
							value="endPointRequest.endPointVO.syncEmails" /> -->
			
						<div style="margin-left:28px;margin-top:5px;margin-right:5px;margin-bottom:5px; text-align: left ;word-wrap:break-word;">	
							All future emails will be synced with Sync & Connect. To get started we'll bring in the past 30 days of mail from this account.
							If you've created tags to organize your Inbox, those will be brought in too.
						</div><br/>				 

					</div>						
				  	</s:if>
									
				  	<s:if test="@com.vzw.is.ics.common.ICSMasterStatus@ACTIVE == #contactsServiceStatus">				
					<div id="contactsDiv" style="padding-left:12px;margin:5px; text-align: left ;word-wrap:break-word;"> 			
						<div class="icsinline" style="padding-right:5px;text-align: left;padding-top:10px;">
						<!--					
							<input type="checkbox" id="calendarsSelected" name="endPointRequest.syncCalendars" 
								style="margin-right: 5px;"/>				
						-->
							
							<s:checkbox id="contactsSelected" cssStyle="padding-right: 5px;" 
								name="endPointRequest.endPointVO.syncContacts"
								fieldValue="endPointRequest.endPointVO.syncContacts" 
								value="endPointRequest.endPointVO.syncContacts" />
							</div>
							<div class="icsinline" style="text-align: left; padding-top:10px;">
							
							<s:if test="%{icsSessionVO.endPointRequest.user.icsFlag == #premium}">					
								<select id="syncOrImportContacts" name="endPointRequest.endPointVO.syncOrImportContacts">
									<option value="import">Import</option>
									<option value="sync">Sync</option>
									
								</select>					
							</s:if>
							<s:else>
								<strong>Import</strong>					
							</s:else>
							<strong>my contacts</strong>						
						</div><br/>
					<div style="margin-left:28px;margin-top:5px;margin-right:5px;margin-bottom:5px; text-align: left ;word-wrap:break-word;">	
							All your
							<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail
							</s:elseif>							
							<s:else>
								<s:property value="providerName"/>
							</s:else>													 
							 contacts will be brought into Sync & Connect. If you've created folders to organize your contacts, those will become Groups in Sync & Connect and retain the same name. 
						</div><br/>				 
						
					</div>
					</s:if>
					
					<s:if test="@com.vzw.is.ics.common.ICSMasterStatus@ACTIVE == #calendarServiceStatus">	
						<div id="calendarDiv" style="float:left;padding-left:20px;margin-bottom:5px;white-space:nowrap;width:525px;height:60px;"> 			
						<span style="float:left;text-align: left; padding-top:10px;">
							<s:checkbox id="calendarsSelected" cssStyle="padding-right: 5px;" 
								name="endPointRequest.endPointVO.syncCalendars"
								fieldValue="endPointRequest.endPointVO.syncCalendars" 
								value="endPointRequest.endPointVO.syncCalendars" />
						
							<s:if test="%{icsSessionVO.endPointRequest.user.icsFlag == #premium}">				
									<select id="syncOrImportCalendars" name="endPointRequest.endPointVO.syncOrImportCalendars">
										<option value="import">Import</option>
										<option value="sync">Sync</option>
									</select>						
								</s:if>				
								<s:else>
									<strong>Import</strong>						
								</s:else>
							<span style="padding-left:5px;"><strong>my calendars</strong></span>							
							</span><br/>			
						<span style="float:left;padding-left:25px;text-align: left;">	
							All your 
								<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail
							</s:elseif>								
							<s:else>
								<s:property value="providerName"/>
							</s:else>													
							 calendars will be brought into Sync & Connect. They will retain the name 
						</span><br/>				 
						<span style="float:left;padding-left:25px;text-align: left;">
							you gave them in 
								<s:if test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@YAHOO_MESSAGE_SOURCE)">
								Yahoo! <!-- need this yahoo only. -->
							</s:if>
							<s:elseif test="providerName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@GOOGLE_MESSAGE_SOURCE)">
								Gmail
							</s:elseif>								
							<s:else>
								<s:property value="providerName"/>.
							</s:else>																				
						</span><br/>
					</div>										
					</s:if>					
				   																
				</s:else>			
							
	</div>
	<%--
	<div id="helpDiv" class="icsinline" style="vertical-align:top;width:225px;height:280px;margin-top:10px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">
			<div style="text-align: left;text-indent: 10px; padding-top: 10px; font-size: 15px;">
				<strong>Did you know?</strong>				
			</div>
			<div style="margin:10px; text-align: left ;word-wrap:break-word;">
			<strong>What does Sync mean?</strong>
			<br/>
			Your account will sync automatically when you sign in and when you click the Sync button. So any updates and changes you make on either 
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
			
			</div>
			<div style="margin:5px; text-align: left ;word-wrap:break-word;">
			
			
	   </div>
	</div> --%>
	<div id="buttonsBlock" class="buttonsBlockWithOneCSS" align="right"style="float:right;margin-top:5px !important;padding-right:20px;">
		<div class="icsinline" style="margin-left:10px;margin-top:5px;#margin-top:-5px;padding-bottom:5px;">
			<s:a href="cancelEndPointWizard.action" cssClass="a" cssStyle="margin-right:10px">
				<span><span><span>Cancel</span></span></span>
			</s:a>
		</div>
		<div class="icsinline">
			<a href="javascript:submitBack();" class="button" id="backButton">
				<span class="interface"><span><span>&nbsp;&nbsp;Back</span></span></span>
			</a>
		</div>			
		<div class="icsinline" style="margin-left:10px;#margin-left:20px;">
			<s:set name="addEndpointOperation" id="addEndpointOperation" value="@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION"/>
			<s:set name="modifyEndpointOperation" id="modifyEndpointOperation" value="@com.vzw.is.ics.common.NABCommonConstants@MODIFY_ENDPOINT_OPERATION"/>
										
			<s:if test="%{icsSessionVO.endPointRequest.operationType == #addEndpointOperation}">
				<s:a href="javascript:submitNext('addEndPoint');" 
						cssClass="button" id="nextButton">
				<span class="red"><span><span>Next</span></span></span>
			</s:a>
			</s:if>
			<s:else>
				<s:a href="javascript:submitNext('modifyEndPoint');" cssClass="button" id="nextButton">
					<span class="red"><span><span>Next</span></span></span>
				</s:a>
			</s:else>
		</div>
   </div>	
</div>
</s:if>
</s:iterator>

</s:form>

</div>

<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
 

<script type="text/javascript">

function changeTitle() {
 	var firstTimeUser =  '<s:property value="icsSessionVO.userVO.firstTimeUser"/>';
	  	if(firstTimeUser == 'true'){
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points - ISP Connection');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Connect Sync Points - ISP Connection',true);
			}
			
		}else{
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Manage Sync Points - ISP Connection');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points - ISP Connection',true);
			}
		
		}
	}
	
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
					height: '360',
					width: '705'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '360',
					width: '705'
				});
			}else{
				document.getElementById('layer_holder').style.width="695px";
				document.getElementById('layer_holder').style.height="360px";
			}
		}else{*/
			if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
				parent.ics.app.listener.setDialogStyle({
					height: '250',
					width: '500'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '250',
					width: '500'
				});
			}else{
				document.getElementById('layer_holder').style.width="500px";
				document.getElementById('layer_holder').style.height="250px";
			}
	    //
		changeTitle();
				
		var mailServiceStatus = '<s:property value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@MAIL).getStatus()"/>';
		var contactsServiceStatus = '<s:property  value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@CONTACTS).getStatus()"/>';
		var calendarServiceStatus = '<s:property value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@CALENDAR).getStatus()"/>';
		
		var activeStatus = '<s:property value="@com.vzw.is.ics.common.ICSMasterStatus@ACTIVE"/>' ;
		var count = 0;
		
		if(activeStatus == mailServiceStatus) {
			count++;
		} 
		if(activeStatus == contactsServiceStatus) {
			count++;
		}
		if(activeStatus == calendarServiceStatus) {
			count++;
		} 
		
		if(document.getElementById("buttonsBlock")) {
			if(count == 1) {
				document.getElementById("buttonsBlock").setAttribute("class", "buttonsBlockWithOneCSS");
				document.getElementById("buttonsBlock").className = "buttonsBlockWithOneCSS"; 
			} else if(count == 2) {
				document.getElementById("buttonsBlock").setAttribute("class", "buttonsBlockWithTwoCSS");
				document.getElementById("buttonsBlock").className = "buttonsBlockWithTwoCSS"; 
			} else if(count == 3) {
				document.getElementById("buttonsBlock").setAttribute("class", "buttonsBlockWithThreeCSS");
				document.getElementById("buttonsBlock").className = "buttonsBlockWithThreeCSS"; 
			} 	 
		}	
	}
	
	function submitNext(actionName) {
		var syncEmails = false;
		var contactsSelected = false;
		var calendarsSelected = false;
	
		if(document.getElementById("syncEmails")) {
			syncEmails = document.getElementById("syncEmails").checked;
		}
		
		if(document.getElementById("contactsSelected")) {
			contactsSelected = document.getElementById("contactsSelected").checked;
		}
		
		if(document.getElementById("calendarsSelected")) {
			calendarsSelected = document.getElementById("calendarsSelected").checked;
		}
	
	var urlString = "&endPointRequest.endPointVO.syncEmails="+syncEmails;
	var syncFlag =false;
	var importFlag =false;
	
	if(contactsSelected) {
		if( document.getElementById("syncOrImportContacts") != null) {
		
			if(document.getElementById("syncOrImportContacts").value == 'sync') {
				syncFlag =true;
				importFlag=false;
			 } else {
			 	syncFlag =false;
				importFlag=true;
			 }
		} else {
				syncFlag =false;
				importFlag=true;
		 }
	} else {
			syncFlag =false;
			importFlag=false;
	}
	
			urlString = urlString +'&endPointRequest.endPointVO.syncContacts='+syncFlag;
			urlString = urlString + '&endPointRequest.endPointVO.importContacts='+importFlag;
	
		
	if(calendarsSelected) {
		if( document.getElementById("syncOrImportCalendars") != null) {
		
			if(document.getElementById("syncOrImportCalendars").value == 'sync') {
				syncFlag =true;
				importFlag=false;
			 } else {
			 	syncFlag =false;
				importFlag=true;
			 }
		} else {
				syncFlag =false;
				importFlag=true;
		 }
	} else {
			syncFlag =false;
			importFlag=false;
	}
	
	urlString = urlString+'&endPointRequest.endPointVO.syncCalendars='+syncFlag;
	urlString = urlString + '&endPointRequest.endPointVO.importCalendars='+importFlag;
		
	if(actionName == 'addEndPoint'){
		var url = '<a href=/provisioning/showProviderTermsAndConditions.action?'					
					+'endPointRequest.fmtType=jsp'
					+'&endPointRequest.source=provision'
						+ urlString + '/>';				
	}else{
		var url = '<a href=/provisioning/'+actionName+'.action?'					
					+'endPointRequest.fmtType=jsp'
					+'&endPointRequest.source=provision'
						+ urlString + '/>';
	}	 
	document.forms[0].action =url;
	document.forms[0].submit();
	document.getElementById("container").className="processing";	
	}
					
	function submitBack() {
		var loginUserName = '<s:property value="icsSessionVO.endPointRequest.endPointVO.loginUserName" />';
		
		var url = '<s:url value="/provisioning/endPointConnectionWizard.action">' +
					'<s:param name="endPointRequest.endPointVO.endPointId" value="icsSessionVO.endPointRequest.endPointVO.endPointId" />' +
					'<s:param name="endPointRequest.endPointVO.endPointName" value="icsSessionVO.endPointRequest.endPointVO.endPointName" />' +
					'<s:param name="endPointRequest.endPointVO.loginUserName" value="icsSessionVO.endPointRequest.endPointVO.loginUserName" />' +
					'<s:param name="endPointRequest.endPointVO.loginPassword" value="icsSessionVO.endPointRequest.endPointVO.loginPassword" />' +
		 		  '</s:url>';
 	
	document.forms[0].action =url;
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	}
	
</script>

</body>
</html>
