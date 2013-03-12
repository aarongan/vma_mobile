<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.common.ICSProviderConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<html>
<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<style type="text/css">
.buttonsBlockCSS {
	display:block; 
	float:left;
	margin-top:90px;
	padding-left:280px;
	width:450px;
}

.errorButtonsBlockCSS {
	display:block; 
	float:left;
	margin-top:40px;
	padding-left:280px;
	width:450px;
}

.IE_Layer_Holder_CSS {
	margin-left: -100px;
}
.mainContentDivCSS{
	float:left;
	width:550px;
	height:270px;
	padding-bottom:0px;
	margin-left:0px;
	text-align:left;
}
.contentDivCSS{
	float:left;
	width:550px;
	height: auto;/*260px;*/
	margin-bottom:10px;
	padding-bottom:0px;
	overflow:auto;/*scroll;*/
	border:solid #CCCCCC;
	border-width:1px 0px 0px 0px;
}

.threeRowsDivCSS{
	float:left;
	margin-left:10px;
	padding-top:8px;
	padding-bottom:0px;
	padding-right:0px;
	padding-leftt:5px;	
	border-bottom:thin;
	border-bottom-color:#D8D8D8;
	border-bottom-style:dotted;
	width: 550px; 
	height: 220px;
}
.twoRowsDivCSS{
	float:left;
	margin-left:10px;
	padding-bottom:0px;
	padding-top: 10px;
	padding-right:0px;	
	border-bottom:thin;
	border-bottom-color:#D8D8D8;
	border-bottom-style:dotted;
	width: 485px; 
	height: 200px;
}
.rowDivCSS{
	float:left;
	padding-top:0px;
	padding-right:0px;
	padding-left: 0px;
	width:510px;	
}
.rowNumSpan{
	float:left;
	text-align:left;
	font-weight:bold;
	font-size:30px;
	font-family:Arial;
	color:#BDBDBD;	
	width:8px;
	height:25px;
	white-space:nowrap;
	padding-right:20px;	
	padding-top:4
}
.textSpan{
	float:left;
	text-align:left;
	white-space:nowrap;
	width:450px;
	height:12px;
	white-space:nowrap;	
	font:11px/15px arial,sans-serif;	
}
.textSpanSecondLine{
	float:left;
	padding-left:0px;
	text-align:left;
	white-space:nowrap;
	width:450px;
	height:12px;
	font:11px/15px arial,sans-serif
}
.imgSpan{
	float:left;
	text-align:left;
	padding-top:10px;
	padding-left:30px;
	padding-bottom:10px;
	white-space:nowrap;	
}
.secondImgSpan{
	float:left;
	text-align:left;
	padding-top:10px;
	padding-left:50px;
	padding-bottom:10px;
	white-space:nowrap;	
}
.contentHeaderDivCSS{
	float:left;
	margin-top:10px;
	margin-bottom:0px;
	width:550px;
	height:45px;
}
.contentHeaderLeftDivCSS{
	float:left;
	margin-right:2px;
	width:100px;
	height:35px;
	padding-top:0px;
}
.contentHeaderRightDivCSS{
	float:left;
	width:400px;
	height:35px;
	padding-top:5px;
}
.contentHeaderSpanCSS{
	float:left;
	text-align:left;
	margin-bottom:0px;
	font:11px/15px arial,sans-serif
}

 .icsinline  {
	/*  To inline block elements.
		Similar to InlineBox below, but this has fewer side-effects in Moz.
		Also, apparently works on a DIV as well as a FIELDSET.
	*/
	display:inline-block;			/* webkit and FF3 */
	border:0;
	padding:0;
	vertical-align:top;
	
	}
</style>

