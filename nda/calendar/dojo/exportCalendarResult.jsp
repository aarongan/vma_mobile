<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
   
   <json:object>
   	<json:property name="statusCode" value="${exportResponse.statusCode}"/>
   	<json:property name="statusDesc" value="${exportResponse.statusDesc}"/>
   
 </json:object>