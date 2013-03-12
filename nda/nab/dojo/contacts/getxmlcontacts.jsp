<%@page contentType="text/xml;charset=ISO-8859-1"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%
//response.setHeader("Pragma", "no-cache");
//response.setHeader("Cache-Control", "no-cache");
//response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control","must-revalidate,max-age=0");
response.setHeader("Pragma","private");
%>
<s:property value="%{xmlResponse}" escape="false"/>
