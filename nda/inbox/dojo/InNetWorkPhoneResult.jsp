<%@ page contentType="application/json; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:array name="items" items="${response.phoneDetails}" var="phone">
		<json:object>
			<json:property name="${phone.phoneNumber}" value="${phone.inNetwork}" />
		</json:object>
	</json:array>
</json:object>