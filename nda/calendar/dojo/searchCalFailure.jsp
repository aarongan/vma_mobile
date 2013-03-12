<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${searchCalendarResponse.statusCode}"/>
	<json:property name="errorCode" value="${searchCalendarResponse.errorCode}"/>
	<json:property name="statusDesc" value="${searchCalendarResponse.statusDesc}"/>
</json:object>