<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ include file="/nda/common/taglibraries.jsp" %>


<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />



</head>
<body class="pl" onload="onPageLoad();setAmTimer();">


<s:form method="post"  theme="simple"> 
<div id="layer_holder">
	<div id="processingMessageDiv" class="processingMessageDiv">
			<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
			&nbsp;&nbsp;<i>Processing ...</i>
		</div>
	 <div id="container" style="width:600px"> 
		
		
		<s:set id="baDownloadInfoLink" name="baDownloadInfoLink"
	                               			value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@BA_DOWNLOAD_INFO_LINK, 
	                               			@com.vzw.is.ics.common.ICSConstants@BA_DOWNLOAD_INFO_DEFAULTVALUE)" />		
		<div id="parentDiv" class="bodyDiv" style="text-align: left; width: 600px; /*height: 130px;*/ padding-top: 15px;"> 
			<div id="mainDiv" style="width: 580px;/*padding-bottom:25px;*/margin-left: 15px;#margin-left: 5px;/*padding-bottom:5px;*/">
				<div style="line-height: 1.2;">
						<span id="introText" style="font-size:17px;font-weight:bold;color:red">
							Welcome to Sync and Connect ..
						</span><br/><br/>						 
						<span style="font-size:12px;">
							Sync and Connect brings all your email and contacts together on the web and syncs them with your phone in just a few easy steps.
						</span><br/>						
				</div>
				<div id="leftDiv" class="icsinline" style="margin-top:5px;height: 355px;  font-family: arial;">
					<div style="text-align: left; margin-left: 8px; margin-top: 10px;">
						<span style="font-size:16px;">	
							<strong>Let's get started</strong><br/> 
						</span>						
					</div>
					
					<div class="icsinline" style="text-align: left; margin-left: 8px;">
						<span id="pointOrderImageDiv" class="icsinline newsyncpoint pointOrder1"></span>
						<div id="point1InfoDiv" class="icsinline" >
							<span style="margin-top:2px;">	
								Add one or more email accounts (or "sync points"). Email from these accounts will appear in your web inbox, along with text, picture and video messages<br/>
							</span><br/>
							<span style="margin-top:5px;font-size:12px;">	
								Click on connect button and follow the prompts <br/>
							</span>
							  				
							 
							      <s:iterator id="emailAndContactsProvidersList" value="@com.vzw.is.ics.utils.props.ICSSegregatedProviderProps@getEmailAndContactsProvidersMap()" status="itrStatus">							     
									<s:set id="providerId" name="providerId" value="providerId"/>     	 	
									<!--<s:set id="endPointCount" name="endPointCount" value="#totalEndpointsPerProviderMap.(#providerId)" />-->
									<s:set id="endPointCount" name="endPointCount" value="response.totalEndpointsPerProviderMap[#providerId]" />
									<s:set id="addEndPointUrl" name="addEndPointUrl" value=""/>		
									<s:set id="confirmSyncAndConnectRemoveUrl" name="confirmSyncAndConnectRemoveUrl" value=""/>
		             				<s:set id="providerName" name="providerName"
		                                	value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).providerName" />
		      						<s:set id="providerDesc" name="providerDesc" 
											value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#providerId).providerDesc"/>  
		                            <div id="emailProvidersDiv" style="height: 46px; margin-top: 5px; margin-right: 2px; margin-left: 50px;">	
		                                        <div style="height:50px;width:280px;">
		                                             <div class="icsinline endpoints <s:property value="providerName"/>" ></div>
		                                           	<span class="icsinline" style=" padding-right:5px;*margin-top:-30px;">
		                                                    <s:url id="addEndPointUrl" value="/provisioning/endPointConnectionWizard.action">																							
		                                                        <s:param name="endPointRequest.endPointVO.endPointId" value="#providerId"/>
		                                                        <s:param name="endPointRequest.endPointVO.endPointName" value="#providerName"/>
					                                            <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
					                                            <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION"/>
					                                            <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />
					                                            <s:param name="endPointRequest.redirectSource">welcomeScreen</s:param>
		                                                    </s:url>
		                                                    <s:url id="confirmSyncAndConnectRemoveUrl" value="/provisioning/confirmSyncAndConnectRemove.action">                     
		                                                    </s:url>
		                                               
		                                             <s:a href="%{addEndPointUrl}" cssClass="a" cssStyle="margin-left:5px;"><s:property value="providerDesc"/></s:a>                                             
		                                            </span>
		                                            <span class="icsinline" style="float:right;padding-top: 10px;*padding-top:0px;*margin-top:-35px;">
			                                             <s:a href="javascript:submitConnect('%{addEndPointUrl}');" 
			                                             		cssClass="button icsinline" id="connectBtn" cssStyle="float:right;">
											                  <span class="red"><span><span>Connect</span></span></span>
											                  <s:if test="%{icsSessionVO.userVO.firstTimeUser == true} ">
											                  		<s:hidden name="icsSessionVO.userVO.scWelcomeFlag" value="false"/>
											                  </s:if>
											             </s:a>
										            </span>
		                                        </div>                             
				                                       	 	
		                            </div>
		                            
		                        </s:iterator>		                        
	                        </div>
	                        <div id="baSetupInfoDiv">
		                        <span class="icsinline newsyncpoint pointOrder2"></span>
		                        <div  class="icsinline" style="margin-left: 42px; margin-top: -30px;">
		                        	<p>

								        Don't forget your contacts..<br/>
	                        			Setup Backup Assistant on your phone: <s:property value="icsSessionVO.userVO.mdn" /> so you can view all your phone contacts on the web
		                        		<a href="javascript:openLink('<s:property value='baDownloadInfoLink'/>','BADownloadInstructions');" class="a" style="color:red"> How do I do this? </a>
		                        	 </p>	                        
		                        </div>
	                        </div>
						</div>
					
				</div>							
			</div>
			<div id="nextButtonDiv" style="width: 520px; *height:10px;*padding-top:0px; padding-top: 5px;padding-left:20px;*padding-left:0px;">
				<div style="width: 450px;font-size:13px;" class="icsinline">
					We'll do the rest. Just Sync & Connect and Go.
					<!-- Your information is safe with us. Check our <a href="javascript:showPrivacyPolicy();" class="a">Privacy Policy.</a> -->
				</div>
			</div>	
			<s:set id="deviceInfo" name="deviceInfo" value="icsSessionVO.userVO.deviceInfo" />
			<s:if test="%{(#deviceInfo == null || #deviceInfo == '')}">
				<div style="width: 250px;height: 20px;font-size:13px;padding-top: 6px;padding-left:25px;padding-bottom: 10px">
						<s:a href="%{confirmSyncAndConnectRemoveUrl}" cssClass="a"> Not Interested? </s:a>
			</div>		
			</s:if>
		</div>
	</div> 
	</div>
