<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<textarea>
	<json:object>
		<json:property name="attachPath" value="${response.attachmentServerLocalRef}" />
		<json:property name="attachName" value="${response.attachmentName}" />
		<json:property name="attachmentSize" value="${response.attachmentSize}" />
		<json:property name="totalAttachmentSize" value="${totalAttachmentSize}" />
						
		<json:property name="statusCode" value="${response.statusCode}" />
		<json:property name="statusDesc" value="${response.statusDesc}" />
		<json:property name="title" value="${response.title}" />
		
	</json:object>
</textarea>
