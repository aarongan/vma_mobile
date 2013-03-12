<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
	  <json:property name="statusCode" value="${profileResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${profileResponse.statusDesc}"/>
	  <json:property name="title" value="${profileResponse.title}"/>
</json:object>

