<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSCodeProps"%>
<%@ include file="/nda/common/taglibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>ICS Application</title>
		 <div>
		 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
                <jsp:include page="../header.jsp" flush="true"/>
           </div>
            
    </head>
     <body class="tundra pl" >
     <div class="gb">
		<% 	
			String strMessage  = ICSCodeProps.getErrorDescription(String.valueOf(ProvisioningConstants.PROVISIONING_FAILURE),"We are currently unable to complete your request, please try again later. If you continue to get this message please contact technical support at support.vzw.com");
		%>
	<div style="height: 100%">	
     <div style="border: 2px solid rgb(82, 144, 205); font-size: 13px; text-align: center; height: 50px; padding-top: 30px; padding-bottom: 0px; margin-bottom: 100px; margin-top: 50px;">
		
		<%=strMessage %>
		
	</div>
	</div>
   </div>
        <div class="gf_outside">
            <div class="gf">
                <jsp:include page="../footer.jsp" flush="true"></jsp:include>
            </div>
        </div>

	</body>
</html>

