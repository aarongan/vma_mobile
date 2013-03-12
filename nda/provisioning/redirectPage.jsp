<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ include file="../common/taglibraries.jsp" %>	
 <%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sync & Connect Application</title>

        
</head>

<body>
    
<script type="text/javascript">
//if(confirm("test")){
	var result='<s:property value="response.result"/>';
	var url="../nda/provisioning/provision_failure.jsp";
	if(result=='<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@PROVISIONING_FAILURE"/>'){
		window.parent.location.href='<s:url value="'||url||'" includeParams="get"/>';
	}else{	
		window.parent.location.href='<s:url value="/provisioning/icsOverview.action" includeParams="post"/>';
	}
//}

</script>

</body>
</html>
