  <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
  <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
  
  <json:object>
     	<json:property name="statusCode" value="${calendarResponse.statusCode}"/>
     	<json:property name="errorCode" value="${calendarResponse.errorCode}"/>
	<json:property name="statusDesc" value="${calendarResponse.statusDesc}"/>
  
 </json:object>