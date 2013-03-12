<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="identity" value="id" />
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows" value="${response.totalTagCount}" />

	<json:array name="items" items="${response.tagList}" var="tag">

		<json:object>
			<json:property name="id" value="${tag.tagId}" />
			<json:property name="name" value="${tag.tagName}" escapeXml="false" />
		</json:object>
	</json:array>

</json:object>
