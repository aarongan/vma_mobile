<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ include file="../common/taglibraries.jsp" %>

<html>
<head>
<title>Create your email address</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<style type="text/css">
.emailTextSpanCSS {
	text-align:left;
}
.messageBoxClassNoBorder{
vertical-align: bottom; width: 169px; 
border: none; padding: 2px; 

}
.messageBoxClassBorder{
vertical-align: bottom; width: 169px; 
border-right: 1px solid; padding: 2px; 
border-top: 1px solid; border-left: 1px solid;
}

</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder">

<s:form action="createEmailIdConfirmation.action" theme="simple">
	<div id="container" style="width:600px">
		
		<div id="processingMessageDiv" class="processingMessageDiv">
			<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
			&nbsp;&nbsp;<i>Processing ...</i>
		</div>
		
		<div id="parentDiv" class="bodyDiv" style="text-align: left; width: 590px; height: 130px; padding-top: 15px;"> 

			<div id="mainDiv" style="width: 590px;margin-left:10px">
			<div style="margin-left:5px"><b>Do you want a free Verizon Wireless Email Address?</b></div>
			<div style="height: 50px;">
				<s:radio list="#{'true':' Yes'}" name="createEmail" value="createEmail"/>, I want One.<br/><br/>
				<!-- div style="margin-left: 25px; ">A verizon Wireless Email Address provides these additional features at no extra charge:
				<br>Sync your Outlook or Thunderbird Contacts.</div -->
				
			</div>
			<div style="height: 65px;">
				<s:radio  list="#{'false':' No'}" name="createEmail" value="createEmail"  />, Thanks, I will use my existing email address.
			</div>		
			</div>
			<div id="nextButtonDiv" style="height:20px;margin-left:545px;">
			
				<span style="width:25px;padding-right;10px;">
			<a href="javascript:submitNext();" class="button" id="nextButton">
				<span class="red"><span><span>Next</span></span></span>
			</a>
				</span>&nbsp;&nbsp;
				
		</div>	
		
	</div>
	</div>
</s:form>

</div>

<script type="text/javascript">

function onPageLoad(){
	if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
		parent.ics.app.listener.setDialogStyle({
			height: '190',
			width: '610'
		});	
		parent.ics.app.listener.setIframeStyle({
			height: '190',
			width: '610'
		});
	}else{
		document.getElementById('layer_holder').style.width="610px";
		document.getElementById('layer_holder').style.height="190px";
	}
	changeTitle();
}
function changeTitle() {
		if(parent.Lib) {
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Want more Cool Features?');
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Want more Cool Features?',true);
		}
	}
 

function submitNext() {

	document.forms[0].action ='<s:url value="/provisioning/createEmailIdConfirmation.action"/>';
	document.forms[0].submit();
	
}


</script>


</body>
</html>



