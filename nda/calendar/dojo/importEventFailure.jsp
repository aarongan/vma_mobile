 <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
 <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
 
 <json:object>
   	<json:property name="statusCode" value="${calendarCommonResponse.statusCode}"/>
   	<json:property name="errorCode" value="${calendarCommonResponse.errorCode}"/>
	<json:property name="statusDesc" value="${calendarCommonResponse.statusDesc}"/>
</json:object>