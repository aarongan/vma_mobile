<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<style type="text/css">

</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder">

<s:form action="" theme="simple"> 
	<div id="container" style="width:500px">		
		<div id="processingMessageDiv" class="processingMessageDiv">
			<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
			&nbsp;&nbsp;<i>Processing ...</i>
		</div>
		
		<div id="parentDiv" class="bodyDiv" style="text-align: left; width: 500px; height: 130px; padding-top: 15px;"> 
			<div id="mainDiv" style="width: 480px;padding-bottom:25px;margin-left: 15px;#margin-left: 5px;*padding-bottom:5px;">
				<div style="line-height: 1.2;">
						<span id="introText" style="font-size:17px;font-weight:bold;">
							Add new Sync and Connect ..
						</span><br/><br/>						 
						<span style="font-size:12px;padding-top:10px;margin-left:20px;">
							Click on an icon below to begin fetching your email, then click done.
						</span><br/> 
						
				</div>
				<div id="leftDiv" class="icsinline" style="margin-top:17px;height: 200px;  font-family: arial;">
						<div id="point1InfoDiv" class="icsinline" style="width:455px;margin-left:50px;/*margin-left:-20px;*/">
							<s:set id="totalEndpointsPerProviderMap" name="totalEndpointsPerProviderMap" value="response.totalEndpointsPerProviderMap"/>  				
							<s:set id="totalEndpoints" name="totalEndpoints" value="response.totalEndpoints"/> 						
							      <s:iterator id="emailAndContactsProvidersList" value="response.emailAndContactsProviders" status="itrStatus">							     
									<s:set id="providerId" name="providerId" value="providerId"/>     	 	
									<!--<s:set id="endPointCount" name="endPointCount" value="#totalEndpointsPerProviderMap.(#providerId)" />-->
									<s:set id="endPointCount" name="endPointCount" value="response.totalEndpointsPerProviderMap[#providerId]" />
									<s:set id="addEndPointUrl" name="addEndPointUrl" value=""/>
									<s:set id="providerDesc" name="providerDesc" 
											value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).providerDesc"/>
		             				<s:set id="providerName" name="providerName"
		                                	value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).providerName" />
		      						
		                            <div class="icsinline" id="emailProvidersDiv" style="margin: 0px;width:200px;">	
		                                            <span class="icsinline endpoints <s:property value='providerName'/>" style="height:60px !important;"></span>
		                                           	<span class="icsinline" style=" font-size:13px;padding-right: 5px; margin-top: -30px;*margin-top:-50px;">
		                                           		<s:if test="%{#totalEndpoints < @com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@MAX_USER_ENDPOINTS)}" >
		                                           	
		                                           		<s:if test="%{#endPointCount < @com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@MAX_USER_ENDPOINTS_PER_PROVIDER)}" >
		                                                    <s:url id="addEndPointUrl" value="/provisioning/endPointConnectionWizard.action" includeParams="post">																							
		                                                        <s:param name="endPointRequest.endPointVO.endPointId" value="#providerId"/>
		                                                        <s:param name="endPointRequest.endPointVO.endPointName" value="#providerName"/>
					                                            <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
					                                            <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION"/>
					                                            <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />
					                                   			<s:param name="endPointRequest.redirectSource">newSyncPointWizard</s:param>
		                                                    </s:url>
		                                                    
		                                               </s:if>
		                                             </s:if>
		                                             <s:a href="%{addEndPointUrl}" cssClass="icsinline a" cssStyle="margin-left:5px;"><s:property value="providerDesc"/></s:a>                                             
		                                            </span>                        
				                                       	 	
		                            </div>
		                            
		                        </s:iterator>		                        
	                        </div>	
						<div id="baSetupInfoDiv">
	                        <div  class="icsinline" style="margin-left: 22px;padding-top:30px; ">
	                        	<p>
	                        		Don't forget your contacts..<br/>
	                        		Setup Backup Assistant on your phone: <s:property value="icsSessionVO.userVO.mdn" /> so you can view all your phone contacts on the web
	                        		<s:set id="baDownloadInfoLink" name="baDownloadInfoLink"
	                              			value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@BA_DOWNLOAD_INFO_LINK, 
	                              			@com.vzw.is.ics.common.ICSConstants@BA_DOWNLOAD_INFO_DEFAULTVALUE)" />
							        <a href="javascript:openLink('<s:property value='baDownloadInfoLink'/>','BADownloadInstructions');" class="a" style="color:red"> How do I do this? </a>
	                        	 </p>	                        
	                        </div>
                        </div>
					
				</div>	
				<!-- 	<div id="middleDiv" class="icsinline" style="margin-top:20px;margin-left:10px;height: 270px; width: 180px; font-family: arial; border-right: 1px dotted;">
					<div style="text-align: left; margin-left: 8px; margin-top: 10px;">
					
						<span style="font-size:16px;">	
							<strong>Email</strong><br/> 
						</span>
						<span style="margin-top:5px;">	
							<strong>Connects to:</strong><br/>
						</span>
						<span style="margin-top:5px;">	
							Emails<br/>
						</span>
					</div>
					<div style="text-align: left;  margin-top: 10px;" class="icsinline">
						<s:select label="response.emailOnlyProvidersMap"
						       list="response.emailOnlyProvidersMap" listKey="providerId" listValue="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(providerId).providerName"
						       required="true"
						       size="15" cssStyle="width:150px;"    
						/>

						
					</div>

					
				</div>-->
				<!-- 
						
				<div id="rightDiv" class="icsinline" style="margin-top:20px;margin-left:10px;height: 330px; width: 280px;  font-family: arial; ">
				<div style="text-align: left; margin-left: 8px; margin-top: 10px;">
						<span style="font-size:16px;">	
							<strong>Desktop Software</strong><br/> 
						</span>
						<span style="margin-top:5px;">	
							<strong>Connects to:</strong><br/>
						</span>
						<span style="margin-top:5px;">	
							Contacts<br/>
						</span>
					</div>
						<div id="contactProvidersMainDiv" style="text-align: left; margin-top: 60px; margin-left: 8px;">
                			<s:set id="outlookConnected" name="outlookConnected" value="false"/>
                			<s:set id="thunderbirdConnected" name="thunderbirdConnected" value="false"/>
							<s:iterator id="servicesProvidersList" value="response.servicesProvidersList">
							
							<s:set id="providerServiceDetailId" name="providerServiceDetailId" value="providerServiceDetailId"/>                                        
			                <s:set id="endPointId" name="endPointId"	value="endPointId" />				 		 	
			                <s:set id="endPointName" name="endPointName"
		                               	value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#endPointId).providerName" />
		                    
                      			 <s:if test="%{#endPointName.equalsIgnoreCase(
                               				@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE)}">
                               		<s:set id="outlookConnected" name="outlookConnected" value="true"/>
                           		</s:if>
                           		<s:elseif test="%{ #endPointName.equalsIgnoreCase(
                               				@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)}">
                               		<s:set id="thunderbirdConnected" name="thunderbirdConnected" value="true"/>
                           		</s:elseif>
                           	
                           	</s:iterator>    
                           	           	
					      <s:iterator id="contactsOnlyProviders" value="response.contactsOnlyProviders" status="itrStatus">
							
							<s:set id="providerId" name="providerId" value="providerId"/>     	 	
							
							
             				<s:set id="providerName" name="providerName"
                                	value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).providerName" />
      
                            <div id="contactProvidersDiv" style="height: 75px; margin-top: 5px; border-bottom: 0px dotted; margin-right: 2px; margin-left: 3px;">	
                                        <div style="height:70px;width:200px;margin-left:5px;">
                                            <div>
                                                <img style="height:35px;" src="<%=staticContentURL%><s:property value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).imgUrl"/>" />
                                            </div>
                                           	<div style=" padding-right:4px;">
                                           	
                                           	<s:if test="response.userVzwEmail != null && response.userVzwEmail.trim() != '' && !outlookConnected">
                                                    <s:url id="addEndPointUrl" value="/provisioning/endPointConnectionWizard.action" includeParams="post">																							
                                                        <s:param name="endPointRequest.endPointVO.endPointId" value="#providerId"/>
                                                        <s:param name="endPointRequest.endPointVO.endPointName" value="#providerName"/>
			                                            <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
			                                            <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION"/>
			                                            <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />
                                                    </s:url>
                                                    <s:a href="%{addEndPointUrl}" cssClass="a" ><s:property value="providerName"/></s:a>
                                            </s:if>
                                            <s:else>
                                            		<s:property value="providerName"/>
                                            </s:else>
                                            </div>
                                        </div>
                              
		                                       	 	
                            </div>
                        </s:iterator>
                      
                        <s:if test='response.userVzwEmail == null || "" == response.userVzwEmail'>
                        <div>
                              A VZW.net email address is required to sync with desktop software<br>
                              <a href="javascript:goToCreateEmail();" style="" > Get One Now</a>
                        </div>
                        </s:if>
                          
					</div>

					
				</div>	-->		
			</div>
			<div id="nextButtonDiv" style="width: 430px; height: 20px; padding-left:30px;*margin-top:20px;">
				<div style="width: 350px;font-size:11px;" class="icsinline">
					Your information is safe with us. Check our 
					<s:set id="privacyPolicyLink" name="privacyPolicyLink"
                         value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@PRIVACY_POLICY_LINK, 
                         @com.vzw.is.ics.common.ICSConstants@PRIVACY_POLICY_DEFAULTVALUE)" />
			        <a href="javascript:openLink('<s:property value='privacyPolicyLink'/>','PrivacyPolicy');" class="a">Privacy Policy.</a>
				</div>
				<div style="float:right;margin-right: -60px;#margin-right: 0px;#margin-top:-10px;" class="icsinline">				
					<a href="javascript:submitNext();" class="button" id="continueButton">
						<span class="red"><span><span>Done</span></span></span>
					</a>
				</div>
				<!-- <div style="float:right;margin-right: -60px;#margin-right: 0px;#margin-top:-10px;" class="icsinline">				
					<a href="javascript:submitNext();" class="button" id="nextButton">
						<s:set id="firstTimeUser" name="firstTimeUser" value="icsSessionVO.userVO.firstTimeUser"/>
						<span class="red"><span><span>
						<s:if test='%{#firstTimeUser}'>
							No Thanks
						</s:if>
						<s:else>
							Done
						</s:else>
						</span></span></span>
					</a>
				</div> -->
			</div>	
	
		</div>
	</div>
