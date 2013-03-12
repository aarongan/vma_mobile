<%@ page contentType="application/json; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>

populateMessageHeaders(
<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="status" value="${response.statusDesc}" />
</json:object>
);
