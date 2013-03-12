<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml; charset=UTF-8" %>
	
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%@ taglib prefix="tiles" uri="/WEB-INF/tld/tiles-jsp.tld" %>

<responseXML>
	<statusCode><s:property value="%{response.statusCode}"/></statusCode>
	<statusDesc><s:property value="%{response.statusDesc}"/></statusDesc>
</responseXML>
