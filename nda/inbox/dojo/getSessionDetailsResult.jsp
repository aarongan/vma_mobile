<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />

	<json:object name="sessionDetails">
		<json:property name="sessionId"
			value="${response.sessionId}" />
		<json:property name="userid"
			value="${response.userid}" />
		<json:property name="fmsServerPath"
			value="${response.fmsServerPath}" />
	</json:object>
</json:object>
