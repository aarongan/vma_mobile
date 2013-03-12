<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="status">

	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="errorCode" value="${response.errorCode}" />
	<json:property name="mailQuotaUsage" value="${response.mailQuotaUsage}" />
		
	<json:array name="pwdChanged" items="${response.passwordChangeNotificationList}"
		var="passwordChngNotificationVO">
			<json:object>
				<json:property name="feedId" value="${passwordChngNotificationVO.feedId}" />
				<json:property name="alertId" value="${passwordChngNotificationVO.alertId}" />
				<json:property name="endPointLoginName" value="${passwordChngNotificationVO.endPointLoginName}" />
				<json:property name="messageType" value="${passwordChngNotificationVO.messageType}" />
			</json:object>
		</json:array>
		
		
</json:object>
