<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareContactResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareContactResponse.statusDesc}"/>	 	  
	  	  <json:array name="contacts" items="${shareContactResponse.contacts}" var="contact">
			<json:object>
				 <json:property name="contactId" value="${contact.contactId}"/>
				 <json:property name="version" value="${contact.version}"/>
		    </json:object>
	     </json:array>	  
 </json:object>

