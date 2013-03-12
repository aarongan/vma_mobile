<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${taskTagResponse.statusCode}"/>
 <json:property name="statusDesc" value="${taskTagResponse.statusDesc}"/>
  <json:property name="operation" value="Delete"/>
  </json:object>