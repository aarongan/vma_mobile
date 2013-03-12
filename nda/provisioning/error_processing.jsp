<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>

<html>
<head>
<title>Sorry.</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
</head>
<body class="pl" onload="changeTitle();setAmTimer();">
<div id="layer_holder">

<s:form action="router.action">
<div id="container">
	
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
	
	<div id="bodyDiv" class="bodyDiv">
	<div style="padding-top:20px;">
		<span style="text-align: left;">
			<strong style="font-color:red:word-wrap:break;">We're unable to process your request at this time. <br> Please give it another try later.</strong>
		</span>
	</div>
	
	<div style="padding-top: 25px;margin-left:130px">	
        <a href="javascript:submitContinue();" style="float:left" 
        		class="button" id="continueButton">
            <span class="red"><span><span>Continue</span></span></span>
        </a>
	</div>
	</div>
</div>
</s:form>

</div>
</body>
</html>

<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>

<script type="text/javascript">
function changeTitle() {
	if (navigator.userAgent.indexOf('MSIE') !=-1){
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setDialogStyle({
				height: '140',
				width: '320'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '140',
				width: '320'
			});
		}else{
			document.getElementById('layer_holder').style.width="320px";
			document.getElementById('layer_holder').style.height="140px";
		}
	}else{
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setDialogStyle({
				height: '130',
				width: '310'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '130',
				width: '310'
			});
		}else{
			document.getElementById('layer_holder').style.width="310px";
			document.getElementById('layer_holder').style.height="130px";
		}
    }
	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Sorry');
	}
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Sorry',true);
	}
}

function submitContinue() {
	var status = '<s:property value="icsSessionVO.userVO.statusId" />';
	var active = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ACTIVE" />';
	
	/** This check is helpful to reroute the error page to 
	 * connection wizard when error happens from inbox adding a connection wizard
	 */
	if(status == active) {
		document.forms[0].action = '<s:url value="/provisioning/connectionWizard.action"/>';
	}
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}
</script>
