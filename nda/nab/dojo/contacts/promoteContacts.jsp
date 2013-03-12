<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object> 
	<json:property name="statusCode" value="${promoDemoContactResponse.statusCode}"/>
	<json:property name="statusDesc" value="${promoDemoContactResponse.statusDesc}"/>
	<json:property name="errorCode" value="${promoDemoContactResponse.errorCode}"/>
	<json:property name="title" value="${promoDemoContactResponse.title}"/>
	
	<json:array name="contacts" items="${promoDemoContactResponse.contactList}" var="contact">
		<json:object>
			 <json:property name="contactId" value="${contact.contactId}"/>
			 <json:property name="statusMessage" value="${contact.statusDesc}"/>
		</json:object>
	</json:array>
</json:object>