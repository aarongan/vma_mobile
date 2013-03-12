<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
  <json:property name="statusCode" value="${syncResponse.statusCode}"/>
  <json:property name="statusDesc" value="${syncResponse.statusDesc}"/>
  <json:property name="errorCode" value="${syncResponse.errorCode}"/>
  <json:property name="title" value="${syncResponse.title}"/>
 </json:object>