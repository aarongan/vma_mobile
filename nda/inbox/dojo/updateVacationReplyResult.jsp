<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>


	<json:object>
			<json:property name="id"
				value="${response.vacationReplyList[0].vacationReplyId}" />
			<json:property name="content"
				value="${response.vacationReplyList[0].content}"  escapeXml="false" />
			<json:property name="subject"
				value="${response.vacationReplyList[0].subject}" escapeXml="false"  />
			<json:property name="startDate"
				value="${response.vacationReplyList[0].startTime}" />
			<json:property name="endDate"
				value="${response.vacationReplyList[0].endTime}" />
			<json:property name="hoursBetweenReplies"
				value="${response.vacationReplyList[0].hoursBetweenReply}" />
		<json:property name="statusCode" value="${response.statusCode}" />
		<json:property name="statusDesc" value="${response.statusDesc}" />
		<json:property name="vacationReply" value="${response.status}" />
	</json:object>
