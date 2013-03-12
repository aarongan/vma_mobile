<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>

<json:object>
	<json:property name="getContactsTime" value="${response.contactsTime}" />
	<json:property name="getMessageTime" value="${response.processTime}" />
	<json:property name="numRows" value="${response.summary.totalRows}" />
	<json:property name="numDummyRows" value="${response.dummyRowsCount}" />
	<json:object name="all">
	<json:property name="All" value="${response.summary.totalAllMsgs}" />
	<json:property name="email" value="${response.summary.totalEmailMsgs}" />
	<json:property name="sms" value="${response.summary.totalSmsMsgs}" />
	<json:property name="mms" value="${response.summary.totalMmsMsgs}" />
	<json:property name="vvm" value="${response.summary.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${response.summary.totalCallLogMsgs}" />
	</json:object>
	
	<json:object name="unread">
	<json:property name="All" value="${response.unReadSummary.totalAllMsgs}" />
	<json:property name="email" value="${response.unReadSummary.totalEmailMsgs}" />
	<json:property name="sms" value="${response.unReadSummary.totalSmsMsgs}" />
	<json:property name="mms" value="${response.unReadSummary.totalMmsMsgs}" />
	<json:property name="vvm" value="${response.unReadSummary.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${response.unReadSummary.totalCallLogMsgs}" />
	</json:object>
	
	<json:object name="undelivered">
	<json:property name="smsRowNums" value="${response.unDeliveredInfo.smsUndeliveredCount}" />
	<json:property name="mmsRowNums" value="${response.unDeliveredInfo.mmsUndeliveredCount}" />
	<json:property name="isShow" value="${response.unDeliveredInfo.displayWidget}" />
	<json:array name="smsItems" items="${response.unDeliveredInfo.smsUidList}"
		var="uid">
			<json:property name="id" value="${uid}" />
	</json:array>
	<json:array name="mmsItems" items="${response.unDeliveredInfo.mmsUidList}"
		var="uid">
			<json:property name="id" value="${uid}" />
	</json:array>		
			
	</json:object>
		
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	
	<json:array name="items" items="${response.messageHeaderList}"
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
	
				<json:property name="subject" value="${messageHeader.subject}"  escapeXml="false"/>
				<json:property name="receivedDateShortTxt" value="${messageHeader.relativeShortDateTxt}" />
				
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
				<json:property name="isBuddy" value="${messageHeader.connected}" />
				<json:property name="ics" value="${messageHeader.ics}" />
				<json:property name="sensitivity" value="${messageHeader.sensitive}" />
				<json:property name="orderNum" value="${messageHeader.orderNum}" />

				<json:array name="tags" items="${messageHeader.tags}" var="tag">
					<json:object>
						<json:property name="id" value="${tag.tagId}" />
						<json:property name="name" value="${tag.tagName}" escapeXml="false" />
					</json:object>
				</json:array>


			</json:object>

		</json:array>
		
		<json:array name="passwordChangeNotifications" items="${response.passwordChngNotifList}"
		var="passwordChngNotificationVO">
			<json:object>
				<json:property name="feedId" value="${passwordChngNotificationVO.feedId}" />
				<json:property name="alertId" value="${passwordChngNotificationVO.alertId}" />
				<json:property name="endPointLoginName" value="${passwordChngNotificationVO.endPointLoginName}" escapeXml="false"/>
				<json:property name="messageType" value="${passwordChngNotificationVO.messageType}" />
			</json:object>
		</json:array>
		
		<json:object name="flags">
			<json:property name="showSyncPod" value="${response.flags.showSyncPod}" />
			<json:property name="errorMessage" value="${response.flags.errorMessage}" />
		</json:object>

	<json:array name="tags" items="${response.newTagsAfterSync}"
		var="tag">
		<json:object>
			<json:property name="id" value="${tag.tagId}" />
			<json:property name="name" value="${tag.tagName}" />
		</json:object>
	</json:array>

		<json:array name="nabNotifications" items="${response.flags.nabNotifications}" var="nabNotification">
			<json:object>
				<json:property name="notification" value="${nabNotification.notification}" />
				<json:property name="type" value="${nabNotification.notificationType}" />
				<json:property name="message" value="${nabNotification.message}" />
			</json:object>
		</json:array>
		<json:object name="tagExceedNotifications">
			<json:property name="tagErrorMessage" value="${response.flags.tagExceedMessage}" />
		</json:object>


</json:object>
