<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>	
	
	<json:object>
		 <json:property name="statusCode" value="${saveImpRes.statusCode}"/>
		 <json:property name="statusDesc" value="${saveImpRes.statusDesc}"/>
		 <json:property name="errorCode" value="${saveImpRes.errorCode}"/>
		 <json:property name="title" value="${saveImpRes.title}"/>
		 <json:property name="uniqueId" value="${saveImpRes.uniqueId}"/>
	</json:object>
