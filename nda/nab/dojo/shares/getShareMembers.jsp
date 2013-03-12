<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareMemberResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareMemberResponse.statusDesc}"/>	 	  
	  	  <json:array name="items" items="${shareMemberResponse.members}" var="member">
			<json:object>
				 <json:property name="contactId" value="${member.contactId}"/>
				 <json:property name="userId" value="${member.userId}"/>
				 <json:property name="memberShipStatus" value="${member.memberShipStatus}"/>
				 <json:property name="accessRights" value="${member.accessRights}"/>
				 <json:property name="firstName" value="${member.firstName}"/>
				 <json:property name="lastName" value="${member.lastName}"/>
				 <json:property name="company" value="${member.company}"/>
				 <json:property name="photo" value="${member.photo}"/>				 
				 <json:property name="preAccessRights" value="${member.accessRights}"/>	 
		    </json:object>
	     </json:array>	  
 </json:object>

