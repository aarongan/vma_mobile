
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
  <json:property name="statusCode" value="${pcResponse.statusCode}"/>
  <json:property name="statusDesc" value="${pcResponse.statusDesc}"/>

  <%--<json:array name="users" items="${pcResponse.usersList}" var="pResponse">
 	<json:object>
	 <json:property name="mdn" value="${pResponse.user.mdn}"/>
	 <json:property name="userId" value="${pResponse.user.userId}"/>
 	</json:object>
 </json:array>
 
  <json:array name="contacts" items="${pcResponse.contactIdList}" var="contactId">
   <json:object>
  	<json:property name="contactId" value="${contactId}"/>
   </json:object>
 </json:array>--%>
 
 
 <json:array name="users" items="${pcResponse.buddyInfo}" var="buddyInfo">
 	<json:object>
	 	<json:property name="mdn" value="${buddyInfo.mdn}"/>
	 	<json:property name="userId" value="${buddyInfo.userId}"/>
	 	<json:property name="status" value="${buddyInfo.buddyStatus}"/>
	 	<json:array name="contacts" items="${buddyInfo.buddyContactInfo}" var="buddyContactInfo">
	 		<json:object>
		 		<json:property name="contactId" value="${buddyContactInfo.contactId}"/>
		 		<%--<json:property name="status" value="${buddyContactInfo.buddyStatus}"/>--%>
	 		</json:object>
	 	</json:array>
 	</json:object>	
 </json:array>
</json:object>
