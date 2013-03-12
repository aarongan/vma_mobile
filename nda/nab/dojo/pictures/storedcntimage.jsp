<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
	<json:object>
	    <json:property name="statusCode" value="${picResponse.statusCode}"/>
	    <json:property name="statusDesc" value="${picResponse.statusDesc}"/>
	    <json:property name="errorCode" value="${picResponse.errorCode}"/>
	    <json:property name="title" value="${picResponse.title}"/>
		<json:property name="contentType" value="${imageVO.contentType}"/>
		<json:property name="fileName" value="${imageVO.fileName}"/>
		<json:property name="width" value="${imageVO.width}"/>
		<json:property name="height" value="${imageVO.height}"/>
	 	<json:property name="imageUrl"><s:property value="@com.vzw.is.ics.common.NABCommonConstants@STORED_IMAGE_URL"/>imageVO.contentType=${imageVO.contentType}&imageVO.fileName=${imageVO.fileName}&version=${version}</json:property> 
	</json:object>