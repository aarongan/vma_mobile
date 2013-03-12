<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows" value="${response.totalTagCount}" />
	<json:property name="id"
				value="${response.tagList[0].tagId}" />
	<json:property name="name"
				value="${response.tagList[0].tagName}" escapeXml="false"  />
</json:object>