</s:form>

</div>

<script type="text/javascript">


function onPageLoad() {

	var endpointsSize = '<s:property value="response.userEmailIds.size()"/>';
	//var baSetUp='<s:property value="response.handsetProvisioned"/>';
	var baSetUp='<s:property value="icsSessionVO.userVO.handsetProvisioned"/>';
	if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
		parent.ics.app.listener.setDialogStyle({
			height: '370',
			width: '550'
		});	
		parent.ics.app.listener.setIframeStyle({
			height: '370',
			width: '550'
		});
	}else{
		document.getElementById('layer_holder').style.width="550px";
		document.getElementById('layer_holder').style.height="370px";
	}
	
    if(baSetUp == 'true'){
		document.getElementById("baSetupInfoDiv").style.display="none";
		document.getElementById("point1InfoDiv").style.padding="30px 0px 0px";
	}
	changeTitle();	
}
function changeTitle() {

  	/*var firstTimeUser =  '<s:property value="icsSessionVO.userVO.firstTimeUser"/>';

	  	if(firstTimeUser == 'true'){
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points - Add New');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Connect Sync Points - Add New',true);
			}			
			
		}else{
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Manage Sync Points - Add New');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points - Add New',true);
			}
		
		}*/
		if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points - Add New');
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points - Add New',true);
		}		
	}

function addNewEndpoint() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action" includeParams="post"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}
function goToCreateEmail() {
	document.forms[0].action ='<s:url value="/provisioning/showCreateEmailId.action" includeParams="post"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}
/*function showPrivacyPolicy() {
	window.open('http://www22.verizon.com/privacy/', 'PrivacyPolicy');	
}*/
function openLink(link,value) {
	window.open(link, value);	
}
function submitNext() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action" includeParams="post"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}
</script>


</body>
</html>



