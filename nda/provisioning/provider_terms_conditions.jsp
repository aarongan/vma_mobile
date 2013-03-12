<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>

<html>

<div id="layer_holder" >
<body class="pl" onload="onPageLoad();setAmTimer();">
<head>

<title>SC Terms Of Service Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" >

<s:form action="/provisioning/agreeTermsAndConditions.action" method="post" theme="simple">
<div id="container">

	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>

	<div id="mainDiv" >
		<div style="float:left;width:407px;text-align:left;padding-left:15px;padding-bottom:20px;padding-right:15px;#padding-right:25px;margin-top:20px;">
			<s:if test="%{request.user.icsFlag == 'P'}">
				<span style="float:left;">$9.99 will be added to your monthly bill.</span> <br/>
			</s:if>
			
			<div>
				<s:set id="providerId" name="providerId" value="%{provisioningResponse.termsAndConditionsVO.providerId}"/>
				<s:set id="imgUrl" name="imgUrl"
		                   value="@com.vzw.is.ics.utils.props.ICSMasterProps@getActiveMasterProvider(#providerId).imgUrl" />
		    </div>
			<div class="icsinline"><img src="<%=staticContentURL%><s:property value="imgUrl"/>" /> </div>
			<div  class="icsinline" style="#margin-top: -20px;*width:405px;*padding-left:20px;">                 
				Please review the following terms and indicate your agreement below					
			</div>
			<div style="text-align:right;padding-top:5px;"><a href="javascript:printit()">Print</a></div>
			<%-- ENGLISH VERSION --%>
			<!-- mp_trans_remove_start -->
			<div style="float:left; padding-top:10px; padding-bottom: 20px;height: 200px;">			
				<textarea id="providerTermsConditions" readonly="readonly" class="fieldset"
				style="width:405px;text-align: left;font-size:12px;font-family:arial;" cols="61" rows="13">
				<s:property value="provisioningResponse.termsAndConditionsVO.description"/>	
					   	 			
				</textarea>	
				<s:hidden name="endPointRequest.endPointVO.tcId" value="%{provisioningResponse.termsAndConditionsVO.tcId}"/>
			</div>
			<div id="termsCondId" style="float:left; margin-top: 90px;padding-top:15px;padding-left:5px;">			
				<input onclick="javascript:modifyNextButton();" type="checkbox" id="agreeTermsOfServices" name="agreeTermsOfServices" value="true"/>
					I have read and agree to Verizon's Terms and Conditions.
			</div>
				
		</div>
		
		 <div id="rightDiv" style="float:right;margin-right:10px;width:200px;padding-right:10px;">	
			<div id="helpDiv" class="icsinline" 
						style="margin-top:13px;vertical-align:top;width:200px;height:370px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">
					<div style="text-align: left;text-indent: 10px; padding-top: 10px; font-size: 15px;">
						<strong>Do you know?</strong>				
					</div>
					<div style="margin:10px; text-align: left ;word-wrap:break-word;">
					<strong>Sync</strong>
					<br/>
					Syncing your data, like emails and contacts means that the information will be shared between both services.
					Updates or changes on one side will happen on the other side too.
					
					</div>
					<div style="margin:10px; text-align: left ;word-wrap:break-word;">
					
					Syncing happens automatically when you sign in and whenever you press the "Sync" button on the top right of each screen.
					
	                 </div>
	        </div>	
	             
	        			 
				<div id="buttonsBlock" class="icsinline" style="padding-top: 10px; margin-right:-30px;*margin-right:-40px;">			
					<div class="icsinline" style="margin-left:10px;margin-top:5px;margin-bottom:-2px;#margin-top:-5px;padding-bottom:5px;">
							<a href="javascript:onCancel();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
					</div>
					<div class="icsinline" style="margin-top: 1px;margin-right:10px">
							<a href="javascript:submitBack();" class="button" id="backButton"><span class="interface"><span><span>&nbsp;&nbsp;Back</span></span></span></a>
					</div>
					<div class="icsinline">				
							<s:a href="javascript:submitNext();" 
									cssClass="button" id="nextButton">
								<span class="red"><span><span>Finish</span></span></span>
							</s:a>							
					</div>
			</div>
		</div>
	</div>
</div>	
</s:form>
</div>

