<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>

<json:object>
 <json:property name="statusCode" value="${buddyResponse.statusCode}"/>
 <json:property name="statusDesc" value="${buddyResponse.statusDesc}"/>
 <json:property name="errorCode" value="${buddyResponse.errorCode}"/>
 <json:property name="title" value="${buddyResponse.title}"/>
 
  <json:array name="buddy" items="${buddyResponse.buddyList}" var="buddy">
 	<json:object>
	 <%-- NOT NEEDED SINCE IT IS ALWAYS SINGLE BUDDY, SEPERATE CODE/MSG WILL BE USEFUL FOR MULTIPLE --%>
	 <%--<json:property name="code" value="${buddy.statusCode}"/>
	 <json:property name="message" value="${buddy.statusDesc}"/>--%>
	 
	 <json:property name="buddyuserId" value="${buddy.buddyuserid}"/>
	 <json:property name="status" value="${buddy.status}"/>
	 <json:property name="contactId" value="${buddy.contactid}"/>
	 
 	 <c:if test="${buddy.profile != null}">
 	 	 <json:property name="contactType" value="${contact.contactType}"/>
 	 	 <json:property name="displayName" value="${contact.displayName}"/>
 	 	 <json:property name="firstName" value="${buddy.profile.firstName}"/>
		 <json:property name="lastName" value="${buddy.profile.lastName}"/>
		 <json:property name="contactId" value="${buddy.profile.contactId}"/>
		 <json:property name="version" value="${buddy.profile.version}"/>
		 <json:property name="company" value="${buddy.profile.orgName}"/>
		 <json:property name="jobTitle" value="${buddy.profile.jobTitle}"/>
		 <json:property name="photo" value="${buddy.profile.photo}"/>
		 <json:property name="createdDate" value="${buddy.profile.created}"/>
		 <json:property name="updatedDate" value="${buddy.profile.modified}"/>
		 <json:property name="defaultEmail" value="${buddy.profile.defaultEmail}"/>
		 <json:property name="defaultPhone" value="${buddy.profile.defaultPhone}"/>
		 <json:property name="inNetworkFlag" value="${buddy.profile.inNetworkFlag}"/>
		 <json:property name="connected" value="${buddy.profile.connected}"/>
		 <json:property name="buddyuserid" value="${buddy.profile.buddyassoc.buddyuserid}"/>
		 <json:property name="starred" value="${contact.favorite}"/>
	 	 <json:property name="ice" value="${contact.incaseofemergency}"/>
		 
		 <json:array name="phones" items="${buddy.profile.phones}" var="phone">
		  <json:object>
		   <json:property name="number" value="${phone.number}"/>
		   <%--<json:property name="index" value="${phone.index}"/>--%>
		   <json:property name="phoneType" value="${phone.type}"/>
		   <json:property name="carrier" value="${phone.carrier}"/>
		   <json:property name="preference" value="${phone.preference}"/>
	   	   <json:property name="userId" value="${phone.userId}"/>
		  </json:object>
		 </json:array>
		 
		 <json:array name="searchPhones" items="${buddy.profile.phones}" var="phone">
		   <json:property value="${phone.unformattedNumber}"/>
		 </json:array>		
		 
		 <json:array name="searchEmails" items="${buddy.profile.emails}" var="email">
		   <json:property value="${email.address}"/>
		 </json:array>	
		 
		 <json:array name="emails" items="${buddy.profile.emails}" var="email">
		  <json:object>
		   <json:property name="emailType" value="${email.type}"/>
		    <%--<json:property name="index" value="${email.index}"/>--%>
		   <json:property name="address" value="${email.address}"/>
		   <json:property name="preference" value="${email.preference}"/>
		  </json:object>
		 </json:array>	
		 
		 <json:array name="groups" items="${buddy.profile.groups}" var="group">
		  <json:object>
		   <json:property name="id" value="${group.id}"/>
		   <json:property name="name" value="${group.name}"/>
		   <json:property name="version" value="${group.version}"/>
		  </json:object>
		 </json:array>
		
		 <json:array name="mobileGroups" items="${buddy.profile.mobileGroups}" var="mgroup">
		  <json:object>
		   <json:property name="id" value="${mgroup.id}"/>
		   <json:property name="name" value="${mgroup.name}"/>
		   <json:property name="version" value="${mgroup.version}"/>
		  </json:object>
		 </json:array>	
	 
		 <json:array name="endPointAssoc" items="${buddy.profile.endPointAssoc}" var="contactAssoc">
		  <json:object>
			   <json:property name="id" value="${endPointAssoc.endPointId}"/>
			   <%--<json:property name="type" value="${endPointAssoc.endpointtype}"/>--%>
			   <json:property name="name" value="${endPointAssoc.endPointName}"/>
			   <json:property name="state" value="${endPointAssoc.state}"/>
			   <json:property name="picUrl" value="${endpoint.imgUrl}"/>
		  </json:object>
		 </json:array>
 	 </c:if> 	
 	
 	</json:object>
 </json:array>
</json:object>