<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
    language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="/nda/common/metrics_page.jsp" %>

<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.common.ICSConstants"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
<script type="text/javascript">			
	//pageName = '<s:property value="@com.vzw.is.ics.utils.props.ICSHBXProps@getPageNameRole('set up additional accounts','MS')"/>';
	var pageMLC = 'sync and connect wizard',
		acctNo=HBX_ACNumber||'<s:property value="icsSessionVO.userVO.accountNumber"/>',
		mdn=HBX_MDN||'<s:property value="icsSessionVO.userVO.mdn"/>';
	
	function logHBXPageView(pageName,lid) {	
			_hbSet('c2', acctNo ); //Account No
			_hbSet('hc2', acctNo ); //Account No
			_hbSet('cv.c5', mdn ); // MTN
			_hbSet('lid',lid ? lid.toLowerCase() : '');  //  Link Id
			_hbPageView(_hbxStrip(pageName), _hbxStrip(pageMLC));
	}
	
	/* javascript function to call HBX linkclick */
	function logHBXLinkClick(linkText) {		
			_hbLinkClick(linkText, '');		
	}
</script>
</head>
<body>

</body>
</html>