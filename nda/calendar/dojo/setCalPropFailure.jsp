  <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
  <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
  
  <json:object>
  	<json:property name="statusCode" value="${cURDCalendarResponse.statusCode}"/>
  	<json:property name="statusDesc" value="${cURDCalendarResponse.statusDesc}"/>
    <json:property name="errorCode" value="${cURDCalendarResponse.errorCode}"/>
 </json:object>
