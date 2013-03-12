<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareResponse.statusDesc}"/>
	  <json:array name="items" items="${shareResponse.shares}" var="share">
			<json:object>
				 <json:property name="accessRight" value="${share.accessRight}"/>
				 <json:property name="membershipStatus" value="${share.membershipStatus}"/>
				 <json:property name="groupType" value="standard"/>
				 <json:property name="id" value="${share.id}"/>
				 <json:property name="name" value="${share.name}"/>
				 <json:property name="count" value="${share.userCount}"/>
		  </json:object>
	  </json:array>
 </json:object>

