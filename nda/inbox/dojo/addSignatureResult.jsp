<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

	<json:object>
			<json:property name="id"
				value="${response.signList[0].signatureId}" />
			<json:property name="signature"
				value="${response.signList[0].signatureContent}" escapeXml="false"/>
			<json:property name="statusCode" value="${response.statusCode}" />
			<json:property name="statusDesc" value="${response.statusDesc}" />
	</json:object>

