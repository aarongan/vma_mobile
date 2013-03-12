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
	
	<div id="bodyDiv" class="bodyDiv" >
	<div id="contentDiv" style="padding:20px 15px 5px;#padding:15px 0px 0px 10px;width:300px;text-align:left;">
		<span>
		<s:if test="response.lastEndpoint ==  true">
			This is the last Email sync point configured with Sync & Connect. <br>Deleting this sync point will result in removal of all emails, preference settings, and you will be required to add a new sync point before continuing to use Sync & Connect.
		</s:if>
		<s:else>
			If you remove this sync point all of its emails will be removed from Sync & Connect
		</s:else>
		</span>
	</div>
	
	<div id="buttonDiv" style="padding-top: 15px; text-align: left; float: right; margin-right: 10px;#margin-right: 0px;">
		<span style="padding-right:10px;float:left">
			<a href="javascript:cancel();" id="cancelButton">
            Cancel
        	</a>
        </span>
        <span>
        	<a href="javascript:submitOk();" 	class="button" id="OkButton">
            <span class="red"><span><span>&nbsp;Ok&nbsp;</span></span></span>
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
				height: '160',
				width: '330'
			});	
			parent.ics.app.listener.setIframeStyle({
				height: '160',
				width: '330'
			});
		}else{
			document.getElementById('layer_holder').style.width="330px";
			document.getElementById('layer_holder').style.height="160px";
		}
    }
    var isLastEndPt='<s:property value="response.lastEndpoint"/>';
    if(isLastEndPt =='false'){   
    	document.getElementById('buttonDiv').style.paddingTop="45px";
    }
	if(parent.Lib) {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Remove Sync Point');
	}
	else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Remove Sync Point',true);
	}
}

function cancel() {
	document.forms[0].action = '<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}


function submitOk() {
	var isLastEndPt='<s:property value="response.lastEndpoint"/>';
	
    if(isLastEndPt == 'true'){  
    	document.forms[0].action = '<s:url value="/provisioning/deleteEndPoint.action"/>';
		document.forms[0].submit();
	}else{
		document.forms[0].action = '<s:url value="/provisioning/deleteEndPoint.action"/>';
		document.forms[0].submit();
		document.getElementById("container").className="processing";
	}
}
</script>
