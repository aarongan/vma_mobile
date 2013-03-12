<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows"
			value="${response.totalSignCount}" />
	<json:property name="isSignatureEnabled"
			value="${response.status}" />			
	<json:array name="items" items="${response.signList}"
		var="signature">
		<json:object>
			<json:property name="title"
				value="${signature.signatureName}" escapeXml="false"/>
			<json:property name="id"
				value="${signature.signatureId}" />
			<json:property name="signature"
				value="${signature.signatureContent}" escapeXml="false" />
			<json:property name="isDefault"
				value="${signature.defaultValue}" />
		</json:object>
	</json:array>
</json:object>
