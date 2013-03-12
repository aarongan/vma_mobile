<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<json:object>
	<json:property name="statusCode"
		value="${fetchTaskByRangeResponse.statusCode}" />
	<json:property name="statusDesc"
		value="${fetchTaskByRangeResponse.statusDesc}" />
			<json:array name="items"
				items="${fetchTaskByRangeResponse.taskVOList}"
				var="taskVO">
				<json:object>
					<json:property name="taskId" value="${taskVO.taskId}" />
					<json:property name="calId" value="${taskVO.calId}"/>
					<json:property name="calendarColor" value="${taskVO.calendarColor}" />					
					<json:property name="summary" value="${taskVO.summary}" />
					<json:property name="description" value="${taskVO.description}" />
					<json:property name="dtStart" value="${taskVO.dtStart}" />
					<json:property name="dueDate" value="${taskVO.dueDate}" />
					<json:property name="priority" value="${taskVO.priority}" />
					<json:property name="percentage" value="${taskVO.percentage}" />
					<json:property name="taskSetting" value="${taskVO.taskSetting}" />
					<json:property name="showOnMyCalendar" value="${taskVO.showOnMyCalendar}" />
					<json:property name="reminderDay" value="${taskVO.alarmVO.reminderDay}"/>
					<json:property name="notificationType" value="${taskVO.alarmVO.notificationType}"/>
					<json:property name="starred" value="${taskVO.starred}" />
					<json:array name="tags" items="${taskVO.tagVO}" var="tags">
			 		<json:object>
		 	  			<json:property name="tagId" value="${tags.tagId}"/>
		 	  			<json:property name="tagName" value="${tags.tagName}"/>
		 	  			<json:property name="tagURL" value="${tags.tagURL}"/>
		 			</json:object>
					</json:array>
				</json:object>
			</json:array>
</json:object>
