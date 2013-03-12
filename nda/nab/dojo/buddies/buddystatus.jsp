<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${bsResponse.statusCode}"/>
	<json:property name="statusDesc" value="${bsResponse.statusDesc}"/>
	<%--<json:property name="title" value="${bsResponse.buddy.title}"/>
	<json:property name="buddyuserId" value="${bsResponse.buddy.buddyuserid}"/>
	<json:property name="contactId" value="${bsResponse.buddy.contactid}"/>--%>
	<json:property name="status" value="${bsResponse.buddy.status}"/>

</json:object>