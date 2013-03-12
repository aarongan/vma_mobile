<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
    <json:property name="statusCode" value="${eventResponse.statusCode}"/>
    <json:property name="operation" value="${eventResponse.operation}"/>
</json:object>    
