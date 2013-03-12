<%@page contentType="text/xml;charset=ISO-8859-1" %>
<%@ include file="/nda/common/taglibraries.jsp" %>
<result><statusCode><s:property value="%{baAvailable}"/></statusCode><statusDesc><s:property value="%{clResponse.statusDesc}"/></statusDesc></result>