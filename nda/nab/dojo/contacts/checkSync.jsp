<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${response.statusCode}"/>
	  <json:property name="statusDesc" value="${response.statusDesc}"/>
	  <json:property name="syncStatus" value="${sessionVO.syncStatusVO.syncStatus}"/>
	  <json:property name="title" value="${response.title}"/>
</json:object>