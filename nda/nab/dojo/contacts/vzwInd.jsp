<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${vzwResponse.statusCode}"/>
	<json:property name="statusDesc" value="${vzwResponse.statusDesc}"/>
	<json:property name="carrier" value="${vzwResponse.carrier}"/>
	<json:property name="title" value="${vzwResponse.title}"/>
</json:object>