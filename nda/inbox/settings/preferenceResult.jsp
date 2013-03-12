<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />

	<json:array name="preferences" items="${response.preferencesList}"
		var="pref">
		<json:object>
			<json:property name="${pref.attribute.attributeCode}"
				value="${pref.attributeValue}" />
		</json:object>
	</json:array>
	<json:array name="defaultEmailList" items="${response.fromList}"
		var="fromVO">
		<json:object>
			<json:property name="fromEmail" value="${fromVO.from}" />
			<json:property name="type" value="${fromVO.provider}" />
			<json:property name="orderNum" value="${fromVO.displayOrder}" />
		</json:object>
	</json:array>
	<json:array name="endPointList" items="${response.endPointList}"
		var="endPoint">
		<json:object>
			<json:property name="sourceProvider" value="${endPoint.providerName}" />
			<json:property name="email" value="${endPoint.loginUserName}" />
			<json:property name="orderNum" value="${endPoint.orderId}" />
			
		</json:object>
	</json:array>
	<json:array name="emailSet" items="${response.emailSet}"
		var="email">
		<json:object>
			<json:property name="email" value="${email}" />
		</json:object>
	</json:array>
	<json:array name="phoneSet" items="${response.phoneSet}"
		var="phone">
		<json:object>
			<json:property name="phone" value="${phone}" />
		</json:object>
	</json:array>
	
		<json:object name="sessionDetails">
		<json:property name="sessionId"
			value="${response.sessionId}" />
		<json:property name="userid"
			value="${response.userId}" />
		<json:property name="fmsServerPath"
			value="${response.fmsServerPath}" />
	</json:object>
	
	<json:object name="info">
		<json:property name="mailQuotaUsage"
			value="${response.mailQuotaUsage}" />
	</json:object>
	
</json:object>
