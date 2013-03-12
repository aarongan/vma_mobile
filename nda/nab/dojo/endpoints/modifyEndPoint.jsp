<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
	  <json:property name="statusCode" value="${endPointResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${endPointResponse.statusDesc}"/>
	  <json:property name="title" value="${getEndPointResponse.title}"/>
 </json:object>
