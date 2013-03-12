<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.vzw.is.ics.utils.constants.ICSErrorConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSCodeProps"%>
<%@ include file="/nda/common/taglibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>ICS Application</title>
		 <div>
		 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
                <jsp:include page="../nda/header.jsp" flush="true"/>
           </div>
            
    </head>
     <body class="tundra pl" >
     <div class="gb">
		<% 	
			String strMessage  = ICSCodeProps.getErrorDescription(String.valueOf(ICSErrorConstants.ICS_GEN_LOGIN_ERROR),"We're unable to process your request at this time.Please give it another try later.");
		%>
	<div style="height: 100%">	
     <div style="border: 2px solid rgb(82, 144, 205); font-size: 13px; text-align: center; height: 50px; padding-top: 30px; padding-bottom: 0px; margin-bottom: 100px; margin-top: 50px;">
		
		<%=strMessage %>
		
	</div>
	</div>
   </div>
        <div class="gf_outside">
            <div class="gf">
                <jsp:include page="../nda/footer.jsp" flush="true"></jsp:include>
            </div>
        </div>

	</body>
</html>

