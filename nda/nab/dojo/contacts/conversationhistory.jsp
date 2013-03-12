<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>

<json:object>

	<json:property name="numRows" value="${cchcchResponse.summary.totalRows}" />
	<json:object name="all">
	<json:property name="All" value="${cchResponse.summary.totalAllMsgs}" />
	<json:property name="email" value="${cchResponse.summary.totalEmailMsgs}" />
	<json:property name="sms" value="${cchResponse.summary.totalSmsMsgs}" />
	<json:property name="mms" value="${cchResponse.summary.totalMmsMsgs}" />
	<json:property name="vvm" value="${cchResponse.summary.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${cchResponse.summary.totalCallLogMsgs}" />
	</json:object>
	
	<json:object name="unread">
	<json:property name="All" value="${cchResponse.unReadSummary.totalAllMsgs}" />
	<json:property name="email" value="${cchResponse.unReadSummary.totalEmailMsgs}" />
	<json:property name="sms" value="${cchResponse.unReadSummary.totalSmsMsgs}" />
	<json:property name="mms" value="${cchResponse.unReadSummary.totalMmsMsgs}" />
	<json:property name="vvm" value="${cchResponse.unReadSummary.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${cchResponse.unReadSummary.totalCallLogMsgs}" />
	</json:object>
	
	<json:object name="undelivered">
	<json:property name="smsRowNums" value="${cchResponse.unDeliveredInfo.smsUndeliveredCount}" />
	<json:property name="mmsRowNums" value="${cchResponse.unDeliveredInfo.mmsUndeliveredCount}" />
	<json:property name="isShow" value="${cchResponse.unDeliveredInfo.displayWidget}" />
	<json:array name="smsItems" items="${cchResponse.unDeliveredInfo.smsUidList}"
		var="uid">
			<json:property name="id" value="${uid}" />
	</json:array>
	<json:array name="mmsItems" items="${cchResponse.unDeliveredInfo.mmsUidList}"
		var="uid">
			<json:property name="id" value="${uid}" />
	</json:array>		
			
	</json:object>
		
	<json:property name="statusCode" value="${cchResponse.statusCode}" />
	<json:property name="statusDesc" value="${cchResponse.statusDesc}" />
	
	<json:array name="items" items="${cchResponse.messageHeaderList}"
		var="messageHeader">
			<json:object>
				
				<json:property name="messageId" value="${messageHeader.uid}" />
				<json:property name="folderName" value="${messageHeader.folder}" />
				<json:property name="type" value="${messageHeader.type}" />
				<json:property name="isThread" value="${messageHeader.thread}" />
				<json:property name="threadLength" value="${messageHeader.threadLength}" />
				<json:property name="draftLength" value="${messageHeader.draftLength}" />
				<json:property name="deliveryStatusCode" value="${messageHeader.deliveryStatus}" />
				
				<json:array name="from" items="${messageHeader.from}" var="addressInfo">
				   <json:object>
					 <json:property name="name" value="${addressInfo.personalName}" />
					 <json:property name="emailAddress" value="${addressInfo.emailAddress}" />
				   </json:object>
				</json:array>
	
				<json:array name="to" items="${messageHeader.to}" var="addressInfo">
  				   <json:object>
					 <json:property name="name" value="${addressInfo.personalName}" />
					 <json:property name="emailAddress" value="${addressInfo.emailAddress}" />
				   </json:object>
				</json:array>
				
				<json:array name="cc" items="${messageHeader.cc}" var="addressInfo">
				   <json:object>
					 <json:property name="name" value="${addressInfo.personalName}" />
					 <json:property name="emailAddress" value="${addressInfo.emailAddress}" />
				   </json:object>
				</json:array>
	
				<json:property name="subject" value="${messageHeader.subject}" escapeXml="false"/>
				<json:property name="receivedDateShortTxt" value="${messageHeader.relativeShortDateTxt}" />
				<json:property name="receivedDateDetailedTxt" value="${messageHeader.relativeDetailedDateTxt}" />
				
				<json:property name="receivedDate"
					value="${messageHeader.receivedDate}" />
				<json:property name="contactId" value="${messageHeader.contactId}" />
				<c:if test="${messageHeader.photo}">
	 					<json:property name="senderIcon" value="${messageHeader.pictureUrl}" />
	 	 		</c:if>
				<json:property name="attachment" value="${messageHeader.xattach}" />
				<json:property name="size" value="${messageHeader.size}" />
				<json:property name="priority" value="${messageHeader.priority}" />
				<json:property name="answered" value="${messageHeader.answered}" />
				<json:property name="draft" value="${messageHeader.draft}" />
				<json:property name="read" value="${messageHeader.seen}" />
				<json:property name="sourceSystem" value="${messageHeader.messageSource}" />
				<json:property name="sourceMessageId" value="${messageHeader.sourceMessageId}" escapeXml="false"/>
				<json:property name="sourceMessageFolder" value="${messageHeader.sourceMessageFolder}" />
				<json:property name="sourceMessageUID"
					value="${messageHeader.sourceMessageUID}" />

				<json:property name="isStarred" value="${messageHeader.starred}" />

				<!-- TODO: isNetwork is yet to be supported -->
				<json:property name="inNetwork" value="${messageHeader.inNetwork}" />

				<json:array name="tags" items="${messageHeader.tags}" var="tag">
					<json:object>
						<json:property name="id" value="${tag.tagId}" />
						<json:property name="name" value="${tag.tagName}" escapeXml="false"/>
					</json:object>
				</json:array>


			</json:object>

		</json:array>
		
		<json:array name="passwordChangeNotifications" items="${cchResponse.passwordChngNotifList}"
		var="passwordChngNotificationVO">
			<json:object>
				<json:property name="feedId" value="${passwordChngNotificationVO.feedId}" />
				<json:property name="alertId" value="${passwordChngNotificationVO.alertId}" />
				<json:property name="endPointLoginName" value="${passwordChngNotificationVO.endPointLoginName}" />
				<json:property name="messageType" value="${passwordChngNotificationVO.messageType}" />
			</json:object>
		</json:array>
		
		<json:object name="flags">
			<json:property name="showSyncPod" value="${cchResponse.flags.showSyncPod}" />
			<json:property name="errorMessage" value="${cchResponse.flags.errorMessage}" />
		</json:object>
		
	
		
</json:object>
