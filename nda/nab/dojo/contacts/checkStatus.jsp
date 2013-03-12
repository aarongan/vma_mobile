<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>	
	
	<json:object>
		 <json:property name="statusCode" value="${statusResponse.statusCode}"/>
		 <json:property name="statusDesc" value="${statusResponse.statusDesc}"/>
		 <json:property name="errorCode" value="${statusResponse.errorCode}"/>
		 <json:property name="uniqueId" value="${statusResponse.uniqueId}"/>
		 <json:property name="bulkStatus" value="${statusResponse.bulkStatus}"/>
		 <json:property name="count" value="${statusResponse.count}"/>
		 <json:array name="contacts" items="${statusResponse.contacts}" var="contact">
			<json:object>
				 <json:property name="contactId" value="${contact.contactId}"/>
		  		 <json:property name="statusCode" value="${contact.statusCode}"/>
				 <json:property name="statusMessage" value="${contact.statusDesc}"/>
			</json:object>
		</json:array>
	</json:object>