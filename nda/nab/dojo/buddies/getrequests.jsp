<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%> 
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>

<%-- TODO INCLUDE jstl tld's --%>

<json:object>
 <json:property name="statusCode" value="${requestsList.statusCode}"/>
 <json:property name="statusDesc" value="${requestsList.statusDesc}"/>
 <json:property name="title" value="${requestsList.title}"/>
 
 <json:array name="items" items="${requestsList.alerts}" var="alert">
 	<json:object>
		 <json:property name="requestType" value="${alert.requestType}"/>
		 <json:property name="type">${alert.requestType}${alert.requestStatus}</json:property>
	     <json:property name="updatedDate" value="${alert.modified}"/>
		 <json:property name="createdDate" value="${alert.created}"/>
		 <json:property name="updatedTimestamp" value="${alert.modifiedTime}"/>
		 <json:property name="firstName" value="${alert.userInfo.firstName}"/>
		 <json:property name="lastName" value="${alert.userInfo.lastName}"/>
		 <json:property name="displayName" value="${alert.userInfo.displayName}"/>
		 <json:property name="city" value="${alert.userInfo.city}"/>
		 <json:property name="state" value="${alert.userInfo.state}"/>
		 
		 <json:property name="requestStatus" value="${alert.requestStatus}"/>
		 <json:property name="contactId" value="${alert.contactId}"/>
		 <json:property name="userId" value="${alert.userId}"/>
		 <%--
		 <json:property name="visibility" value="${alert.visibility}"/>
 		 <json:property name="name" value="${alert.name}"/>
		 <json:property name="accessRight" value="${alert.accessRights}"/>
 		 <json:property name="membershipStatus" value="${alert.memberShipStatus}"/>
 		 <json:property name="id" value="${alert.id}"/>--%>
 		
		 <json:array name="phones" items="${alert.userInfo.phones}" var="phone">
		  <json:object>
		   <json:property name="number" value="${phone.number}"/>
		   <json:property name="phoneType" value="${phone.type}"/>
		   <json:property name="carrier" value="${phone.carrier}"/>
		   <json:property name="preference" value="${phone.preference}"/>
		   <json:property name="userId" value="${phone.userId}"/>
		  </json:object>
		 </json:array>
		 	 
		 <json:array name="emails" items="${alert.userInfo.emails}" var="email">
		  <json:object>
		   <json:property name="emailType" value="${email.type}"/>
		   <json:property name="address" value="${email.address}"/>
		   <json:property name="preference" value="${email.preference}"/>
		  </json:object>
		 </json:array>	
	 	 
 		 <c:if test="${alert.userInfo.photo}">
	 	 	<c:if test="${alert.userInfo.contactUrl}">
	 			<json:property name="picUrl"><s:property value="@com.vzw.is.ics.common.NABCommonConstants@CONTACT_IMAGE_URL"/>cdRequest.contactId=${alert.contactId}</json:property>
	 	 	</c:if>
	 	 	<c:if test="${alert.userInfo.profileUrl}">
	 			<json:property name="picUrl"><s:property value="@com.vzw.is.ics.common.NABCommonConstants@OTHER_USER_IMAGE_URL"/>userRequest.userId=${alert.userId}</json:property>
	 	 	</c:if>
	 	 	
	 	  	<c:if test="${alert.userInfo.avatarId}">
	 			<json:property name="picUrl">${alert.userInfo.avatarURL}</json:property>
	 	 	</c:if>
	 	 </c:if>
 		
 	</json:object>
 	
 </json:array>
 
 
  
</json:object>