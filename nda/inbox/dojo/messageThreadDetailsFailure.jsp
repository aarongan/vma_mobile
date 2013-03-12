<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${threadDetailresponse.statusCode}" />
	<json:property name="errorCode" value="${threadDetailresponse.errorCode}" />
	<json:property name="statusDesc" value="${threadDetailresponse.statusDesc}" />
</json:object>
