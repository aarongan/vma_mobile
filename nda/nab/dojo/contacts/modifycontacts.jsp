<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${responses.statusCode}"/>
	<json:property name="statusDesc" value="${responses.statusDesc}"/>
	<json:property name="title" value="${responses.title}"/>
	<json:array name="responses" items="${responses.response}" var="response">
		<json:object>
			 <json:property name="code" value="${response.statusCode}"/>
			 <json:property name="message" value="${response.statusDesc}"/>
			 <json:array name="contact" items="${response.contacts}" var="contact">
				 
				 <json:property name="firstName" value="${contact.firstName}"/>
				 <json:property name="lastName" value="${contact.lastName}"/>
				 <json:property name="contactId" value="${contact.contactId}"/>
				 <json:property name="version" value="${contact.version}"/>
				 <json:property name="company" value="${contact.orgName}"/>
				 <json:property name="jobTitle" value="${contact.jobTitle}"/>
				 <json:property name="photo" value="${contact.photo}"/>
				 <json:property name="createdDate" value="${contact.created}"/>
				 <json:property name="updatedDate" value="${contact.modified}"/>
				 <json:property name="defaultEmail" value="${contact.defaultEmail}"/>
				 <json:property name="defaultPhone" value="${contact.defaultPhone}"/>
				 <json:property name="inNetworkFlag" value="${contact.inNetworkFlag}"/>
				 <json:property name="connected" value="${contact.connected}"/>
				 <json:property name="buddyuserid" value="${contact.buddyassoc.buddyuserid}"/>
				 
				 <json:array name="phones" items="${contact.phones}" var="phone">
				  <json:object>
				   <json:property name="number" value="${phone.number}"/>
				   <json:property name="phoneType" value="${phone.type}"/>
				   <json:property name="carrier" value="${phone.carrier}"/>
				   <json:property name="preference" value="${phone.preference}"/>
				  </json:object>
				 </json:array>
				 
				 <json:array name="searchPhones" items="${contact.phones}" var="phone">
				   <json:property value="${phone.unformattedNumber}"/>
				 </json:array>		
				 
				 <json:array name="searchEmails" items="${contact.emails}" var="email">
				   <json:property value="${email.address}"/>
				 </json:array>	
				 
				 <json:array name="emails" items="${contact.emails}" var="email">
				  <json:object>
				   <json:property name="emailType" value="${email.type}"/>
				    <!--<json:property name="index" value="${email.index}"/>-->
				   <json:property name="address" value="${email.address}"/>
				   <json:property name="preference" value="${email.preference}"/>
				  </json:object>
				 </json:array>	
				 
				 <json:array name="groups" items="${contact.groups}" var="group">
				  <json:object>
				   <json:property name="id" value="${group.id}"/>
				   <json:property name="name" value="${group.name}"/>
				   <json:property name="version" value="${group.version}"/>
				  </json:object>
				 </json:array>
				
				 <json:array name="mobileGroups" items="${contact.mobileGroups}" var="mgroup">
				  <json:object>
				   <json:property name="id" value="${mgroup.id}"/>
				   <json:property name="name" value="${mgroup.name}"/>
				   <json:property name="version" value="${mgroup.version}"/>
				  </json:object>
				 </json:array>	
			 
				 <json:array name="endPointAssoc" items="${contact.endPointAssoc}" var="contactAssoc">
				  <json:object>
				   <json:property name="id" value="${contactAssoc.endpointid}"/>
				   <json:property name="name" value="${contactAssoc.endpointtype}"/>
				  </json:object>
				 </json:array>
				 
				 
			 </json:array>
		</json:object>
	</json:array>
</json:object>
