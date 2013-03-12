<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

	<json:object>
			<json:property name="id"
				value="${response.vacationReplyList[0].vacationReplyId}" />
			<json:property name="statusCode" value="${response.statusCode}" />
			<json:property name="statusDesc" value="${response.statusDesc}" />
			<json:property name="vacationReply" value="${response.status}" />
			<json:property name="title" value="${response.title}" />
			
	</json:object>

