<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />

	<json:array name="tagList" items="${response.messageList}"
		var="obj">

		<json:object>
			<json:property name="jobId"
				value="${obj.jobId}" />
		</json:object>
		<json:object>
			<json:property name="messageId"
				value="${obj.messageId}" />
		</json:object>
		<json:object>
			<json:property name="scheduledTime"
				value="${obj.scheduledTime}" />
		</json:object>
	</json:array>
</json:object>
