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
	height: 210px;
	margin-bottom:10px;
	padding-bottom:0px;
	overflow:scroll;
	border:1px solid #CCCCCC
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
<body class="pl" onload="setAmTimer();">
<div id="layer_holder" style="width: 620px; height: 300px;">
<s:form method="post" theme="simple">
<div id="container">
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
	De Dupes Page.
</div>	
</s:form>
</div>

<script type="text/javascript">

function onCancel() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

function submitBack() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

function submitOk() {
	document.forms[0].action ='<s:url value="/provisioning/connectionWizard.action"/>';
	document.forms[0].submit();
	document.getElementById("container").className="processing";
}

</script>
</body>
</html>
