  <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
  <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
  
  <json:object>
     	<json:property name="statusCode" value="${eventResponse.statusCode}"/>
     	<json:property name="errorCode" value="${eventResponse.errorCode}"/>
	<json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
  
 </json:object>