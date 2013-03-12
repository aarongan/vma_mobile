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
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
</head>
<body class="pl" onload="changeTitle();setAmTimer();">
<div id="layer_holder" >

<s:form method="post">
<div id="container">
	
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
	
	<div id="bodyDiv" class="bodyDiv">
	<div id="contentDiv" style="padding:10px 15px 5px;#padding:5px 0px 0px 10px;width:300px;text-align:left;">
		<span>
			We are sorry to see you go. &nbsp; Sync &amp; Connect allows you to seamlessly and simply manage your email accounts in one unified mailbox with access to your AOL, Yahoo!<sup>&reg;</sup>, GoogleTM GmailTM, and Microsoft<sup>&reg;</sup> Windows Live<sup>&reg;</sup> Hotmail<sup>&reg;</sup> accounts from one location on the web.  If you no longer want to have one unified inbox please select &nbsp; "Remove" and the Sync &amp; Connect feature will be removed.  Thank you!
		</span>
	</div>
	
	<div id="buttonDiv" style="padding-top: 0px; text-align: left; float: right; margin-right: 10px;margin-top: 5px;#margin-top: 5px;#margin-right: 0px;"><!--
		<span style="padding-right:10px;float:left">
			<a href="javascript:cancel();" id="cancelButton">
            Cancel
        	</a>
        </span>
        --><span>
        	<a href="javascript:submitOk();" 	class="button" id="OkButton">
            <span class="red"><span><span>Remove<br>
	</span></span></span>
        	</a>
        </span>
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
				height: '170',
				width: '330'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '170',
				width: '330'
			});
		}else{
			document.getElementById('layer_holder').style.width="330px";
			document.getElementById('layer_holder').style.height="170px";
		}
	}else{
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			parent.ics.app.listener.setDialogStyle({
				height: '180',
				width: '330'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '180',
				width: '330'
			});
		}else{
			document.getElementById('layer_holder').style.width="330px";
			document.getElementById('layer_holder').style.height="180px";
		}
    }
    var isLastEndPt='<s:property value="response.lastEndpoint"/>';
    if(isLastEndPt =='false'){   
    	document.getElementById('buttonDiv').style.paddingTop="45px";
    }
	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Remove Sync & Connect');
	}
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Remove Sync & Connect',true);
	}
}

function cancel() {
	document.forms[0].action = '<s:url value="/provisioning/removeSyncAndConnect.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}


function submitOk() {
		document.forms[0].action = '<s:url value="/provisioning/removeSyncAndConnect.action"/>';
		document.forms[0].submit();
		document.getElementById("container").className="processing";
}
</script>
