<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="syncEndPointResponse">
	
	
	<json:array  name="serviceInfo" 
		items="${endPointResponse.userRegisteredProviderList}" var="provider">
		<json:object>
			<json:property name="endPointName" value="${provider.providerName}" />
			<json:property name="endPointId" value="${provider.providerId}" />
		</json:object>
	</json:array>
	
	<json:property name="statusCode" value="${endPointResponse.statusCode}" />
	<json:property name="statusDesc" value="${endPointResponse.statusDesc}" />
	
</json:object>