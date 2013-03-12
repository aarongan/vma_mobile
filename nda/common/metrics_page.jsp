<%@ include file="/nda/common/headerlibraries.jsp" %>

<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSExtProps"%>
<%@page import="com.vzw.is.ics.common.NABConstants"%>

<!--  Not sure on implementation in  struts2 but we can use interceptor defined ...... 
http://struts.apache.org/2.x/struts2-core/apidocs/org/apache/struts2/interceptor/CookieInterceptor.html
-->
<!--   bean:cookie id="spanishcookie" name="mptrans" value=""  -->
	
<script type="text/javascript">
	var hc2 = 'none', c5 = 'none',
	isSpanishMode = '<s:property value="sessionVO.spanishEnabled"/>',
	isCsr = '<s:property value="icsSessionVO.userVO.csr"/>',
	isMS = false, isPP = false,
	sessionId = '<s:property value="icsSessionVO.userVO.sessionId"/>',
	role = '<s:property value="icsSessionVO.userVO.role"/>';
	if(role == "mobilesecure"){
		isMS = true;
			}
	if(role == "prepay"){
		isPP = true;
		}
	if(sessionId) {
		hc2 = '<s:property value="icsSessionVO.userVO.accountNumber"/>';
		c5 = '<s:property value="icsSessionVO.userVO.mdn"/>';
	}
	
	isSpanishMode = (isSpanishMode == 'true') ? true :  false;
	isCsr = (isCsr == 'true') ? true :  false;

	var _hbEC=0,_hbE=new Array;function _hbEvent(a,b){b=_hbE[_hbEC++]=new Object();b._N=a;b._C=0;return b;}
	var hbx=_hbEvent("pv");
	hbx.vpc="HBX0200u";
	hbx.gn="<%=ICSExtProps.getProperty("HBX_SERVER","ehg-verizon.hitbox.com")%>";//HBX Server
	//CONFIGURATION VARIABLES
	if(isSpanishMode){
		hbx.acct="<%=ICSExtProps.getProperty("HBX_ACCOUNT_ID_SPANISH","DM570203L6VD;DM57013148FM")%>";
		//HBX Account ID(s)
	}else{
		hbx.acct="<%=ICSExtProps.getProperty("HBX_ACCOUNT_ID","DM57013190MF96EN3")%>";//HBX Account ID(s)
	}
	
	
	hbx.lc="y";
	hbx.ctdef="full";//DEFAULT CONTENT CATEGORY

	//To check if the variable has value, if not assign blank value to avoid javascript error.
	if(window.pageName === undefined){
		pageName = "";
	}
	if(window.pageMLC === undefined){
		pageMLC = "";
	}
	
	if(isMS) {
		pageMLC = "/nah" + pageMLC;
	}
	
	if(isPP) {
		pageMLC = "/prepay" + pageMLC;
	}
	
	if(isSpanishMode){
		pageMLC = "/espanol" + pageMLC;
	}
	//Append /opal if the page is being accessed by Customer Rep/From Opal
	if(isCsr){
		pageMLC = "/opal" + pageMLC;
	}
	hbx.pn=_hbxStrip(pageName);//PAGE NAME(S)
	/* Define content group: Content Groups are used to create a hierarchal structure of content on the website. Content groups usually follow the website?s main navigation and can consist of multiple levels (up to 8 levels deep). (refer to implementation guide for complete details). */
	hbx.mlc=_hbxStrip(pageMLC);//MULTI-LEVEL CONTENT CATEGORY
	
	hbx.seg="1,2";//VISITOR SEGMENTATION
	//hbx.fnl="";//FUNNELS

	// LINK
	hbx.lt = "auto";
	hbx.dlf = "!.do";
	
	/*
	Custom Variables : Custom metrics will allow us to analyze traffic in ways not easily tracked through
	default HBX tracking. Please note that custom metrics 3 and 4 will not be used. My Account will use 
	Custom Metrics to pass the customer account number and mtn (if applicable):
	*/
	//hbx.hc2='<s:property value="userInfo.AccountId"/>';//Account Number
	//Store Account Number in Global Variable ACNumber for HBX logging//
	HBX_ACNumber = hbx.hc2 = hc2;
	//MTN: Custom Metric 5 : The MTN should be passed into this ariable using the following nomenclature
	var cv = _hbEvent("cv");
	//cv.c5 = '<s:property value="userInfo.Mtn"/>';
	//Store Mdn in Global Variable MDN for HBX logging//
	HBX_MDN = cv.c5 = c5;
	//Send csr userid in custom metric 19  for all the pages being accesesed from opal
	if(isCsr){
		cv.c19 = '<s:property value="icsSessionVO.userVO.csrUserName"/>';
		//cv.c19 = c19;
	}
	
	//Error Msg: Custom Metric 6 : The Error Message should be passed into this ariable using the following nomenclature
	//To check if the variable has value, if not assign blank value to avoid javascript error.
	if(window.hbxErrorMsg === undefined){
		//dont pass errr msg
	}else{
		cv.c6 = hbxErrorMsg;
	}
	function _hbLinkClick(lid,position){ 
		var linkID = _hbxStrip(lid);
		_hbLink(linkID.toLowerCase(),position);
	}
	function _hbLinkClick(lid){ 
		var linkID = _hbxStrip(lid);
		_hbLink(linkID.toLowerCase(),'');
	}
	function _hbxStrip(a){ 
		a = a.split("|").join("");
		a = a.split("&").join(""); 
		a = a.split("'").join(""); 
		//a = a.split("#").join(""); 
		a = a.split("$").join(""); 
		a = a.split("%").join(""); 
		a = a.split("^").join(""); 
		a = a.split("*").join(""); 
		a = a.split(":").join(""); 
		a = a.split("!").join(""); 
		a = a.split("<").join(""); 
		a = a.split(">").join(""); 
		a = a.split("~").join(""); 
		a = a.split(";").join(""); 
		a = a.split("®").join(""); 
		a = a.split("?").join(""); 
		a = a.split(" ").join("+"); 
		return a; 
	}
	
	function  _vzwHbPageView(pn, pmlc){

		if(isMS) {
			pmlc = "/nah" + pmlc;
		}
		
		if(isPP) {
			pmlc = "/prepay" + pmlc;
		}
		
		if(isSpanishMode){
			pmlc = "/espanol" + pmlc;
		}
		//Append /opal if the page is being accessed by Customer Rep/From Opal
		if(isCsr){
			pmlc = "/opal" + pmlc;
		}
		_hbPageView(pn,pmlc);
	}
</script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/release/hbx/hbx_duplicate_request.js"></script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/release/hbx/hbx.js"></script>
