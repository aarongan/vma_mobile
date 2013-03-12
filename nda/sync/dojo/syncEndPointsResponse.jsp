<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="syncEndPointResponse">

	
	<json:array  name="serviceInfo" 
		items="${endPointResponse.serviceInfoList}" var="serviceInfo">
		<json:object>
		<json:property name="jobId" value="${serviceInfo.jobId}" />
			<json:property name="endPointId" value="${serviceInfo.sourceProviderId}" />
			<json:property name="serviceId" value="${serviceInfo.serviceId}" />
			<json:property name="userEndpointId" value="${serviceInfo.userEndpointId}" />
			<json:property name="loginUserName" value="${serviceInfo.reqUserEmail}" />			
		</json:object>
	</json:array>
	
	<json:property name="statusCode" value="${endPointResponse.statusCode}" />
	<json:property name="statusDesc" value="${endPointResponse.statusDesc}" />
	
</json:object>