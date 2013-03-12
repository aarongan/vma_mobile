<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${deleteTaskResponse.statusCode}"/>
 <json:property name="statusDesc" value="${deleteTaskResponse.statusDesc}"/>
 <json:property name="operation" value="Delete"/>
 </json:object>
