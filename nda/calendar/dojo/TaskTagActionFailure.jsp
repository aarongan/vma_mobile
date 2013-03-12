  <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
  <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
  
  <json:object>
     	<json:property name="statusCode" value="${taskTagResponse.statusCode}"/>
     	<json:property name="errorCode" value="${taskTagResponse.errorCode}"/>
	<json:property name="statusDesc" value="${taskTagResponse.statusDesc}"/>
  
 </json:object>