</s:form>

<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<script type="text/javascript">


//if not first time user redirect to connection wizard
	var firstTimeUser =  '<s:property value="icsSessionVO.userVO.firstTimeUser"/>';

function submitConnect(url) {
	document.forms[0].action=url;
	document.forms[0].submit();
}

function onPageLoad() {
	var result='<s:property value="response.result"/>';
	var myvUrl='<s:property value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@MY_VZW_OVERVIEW_PAGE_URL)"/>';
	if(result=='myvOverview'){
		window.parent.location.href='<s:url value="'||myvUrl||'" includeParams="get"/>';
	}
	if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
		parent.ics.app.listener.setIframeStyle({
			height: '500',
			width: '630'
		});
		parent.ics.app.listener.setDialogStyle({
			height: '500',
			width: '630'
		});
	}else{
		document.getElementById('layer_holder').style.width="630px";
		document.getElementById('layer_holder').style.height="500px";
	}
	/*if (navigator.userAgent.indexOf('MSIE') !=-1){//If IE
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setDialogStyle({
				height: '570',
				width: '650'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '570',
				width: '650'
			});
		}else{
			document.getElementById('layer_holder').style.width="650px";
			document.getElementById('layer_holder').style.height="570px";
		}
	}else{
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setIframeStyle({
				height: '550',
				width: '630'
			});
			parent.ics.app.listener.setDialogStyle({
				height: '550',
				width: '630'
			});
		}else{
			document.getElementById('layer_holder').style.width="630px";
			document.getElementById('layer_holder').style.height="550px";
		}
    }*/
	if(firstTimeUser =='false'){	
		document.getElementById("layer_holder").className="processing";		
		document.getElementById("container").style.display="none";
		document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
		document.forms[0].submit();
				
	}else
	{
	    /*
	    var endpointsSize = '<s:property value="response.userEmailIds.size()"/>';
	    if(endpointsSize < 1){
			if (navigator.userAgent.indexOf('MSIE') !=-1){//If IE
				document.getElementById("continueButton").style.filter="alpha(opacity=50)";
			}else{			
				document.getElementById("continueButton").setAttribute("class", "button disabled");
			}
		}*/
		
		var baSetUp='<s:property value="icsSessionVO.userVO.handsetProvisioned"/>';
		if(baSetUp == 'true'){
			document.getElementById("baSetupInfoDiv").style.display="none";
			document.getElementById("pointOrderImageDiv").style.display="none";	
			document.getElementById("point1InfoDiv").style.margin="20px 0px 0px 42px";
			document.getElementById("leftDiv").style.height="350px";
		}else{
			document.getElementById("baSetupInfoDiv").style.margin="-10px 0px 0px 0px";
			document.getElementById("point1InfoDiv").style.margin="-30px 0px 0px 42px";
		}
		changeTitle();	
	}
}
function changeTitle() {

	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Welcome to Sync & Connect');
	}	
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
			&& parent.ics.app.listener.setSyncDialogTitle){
		parent.ics.app.listener.setSyncDialogTitle('Welcome to Sync & Connect',true);
	}
		
}

/*function addNewEndpoint() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}
function goToCreateEmail() {
	document.forms[0].action ='<s:url value="/provisioning/showCreateEmailId.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}*/
/*function showPrivacyPolicy() {
	window.open('http://www22.verizon.com/privacy/', 'PrivacyPolicy');	
}*/

function openLink(link,value) {
	window.open(link, value);	
}

/*function submitNext() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
	
}*/
</script>


</body>
</html>



