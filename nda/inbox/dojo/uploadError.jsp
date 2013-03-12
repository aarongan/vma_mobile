<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<textarea>


	<json:object>
		<json:property name="statusCode" value="${response.statusCode}" />
		<json:property name="statusDesc" value="${response.statusDesc}" />
		<json:property name="title" value="${response.title}" />
		
	</json:object>
</textarea>