<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareResponse.statusDesc}"/>
	  <json:array name="shares" items="${shareResponse.shares}" var="share">
			<json:object>
				 <json:property name="shareId" value="${share.id}"/>
				 <json:property name="statusCode" value="${share.statusCode}"/>
				 <json:property name="statusDesc" value="${share.statusDesc}"/>
		    </json:object>
	     </json:array>
 </json:object>

