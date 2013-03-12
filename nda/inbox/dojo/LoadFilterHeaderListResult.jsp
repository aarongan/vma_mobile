<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows" value="${response.totalRulesCount}" />

	<json:array name="items" items="${response.filterList}" var="filter">

		<json:object>
			<json:property name="name" value="${filter.ruleHeader.name}" />
			<json:property name="order" value="${filter.ruleHeader.absOrder}" />
			<json:property name="isEnabled" value="${filter.ruleHeader.enabled}" />
			<json:property name="type" value="${filter.ruleHeader.type}" />
		</json:object>
	</json:array>

</json:object>
