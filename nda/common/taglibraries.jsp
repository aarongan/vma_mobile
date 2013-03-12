<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%@ taglib prefix="tiles" uri="/WEB-INF/tld/tiles-jsp.tld" %>


<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>

<%! 
	String staticContentURL = ICSProps.getProperty(ICSConstants.EXT_PROPS_STATIC_CONTENT_URL) ; 			 	
%>

<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>/styles/css/vzw/layout.css" />
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>/styles/css/vzw/layout_ie6.css" />
<![endif]-->


<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("X-UA-Compatible", "IE=7");
response.setDateHeader("Expires", 0);

%>


