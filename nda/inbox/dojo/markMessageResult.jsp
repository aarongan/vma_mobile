<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="status">

	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	
	<json:object name="unread">
	<json:property name="All" value="${response.unreadSummaryInfo.totalAllMsgs}" />
	<json:property name="email" value="${response.unreadSummaryInfo.totalEmailMsgs}" />
	<json:property name="sms" value="${response.unreadSummaryInfo.totalSmsMsgs}" />
	<json:property name="mms" value="${response.unreadSummaryInfo.totalMmsMsgs}" />
	<json:property name="vvm" value="${response.unreadSummaryInfo.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${response.unreadSummaryInfo.totalCallLogMsgs}" />
	</json:object>
			
</json:object>
