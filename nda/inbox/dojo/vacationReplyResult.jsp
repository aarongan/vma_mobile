<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows" value="${response.totalCount}" />
	<json:property name="vacationReply" value="${response.status}" />
	
	<json:array name="items" items="${response.vacationReplyList}"
		var="vacation">
		<json:object>
			<json:property name="title" value="${vacation.name}" />
			<json:property name="id" value="${vacation.vacationReplyId}" escapeXml="false" />
			<json:property name="subject" value="${vacation.subject}" escapeXml="false" />
			<json:property name="content" value="${vacation.content}"
				escapeXml="false" />
			<json:property name="startDate" value="${vacation.startTime}" />
			<json:property name="endDate" value="${vacation.endTime}" />
			<json:property name="hoursBetweenReplies"
				value="${vacation.hoursBetweenReply}" />
			
			<json:property name="isDefault" value="${vacation.defaultValue}" />
			<json:array name="emails" items="${vacation.emailAddressList}"	var="emailsList">
			<json:object>
				<json:property name="emailAddress" value="${emailsList.emailAddress}" />
			</json:object>
		</json:array>
		</json:object>
		
	</json:array>
</json:object>
