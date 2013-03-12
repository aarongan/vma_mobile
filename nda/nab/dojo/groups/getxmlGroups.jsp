<%@page contentType="text/xml;charset=ISO-8859-1"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%
response.setHeader("Pragma", "private");
response.setHeader("Cache-Control", "private");
%>
 <MobileGroup>
	 <statusCode><s:property value="groupResponse.statusCode"/></statusCode>
	 <statusDesc><s:property value="groupResponse.statusDesc"/></statusDesc>
	 <statusDesc><s:property value="groupResponse.title"/></statusDesc>
	 <s:iterator value="groupResponse.groupVOList" id="group">
		<group>
			<name>${group.name}</name><groupId>${group.id}</groupId>
		</group>
	 </s:iterator>
 </MobileGroup>
