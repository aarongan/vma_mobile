<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareContactResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareContactResponse.statusDesc}"/>	 	
	  
	  
	 <json:property name="contactId" value="${shareContactResponse.contactDetails.contactId}"/>
	 <json:property name="createdDate" value="${shareContactResponse.contactDetails.created}"/>
	 <json:property name="updatedDate" value="${shareContactResponse.contactDetails.modified}"/>
	 <json:property name="firstName" value="${shareContactResponse.contactDetails.firstName}"/>
	 <json:property name="lastName" value="${shareContactResponse.contactDetails.lastName}"/>
	 <json:property name="photo" value="${shareContactResponse.contactDetails.photo}"/>
	 <!--<json:property name="prefModeOfComm" value="${shareContactResponse.contactDetails.prefModeOfComm}"/>-->
	 <json:property name="orgName" value="${shareContactResponse.contactDetails.orgName}"/>
	 <json:property name="jobTitle" value="${shareContactResponse.contactDetails.jobTitle}"/>
	 <json:property name="inNetworkFlag" value="${shareContactResponse.contactDetails.inNetworkFlag}"/>
	 <json:property name="source" value="${shareContactResponse.contactDetails.source}"/>
	 <json:property name="buddyuserid" value="${shareContactResponse.contactDetails.buddyassoc.buddyuserid}"/>
	 <json:property name="connected" value="${shareContactResponse.contactDetails.connected}"/>
	 <!--<json:property name="version" value="${shareContactResponse.contactDetails.version}"/>-->
	 
	 <json:property name="middleName" value="${shareContactResponse.contactDetails.middleName}"/>
	 <json:property name="nickName" value="${shareContactResponse.contactDetails.nickName}"/>
	 <json:property name="relationship" value="${shareContactResponse.contactDetails.relationship}"/>
	 <json:property name="gender" value="${shareContactResponse.contactDetails.gender}"/>
	 <json:property name="orgUnit" value="${shareContactResponse.contactDetails.orgUnit}"/>
	 <json:property name="namePrefix" value="${shareContactResponse.contactDetails.namePrefix}"/>
	 <json:property name="nameSuffix" value="${shareContactResponse.contactDetails.nameSuffix}"/>
	 <json:property name="anniversary" value="${shareContactResponse.contactDetails.anniversary}"/>
	 <json:property name="spouse" value="${shareContactResponse.contactDetails.spouse}"/>
	 <json:property name="children" value="${shareContactResponse.contactDetails.children}"/>
	 <json:property name="note" value="${shareContactResponse.contactDetails.note}"/>
	 <json:property name="profession" value="${shareContactResponse.contactDetails.profession}"/>
	 <json:property name="assistant" value="${shareContactResponse.contactDetails.assistant}"/>
	 <json:property name="maritalStatus" value="${shareContactResponse.contactDetails.maritalStatus}"/>
	 <json:property name="timeZone" value="${shareContactResponse.contactDetails.timeZone}"/>
	 <json:property name="birthday" value="${shareContactResponse.contactDetails.birthday}"/>
	 <json:property name="starred" value="${shareContactResponse.contactDetails.favorite}"/>
 	 <json:property name="ice" value="${shareContactResponse.contactDetails.incaseofemergency}"/>
	 <json:property name="ics" value="${shareContactResponse.contactDetails.ics}"/>
	 <json:property name="userId" value="${shareContactResponse.contactDetails.userId}"/>
 	 <json:property name="inNetworkFlag" value="${cdResponse.contact.inNetworkFlag}"/>
 	 <json:property name="connected" value="${cdResponse.contact.connected}"/>

	 
	 <json:array name="groups" items="${shareContactResponse.contactDetails.groups}" var="group">
	  <json:object>
	   <json:property name="id" value="${group.id}"/>
	   <json:property name="name" value="${group.name}"/>
	   <!--<json:property name="version" value="${group.version}"/>-->
	  </json:object>
	 </json:array>
	
	 <json:array name="mobileGroups" items="${shareContactResponse.contactDetails.mobileGroups}" var="mgroup">
	  <json:object>
	   <json:property name="id" value="${mgroup.id}"/>
	   <json:property name="name" value="${mgroup.name}"/>
	   <!--<json:property name="version" value="${mgroup.version}"/>-->
	  </json:object>
	 </json:array>
	 
	 <json:array name="phones" items="${shareContactResponse.contactDetails.phones}" var="phone">
	  <json:object>
	   <json:property name="number" value="${phone.number}"/>
	   <json:property name="index" value="${phone.index}"/>
	   <json:property name="phoneType" value="${phone.type}"/>
	   <json:property name="carrier" value="${phone.carrier}"/>
	   <json:property name="preference" value="${phone.preference}"/>
	   <json:property name="userId" value="${phone.userId}"/>
	  </json:object>
	 </json:array>	
	 
	 <json:array name="emails" items="${shareContactResponse.contactDetails.emails}" var="email">
	  <json:object>
	   <json:property name="emailType" value="${email.type}"/>
	   <%--<json:property name="index" value="${email.index}"/>--%>
	   <json:property name="address" value="${email.address}"/>
	   <json:property name="preference" value="${email.preference}"/>
	  </json:object>
	 </json:array>	
	 
	 <json:array name="ims" items="${shareContactResponse.contactDetails.ims}" var="im">
	  <json:object>
	   <json:property name="imType" value="${im.type}"/>
	   <json:property name="address" value="${im.address}"/>
	   <json:property name="preference" value="${im.preference}"/>
	  </json:object>
	 </json:array>	
	 	 
	 <json:array name="webPages" items="${shareContactResponse.contactDetails.webpages}" var="webpage">
	  <json:object>
	   <json:property name="webPageType" value="${webpage.type}"/>
	   <%--<json:property name="index" value="${webpage.index}"/>--%>
	   <json:property name="url" value="${webpage.url}"/>
	  </json:object>
	 </json:array>	
	 
	 <json:array name="addresses" items="${shareContactResponse.contactDetails.addresses}" var="address">
	  <json:object>
	   <json:property name="addressType" value="${address.type}"/>
	   <%--<json:property name="index" value="${address.index}"/>--%>
	   <json:property name="poBox" value="${address.poBox}"/>
	   <json:property name="street" value="${address.street}"/>
	   <json:property name="apartment" value="${address.apartment}"/>
	   <json:property name="city" value="${address.city}"/>
	   <json:property name="state" value="${address.state}"/>
	   <json:property name="zipCode" value="${address.zipCode}"/>
	   <json:property name="country" value="${address.country}"/>
	   <json:property name="preference" value="${address.preference}"/>
	  </json:object>
	 </json:array>	

	 <json:array name="endPointAssoc" items="${shareContactResponse.contactDetails.endPointAssoc}" var="endPointAssoc">
	  <json:object>
	   <json:property name="id" value="${endPointAssoc.endPointId}"/>
	   <%--<json:property name="type" value="${endPointAssoc.endpointtype}"/>--%>
	   <json:property name="name" value="${endPointAssoc.endPointName}"/>
	   <json:property name="state" value="${endPointAssoc.state}"/>
	   <json:property name="picUrl" value="${endpoint.imgUrl}"/>
	  </json:object>
	 </json:array>  
 
 </json:object>