<script type="text/javascript">
function onPageLoad(){
	if(parent.ics && parent.ics.app && parent.ics.app.listener){
		parent.ics.app.listener.setDialogStyle({
			height: '450',
			width: '700'
		});	
		parent.ics.app.listener.setIframeStyle({
			height: '450',
			width: '700'
		});
	}else{
		document.getElementById('layer_holder').style.width="700px";
		document.getElementById('layer_holder').style.height="450px";
	}
	changeTitle();
	modifyNextButton();
}

function changeTitle() {
var desc =  '<s:property value="provisioningResponse.termsAndConditionsVO.description"/>';
var firstTimeUser =  '<s:property value="icsSessionVO.userVO.firstTimeUser"/>';

	var icsStatusId = '<s:property value="icsSessionVO.userVO.statusId"/>';
	var activeStatus = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ACTIVE"/>';
	if(firstTimeUser){
		if(parent.Lib) {
		//	parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Step 3 Of 3 : Terms and Conditions');
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Terms and Conditions');
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			//parent.ics.app.listener.setSyncDialogTitle('Step 3 Of 3 : Terms and Conditions',true);
			parent.ics.app.listener.setSyncDialogTitle('Terms and Conditions',true);
		}
		
	}else{
		if(parent.Lib) {
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Manage Sync Points: Terms and Conditions');
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points: Terms and Conditions',true);
		}
	
	}
		
}
	

function cancel(url) {
	window.parent.location.href='<s:url value="'+url+' " includeParams="post"/>';
}

	
function modifyNextButton() {
	if(document.getElementById("agreeTermsOfServices").checked == true) {
		document.getElementById("nextButton").className="button";
	}
	else { 
		document.getElementById("nextButton").className="button disabled";
	}

}
	function submitNext() {
		if(document.getElementById("agreeTermsOfServices").checked == true) {
				document.forms[0].action ='<s:url value="/provisioning/addEndPoint.action"/>';
				document.forms[0].submit();
				document.getElementById("container").className="processing";
				
		}else return;
	}	
function print_it(){  
/*	if(window.print){
		window.print();
	}
	*/
/*	var termsNConditions = '<s:property value="provisioningResponse.termsAndConditionsVO.description"/>';
	alert("text"+termsNConditions);
	var url= '<a href=/provisioning/printTermsAndConditions.action?'					
					+'endPointRequest.termsAndConditionsDesc='+termsNConditions;
	alert(url);
	document.forms[0].action=url;
	document.forms[0].submit();
	*/
	
	
	
}
 function printit() {
     var s = document.getElementById("providerTermsConditions").value;
     var regExp=/\n/gi;
     s = s.replace(regExp,'<br>');
     pWin = window.open('','pWin','location=yes, menubar=yes, toolbar=yes');
     pWin.document.open();
     pWin.document.write('<html><head></head><body>');
     pWin.document.write(s);
     pWin.document.write('</body></html>');
     pWin.print();
     pWin.document.close();
     pWin.close();
 }
function onCancel() {
		document.forms[0].action ='<s:url value="/provisioning/cancelEndPointWizard.action"/>';
		document.forms[0].submit();
		if(document.getElementById("container")) {
		document.getElementById("container").className="processing";			
	}
}

function submitBack() {
		var url = '<s:url value="/provisioning/showEndPointSynchronizationWizard.action">' +
					'<s:param name="endPointRequest.endPointVO.endPointId" value="icsSessionVO.endPointRequest.endPointVO.endPointId" />' +
					'<s:param name="endPointRequest.endPointVO.endPointName" value="icsSessionVO.endPointRequest.endPointVO.endPointName" />' +
					'<s:param name="endPointRequest.endPointVO.loginUserName" value="icsSessionVO.endPointRequest.endPointVO.loginUserName" />' +
					'<s:param name="endPointRequest.endPointVO.loginPassword" value="icsSessionVO.endPointRequest.endPointVO.loginPassword" />' +
		 		  '</s:url>';
 	
		document.forms[0].action =url;
		//document.forms[0].action ='<s:url value="/provisioning/endPointSynchronizationWizard.action"/>';
		document.forms[0].submit();
		
		if(document.getElementById("container")) {
		document.getElementById("container").className="processing";
	}
}
</script>
</body>
</html>



