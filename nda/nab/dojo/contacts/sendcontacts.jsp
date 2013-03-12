<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${sendContactsResponse.statusDesc}"/>
    <json:property name="statusCode" value="${sendContactsResponse.statusCode}"/>
    <json:property name="errorCode" value="${sendContactsResponse.errorCode}"/>
    <json:property name="title" value="${sendContactsResponse.title}"/>
    
    <json:array name="items" items="${sendContactsResponse.attachementReferences}" var="ref">
    	<json:property name="reference" value="${ref}"/>
    </json:array>
</json:object>
