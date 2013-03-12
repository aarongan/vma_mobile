<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<s:property value="jsonString" escape="false"/>
<%--
<json:object> 
	<json:property name="statusCode" value="${contactResponse.statusCode}"/>
	<json:property name="statusDesc" value="${contactResponse.statusDesc}"/>
	<json:property name="errorCode" value="${contactResponse.errorCode}"/>
	<json:property name="title" value="${contactResponse.title}"/>
	
	<json:array name="contacts" items="${contactResponse.contacts}" var="contact">
		<json:object>
			 <json:property name="contactId" value="${contact.contactId}"/>
	  		 <json:property name="statusCode" value="${contact.statusCode}"/>
			 <json:property name="statusMessage" value="${contact.statusDesc}"/>
		</json:object>
	</json:array>
</json:object>--%>