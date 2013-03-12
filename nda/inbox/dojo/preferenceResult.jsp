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
</json:object>
