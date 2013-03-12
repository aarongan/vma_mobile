<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="mailQuotaUsage" value="${response.mailQuotaUsage}" />
	
</json:object>