</head>
<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" >
<s:form method="post" theme="simple">
<div id="container">
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
		
	<s:hidden name="endPointRequest.page" value="%{@com.vzw.is.ics.common.ProvisioningConstants@ENDPOINT_CONNECTION_WIZARD}"/>
	<s:hidden name="endPointRequest.source" value="%{@com.vzw.is.ics.common.ICSConstants@PROVISION}" />
	<div id="pageHeaderDiv" style="float:left;margin-left:0px;margin-right:0px;width:65px;">
		<br/>		
		<span style="float:left;padding-left:15px;#padding-left:5px;margin-bottom:10px;">
			<!-- img style="width:40px;height:70px;" src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/black_mobile_large_icon.gif" / -->
			<img style="width:40px;height:70px;" src="<s:property value="response.phoneImagePath"/>" />		
	
		</span><br/><br/>		
	</div>	

	<div id="mainDiv" class="mainContentDivCSS">
	 <div id="contentHeaderDiv"  class="contentHeaderDivCSS">
	  <div id="contentHeaderLeftDiv" class="contentHeaderLeftDivCSS" style="width: 134px;vertical-align:top;display:inline-block;">
			<div class="contentHeaderSpanCSS" style="width: 134px;">
				<strong>Connect your cell phone</strong>				
			</div><br/>		
			<div class="contentHeaderSpanCSS" style="width: 134px">
				<s:property value="response.mdn" />
			</div>		
	  </div>
	  <div id="contentHeaderRightDiv"  class="icsinline" class="contentHeaderRightDivCSS" style="width: 410px;display:inline-block;">
	  	<div  class="contentHeaderSpanCSS" class="icsinline" style="width: 410px">
				To sync your feature phone with your contacts, please download Backup Assistant.				
		</div><br/>
		<div  class="contentHeaderSpanCSS" class="icsinline" style="width: 405px">
				You can still connect your other accounts while the download process takes place.				
		</div><br/>					
	  </div>
	  </div>
	

	
	  <div id="contentDiv" class="contentDivCSS" style="text-indent:50px;">	
	   	Click <a href="https://wbillpay.verizonwireless.com/vzw/nos/ba_nab/howtoGet_def.jsp" target="_blank" >here</a> for instructions for downloading Backup Assistant on your Phone.
		<!-- <div class="threeRowsDivCSS" id="firstStepDiv" style="padding: 8px 0px 0px 5px; height: 207px; margin-left: 0px; width: 510px;">
			  <div class="rowDivCSS">
			  	<span class="rowNumSpan">
			  		1 
			  	</span>	
			  	<span class="textSpan">
			  		Select "Get It Now" or "Media Center" from the phone's menu, then select either "Tools on the <br/>	  		
			  	</span>
			  	<span class="textSpanSecondLine">
			  		 Go" or "Browse & Download"
			  	</span>
			  </div>
			  <div class="rowDivCSS">
			  	<span class="imgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/tools_on_the_go.gif" />
			  	</span>
			  	<span class="secondImgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/browse_download.gif" />
			  	</span>
			  </div>
		  </div>
		  	
		  <div id="secondStepDiv" class="twoRowsDivCSS">	
		  	  <div class="rowDivCSS">
		  	  	<span class="rowNumSpan">
			  		2 
			  	</span>	
			  	<span class="textSpan">
			  		Select "Get New Application"	  		
			  	</span>
			  </div>
			  <div class="rowDivCSS">
			  	<span class="imgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/tools_on_the_go_menu.gif" />
			  	</span>
			  	<span class="secondImgSpan" style="border-bottom:thin;border-bottom-color:RED;">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/browse_download_menu.gif" />
			  	</span>
			  </div>
		  </div>
		  
		  <div id="thirdStepDiv" class="twoRowsDivCSS">	
		  	  <div class="rowDivCSS">
		  	  	<span class="rowNumSpan">
			  		3 
			  	</span>		
			  	<span class="textSpan">
			  		Select "Business Tools/Information"	  		
			  	</span>
			  </div>
			  <div class="rowDivCSS">
			  	<span class="imgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/tools_on_the_go_business_tools.gif" />
			  	</span>
			  	<span class="secondImgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/browse_download_business_tools.gif" />
			  	</span>
			  </div>
		  </div>
		  
		  <div id="fourthStepDiv" class="twoRowsDivCSS">	
		  	  <div class="rowDivCSS">	
			  	<span class="rowNumSpan">
			  		4
			  	</span>	
			  	<span class="textSpan">
			  		Select "Backup Assistant" and press OK.	  		
			  	</span>
			  </div>
			  <div class="rowDivCSS">
			  	<span class="imgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/tools_on_the_go_backup_assistant.gif" />
			  	</span>
			  	<span class="secondImgSpan">
			  		<img src="<%=staticContentURL%>styles/images/ics/provision/mobile_client/browse_download_backup_assistant.gif" />
			  	</span>
			  </div>
		  </div>	  
	
		  <div id="fifthStepDiv" class="twoRowsDivCSS">	
		  	  <div class="rowDivCSS">	
			  	<span class="rowNumSpan">
			  		5 
			  	</span>	
			  	<span class="textSpan">
			  		Follow the simple instructions on your phone.	  		
			  	</span>
			  </div>
		  </div> 
	  </div> -->	 	
	    	
	</div>
	  <div id="buttonsDiv" style="float:right;">
 		<!--   <span id="cancelLink" style="float:left;padding-left:10px;padding-top:0px;">
			<a href="javascript:onCancel();" class="a" style="margin-right:10px;display:inline-block;padding-top:2px;"><span>Cancel</span></a>
		</span> -->
		<!-- <span style="float:left;">
			<a href="javascript:submitBack();" class="button" id="backButton"><span class="interface"><span><span>&nbsp;&nbsp;Back</span></span></span></a>						
		</span>		-->	
		<s:set name="firstTimeUser" id="firstTimeUser" value="icsSessionVO.userVO.firstTimeUser"/>
	  	
		<span style="float:left;padding-left:10px;">
			<a id="okButton" href="javascript:submitNext();" class="button" ><span class="red"><span><span>
			<s:if test="%{#firstTimeUser == true}">Next</s:if>
			<s:else>Next</s:else>
			</span></span></span></a>						
		</span> 	
	  </div>
</div>
	
</s:form>


<script type="text/javascript">
function onPageLoad(){
//if handset provisioned redirect to connection wizard
	var handsetProvisioned = <s:property value="response.handsetProvisioned"/>;

	if(handsetProvisioned){
		document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
		document.forms[0].submit();
	}
		if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
			if (navigator.userAgent.indexOf('MSIE') !=-1){
				parent.ics.app.listener.setDialogStyle({
					height: '375',
					width: '645'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '375',
					width: '645'
				});
			}else{
				parent.ics.app.listener.setDialogStyle({
					height: '375',
					width: '635'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '375',
					width: '635'
				});
			}
		//	document.getElementById('cancelLink').style.display="inline-block";
			parent.ics.app.listener.setSyncDialogTitle('Connection Wizard',true);
		}else{
			document.getElementById('layer_holder').style.width="635px";
			document.getElementById('layer_holder').style.height="375px";
		//	document.getElementById('cancelLink').style.display="none";
			parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connection Wizard');
		}
}

function onCancel() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

function submitBack() {
	document.forms[0].action ='<s:url value="/provisioning/showCreateEmailIdConfirmation.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

function submitNext() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

</script>
</div>
</body>
</html>
