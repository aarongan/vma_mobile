<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${userPreferencesResponse.statusCode}"/>
	<json:property name="statusDesc" value="${userPreferencesResponse.statusDesc}"/>
 	 <!-- <json:property name="Opearation" value="Edit"/> -->	

</json:object>