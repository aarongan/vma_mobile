<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="syncEndPointResponse">

	<json:array name="syncJobStatus" 
		items="${endPointResponse.syncJobStatusArray.jobStatusList}" var="syncJobStatus">
		<json:object>
			<json:property name="jobStatusId" value="${syncJobStatus.jobStatusId}" />
			<json:property name="statusDesc" value="${syncJobStatus.status}" />
			<json:property name="statusCode" value="${syncJobStatus.statusCode}" />
		</json:object>
	</json:array>
			
	<json:property name="statusCode" value="${endPointResponse.statusCode}" />
	<json:property name="statusDesc" value="${endPointResponse.statusDesc}" />		
</json:object>