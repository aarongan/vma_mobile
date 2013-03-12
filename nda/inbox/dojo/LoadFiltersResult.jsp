<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="title" value="${response.title}" />	
	<json:property name="numRows" value="${response.totalRulesCount}" />

	<json:array name="items" items="${response.filterList}" var="filter">

		<json:object>
			<json:property name="filterId" value="${filter.filterId}" />
			<json:property name="name" value="${filter.name}" />
			<json:property name="order" value="${filter.order}" />
			<json:property name="isEnabled" value="${filter.enabled}" />
			<json:property name="isConjunction" value="${filter.conjunction}" />
            <json:property name="msgType" value="${filter.msgType}" />
			<json:array name="conditions" items="${filter.conditionList}"
				var="condition">

				<json:object>
					<json:property name="filterConditionId" value="${condition.filterConditionId}" />
					<json:property name="filterId" value="${condition.filterId}" />
					<json:property name="type" value="${condition.type}" />
					<json:property name="value" value="${condition.value}" />
					<json:property name="matchType" value="${condition.matchType}" />
			     
				</json:object>
			</json:array>

			<json:array name="actions" items="${filter.actionList}" var="action">

				<json:object>
					<json:property name="filterActionId" value="${action.filterActionId}" />
					<json:property name="filterId" value="${action.filterId}" />
					<json:property name="command" value="${action.command}" />
					<json:property name="argument" value="${action.argument}" />
				</json:object>
			</json:array>

		</json:object>
	</json:array>

</json:object>

