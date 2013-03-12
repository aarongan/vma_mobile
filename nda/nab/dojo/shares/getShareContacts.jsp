<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareContactResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareContactResponse.statusDesc}"/>	 	  
	  	  <json:array name="items" items="${shareContactResponse.contacts}" var="contact">
			<json:object>
				 <json:property name="contactId" value="${contact.contactId}"/>
				 <json:property name="firstName" value="${contact.firstName}"/>
				 <json:property name="lastName" value="${contact.lastName}"/>
				 <json:property name="middleName" value="${contact.middleName}"/>
				 <json:property name="company" value="${contact.orgName}"/>
	 			 <json:property name="jobTitle" value="${contact.jobTitle}"/>
				 <json:property name="email" value="${contact.defaultEmail}"/>
	 			 <json:property name="phoneNumber" value="${contact.defaultPhone}"/>				 
	 			 <json:property name="photo" value="${contact.photo}"/>
		    </json:object>
	     </json:array>	  
 </json:object>

