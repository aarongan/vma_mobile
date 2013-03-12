<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/nda/common/taglibraries.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>



<html>
<head>
<title>Sync & Connect Contact Card View</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=staticContentURL%>/styles/css/ics/nab/printLayout.css" />

</head>
<body style="border-left: 0px; font-family: sans-serif;">

<div class="nabPrint" id="main " style="width: 563px;"><s:set
	name="contactList" id="contactList" value="contacts" /> <s:iterator
	value="contacts" id="contactList" status="contact">
	<s:if test="%{(#contact.index)%4==0 && (#contact.index) > 0}">
		<div style="page-break-before: always;"><span
			style="visibility: hidden;"> &nbsp </span></div>
	</s:if>

	<s:if test="#contact.even == false">
		<div id="leftrow" class="printCardLayout"
			style="float: left;">
	</s:if>
	<s:else>
		<div id="rightrow" class="printCardLayout"
			style="float: right">
	</s:else>
	<div style="padding-left: 10px; margin-top: 10px;">
		<s:if test="%{favorite}">
			<span class="starIcon"> </span>
		</s:if> 
		<s:set id="icsvalue" name="icsvalue" value="cvi" />
		<s:if test="icsvalue == V || icsvalue == I ">		
			<span class="vzwIcsIcon"> </span>
		</s:if>
		<s:elseif test="icsvalue == C ">
			<span class="vzwIcsConnectedIcon"> </span>
		</s:elseif>
		<s:if test="%{handset == true}">
			<span class="mobile_syncIcon"> </span>
		</s:if>
	</div>

	<s:if test="%{photo == false}">
		<span><img class="img"
			src="<%=staticContentURL%>/styles/images/ics/nab/icons/default_photo.png" />
		</span>
	</s:if>
	<s:else>
		<s:iterator value="picture">
			<s:if test="%{avatarName.length() != 0}">
				<span><img class="img"
					src="<%=staticContentURL%>/styles/images/ics/nab/avatars/<s:property value="avatarName"/>" />
				</span>
			</s:if>
			<s:else>
				<s:if test="%{photoUrl != '' && photoUrl.length !=0}">
					<span><img class="img"
						src="<s:property value="photoUrl"/>" />
					</span>
				</s:if>
				<s:else>
					<span><img class="img"
						src="../nab/pictures/image.action?cdRequest.contactId=<s:property value="contactId"/>&version=<s:property value="version"/>" />
					</span>
				</s:else>
			</s:else>
		</s:iterator>
	</s:else>

	<s:if test="%{displayName !=null}">
		<span class="contactName ellipsis" style="display: inline-block;">
		<s:property value="displayName" /><br>
		</span>
	</s:if>

	<s:if test="%{firstName!=null || lastName!=null && orgName != null}">
		<span class="orgName ellipsis shortRows"
			style="display: inline-block;"> <s:property value="orgName" />
		<s:if test="%{jobTitle!=null}">
			<s:if test="%{orgName!=null}">
					  		,<s:property value="jobTitle" />
				<br>
			</s:if>
			<s:else>
				<s:property value="jobTitle" />
				<br>
			</s:else>
		</s:if> </span>
	</s:if>
	<s:else>
		<span class="jobTitle ellipsis shortRows"
			style="display: inline-block;"> <s:property value="jobTitle" /><br>
		</span>
	</s:else>

	<s:iterator id="itemList" value="itemList" status="items">
		<s:if test="type == 2">
			<span class="cardIconLabel" > <s:if
				test="name == 'homePhone'">
				<span class="printFormHomeIcon"> </span>
			</s:if> <s:elseif test="name == 'mobilePhone'">
				<span class="printFormMobileIcon"> </span>
			</s:elseif> <s:elseif test="name == 'businessPhone'">
				<span class="printFormBusinessIcon"> </span>
			</s:elseif> <s:else>
				<span class='printLayout1'> </span>
			</s:else> 
			<s:if test="name == 'otherPhone'"></s:if>
			<s:else>
				<span class="ellipsis" style="display: inline-block; width: 154px;">
				<s:property value="value" /> </span>
			</s:else> </span>
		</s:if>

		<s:if test="type == 4">
			<!--[if gte IE 7]>
				<span class="dividerLine" style="margin-top: -12px;"></span>
			<![endif]--> 
			<!--[if !IE]><!--> 
				<span class="dividerLine"></span>
			<!--<![endif]-->
		</s:if>

		<s:if test="type == 3">
			<span class="cardIconLabel"> <s:if
				test="name.contains('personal')">
				<span class="printFormPersonalIcon"> </span>
			</s:if> <s:elseif test="name.contains('business')">
				<span class="printFormBusinessIcon"> </span>
			</s:elseif> <s:elseif test="name.contains('other')">
				<span class="printFormOtherIcon"> </span>
			</s:elseif> <s:elseif test="name == 'im'">
				<span class="printFormImIcon"> </span>
			</s:elseif> <s:elseif test="name == 'webUrl'">
				<span class="printFormWebsiteIcon"> </span>
			</s:elseif> <s:elseif test="name.contains('home')">
				<span class="printFormHomeIcon"> </span>
			</s:elseif> <s:if test="name.contains('Email')">
				<span class="ellipsis longRows" style="display: inline-block;"><s:property
					value="value" /></span>
			</s:if> <s:else>
				<span class="ellipsis" style="display: inline-block; width: 175px;"><s:property
					value="value" /></span>
			</s:else> </span>
		</s:if>

		<s:if test="type == 5">
			<s:if test="name == 'webGroup'">
				<span
					style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; margin-top: 6px; padding-left: 6px;"
					class="cardIconLabel" id="webGroups"> <s:if
					test="groups.size > 0">
					<span class="printFormGroupsIcon"></span>
					<span class="printWebDetails ellipsis"
						style="display:inline-block;vertical-align: middle;width: 220px;">
					<s:iterator value="groups" status="itrStatus">
						<s:if test="%{id == 1000}"></s:if>
						<s:else>
							<s:property value="name" />
							<s:if test="%{!#itrStatus.last}">, </s:if>
						</s:else>
					</s:iterator> </span>
				</s:if> </span>
			</s:if>
			<s:elseif test="name == 'mobileGroup'">
				<span
					style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; -o-text-overflow: ellipsis; margin-top: 2px; padding-left: 6px;"
					class="cardIconLabel" id="mobileGroups"> <s:if
					test="mobileGroups.size > 0">
					<span class="printFormMobileGroupsIcon"></span>
					<span class="printMobileDetails ellipsis"
						style="display:inline-block;vertical-align: middle;width: 220px;">
					<s:iterator value="mobileGroups" status="itrStatus">
						<s:if test="%{id == 1001}"></s:if>
						<s:else>
							<s:property value="name" />
							<s:if test="%{!#itrStatus.last}">, </s:if>
						</s:else>
					</s:iterator> </span>
				</s:if> </span>
			</s:elseif>
		</s:if>

		<s:if test="type == 6">
			<span class="cardIconLabel" id="endPointAssoc"> 
			<s:if test="name == 'updatedDATE'">
				<s:if test="endPointAssoc.size > 0">
					<s:iterator value="endPointAssoc" status="sts">
						
							<s:if test="endPointId == 4">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormGoogleEndPoints"></span>
							</s:if>
							<s:if test="endPointId == 2">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormYahooEndPoints"></span>
							</s:if>
							<s:if test="endPointId == 1">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormAOLEndPoints"></span>
							</s:if>
							<s:if test="endPointId == 3">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormMSNEndPoints"></span>
							</s:if>
							<s:if test="endPointId == 12">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormTBEndPoints"></span>
							</s:if>
							<s:if test="endPointName == 'OUTLOOK'">
								<span style="float: left; display:inline-block; text-align:center;" class="printFormOUTLOOKEndPoints"></span>
							</s:if>
						
					</s:iterator>
				</s:if> 
				<span class="updatedDate" id="date"
					style="text-align: right;float: right; padding-right: 20px"> Updated <s:property
					value="modified" /> <br>
				</span>
			</s:if> </span>
		</s:if>



	</s:iterator></div>
</s:iterator>

</body>
</html>
