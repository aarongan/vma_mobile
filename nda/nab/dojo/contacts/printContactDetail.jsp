<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/nda/common/taglibraries.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<html>

<head>
<title>Sync &amp;Connect Contact Details</title>

<link rel="stylesheet"
	href="<%=staticContentURL%>/styles/css/ics/nab/printLayout.css" />

<!--[if gte IE 6]>
		<style type="text/css">
			.nabPrint .emptyIcon{				
    			width: 22px;
			}
			.nabPrint .iconSpacing{
    			padding-top:0px;
			}
			.nabPrint .phoneNumbersSpacing {
				padding-bottom:1px;
			}
			/*.nabPrint .printLayout,.nabPrint .detailsPrintLayout {
				width:90px;
			}
			.nabPrint .printGroupDetails {
				width:125px;
			}*/
			.nabPrint .printFormGroupsIcon {
				margin-top:7px;
			}
			.nabPrint .printFormHomeIcon,.nabPrint .printFormMobileIcon,
			.nabPrint .printFormBusinessIcon,.nabPrint .printFormPersonalIcon,
			.nabPrint .printFormOtherIcon,.nabPrint .printFormImIcon,.nabPrint .printFormWebsiteIcon{
				margin-right: 2px;
				padding-right: 2px;
				width: 17px;
			}
		</style>
<![endif]-->

<!--[if IE 8]>
		<style type="text/css">
			.nabPrint .printFormWebsiteIcon{
				height:15px;
			}
		</style>
<![endif]-->

</head>

<body>
<div class="nabPrint" id="main" style="width: 564px;font-family:sans-serif;
	font-style: arial; 
	font-size: 12px;" >
<s:set name="contactList" id="contactList" value="contacts" />
<s:iterator value="contactList" id="contactList" status="contact">
	
	<!--[if gte IE 7]>
		<div id="leftPane"	style="width: 275px; float: left">
	<![endif]--> 
	<!--[if !IE]><!--> 
		<div id="leftPane"	style="width: 275px; float: left">
	<!--<![endif]-->
	
		
	<s:if test="%{photo == false}">
		<img class="img imgDetails"
			src="<%=staticContentURL%>/styles/images/ics/nab/icons/default_photo.png" />
	</s:if> 
	<s:else>
		<s:iterator value="picture">
			<s:if test="%{avatarName.length() != 0}">
				<div><img class="img imgDetails"
					src="<%=staticContentURL%>/styles/images/ics/nab/avatars/<s:property value="avatarName"/>" />
				</div>
			</s:if>
			<s:else>
				<s:if test="%{photoUrl != '' && photoUrl.length !=0}">
					<span><img class="img imgDetails"
						src="<s:property value="photoUrl"/>" />
					</span>
				</s:if>
				<s:else>
					<span><img class="img imgDetails"
						src="../nab/pictures/image.action?cdRequest.contactId=<s:property value="contactId"/>&version=<s:property value="version"/>" />
					</span>
				</s:else>
			</s:else>
		</s:iterator>
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
	
	<s:if test="firstName !=null || lastName!=null">
		<div class="contactName ellipsis" style="margin-top: 37px">
			<s:property value="firstName" />&nbsp;<s:property value="lastName" />
		</div>
	</s:if>
	<div style="height:55px;">
		<span style="margin-top: 10px;margin-bottom:0px;font-size:13px;" class="orgName ellipsis">
			<s:if test="%{firstName!=null || lastName!=null && orgName != null}">	
				 <s:property value="orgName" />
			</s:if>
			<s:else>
				<strong><s:property value="orgName" />&nbsp;</strong><br>
			</s:else>	
			<s:if test="orgName != null && jobTitle != null">, </s:if>
			<s:property	value="jobTitle" />	
		</span>
		<!--
		<div class="cardIconLabel" id="webGroups">
			<s:if	test="groups.size > 0">
			<span class="printFormGroupsIcon"></span>
			<span class="printGroupDetails ellipsis">
			<s:iterator value="groups" status="itrStatus">
				<s:if test="%{id == 1000}"></s:if>
				<s:else>
					<s:property value="name" />
					<s:if test="%{!#itrStatus.last}">, </s:if>
				</s:else>
			</s:iterator> </span>
		</s:if></div>
		--> 
		<span class="cardIconLabel" id="mobileGroups" style="margin-top:11px;">
			<s:if test='mobileGroups.size > 0'>
				<span class="printFormMobileGroupsIcon"></span>
				<span class="printGroupDetails ellipsis">
					<s:iterator value="mobileGroups" status="itrStatus">
						<s:if test="%{id == 1001}"></s:if>
					<s:else>
						<s:property value="name" />
						<s:if test="%{!#itrStatus.last}">, </s:if>
					</s:else>
					</s:iterator> 
				</span>
			</s:if>
		</span> 
	</div>
	<s:set id="mobilePhoneList" name="mobilePhoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@MOBILE_PHONE_TYPE].value" />
	<s:set id="businessPhoneList" name="businessPhoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_PHONE_TYPE].value" />
	<s:set id="homePhoneList" name="homePhoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_PHONE_TYPE].value" />



	<s:if test="%{(#homePhoneList !=null &&  #homePhoneList.size > 0) || 
								(#mobilePhoneList !=null &&  #mobilePhoneList.size > 0 )|| 
								(#businessPhoneList !=null &&  #businessPhoneList.size > 0)}">
		<div id="PhoneNumber" class="printLayoutPhoneSeparator"></div>
		<div style="margin:10px;*margin:-10px 10px 10px;"><strong style="font-size:14px;">Phone Numbers </strong> 
			<s:iterator value="#homePhoneList" status="homePhone">
				<div id="homeNumber" class="phoneNumbersSpacing"><s:if test="#homePhone.index == 0">
					<span class="printFormHomeIcon iconSpacing" > </span>
				</s:if> <s:else>
					<span class="emptyIcon" > </span>
				</s:else> <strong class="printLayout" > Home <s:property
					value="#homePhoneList[#homePhone.index+1].index" /> </strong> 
					<span class="detailsPrintLayout" > <s:property
						value="#homePhoneList[#homePhone.index+1].number" /> </span>
				</div>
			</s:iterator>
			<s:iterator value="#mobilePhoneList" status="mobilePhone">
				<div id="mobileNumber" class="phoneNumbersSpacing"><s:if test="#mobilePhone.index == 0">
					<span class="printFormMobileIcon iconSpacing" > </span>
				</s:if> <s:else>
					<span class="emptyIcon" > </span>
				</s:else> <strong class="printLayout" > Mobile <s:property
					value="#mobilePhoneList[#mobilePhone.index+1].index" /> </strong> 
					<span class="detailsPrintLayout" > <s:property
						value="#mobilePhoneList[#mobilePhone.index+1].number" /> </span>
				</div>
			</s:iterator>
			<s:iterator value="#businessPhoneList" status="businessPhone">
				<div id="businessNumber" class="phoneNumbersSpacing"><s:if test="#businessPhone.index == 0">
					<span class="printFormBusinessIcon iconSpacing" > </span>
				</s:if> <s:else>
					<span class="emptyIcon" > </span>
				</s:else> <strong class="printLayout" > Business <s:property
					value="#businessPhoneList[#businessPhone.index+1].index" /> </strong> 
					<span class="detailsPrintLayout" > <s:property
						value="#businessPhoneList[#businessPhone.index+1].number" /> </span>
				</div>
			</s:iterator>
		</div>
	</s:if> 
	<s:set id="callbackPhoneList" name="callbackPhoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CALL_BACK_PHONE_TYPE].value" />
	<s:set id="otherPhoneList" name="otherPhoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_PHONE_TYPE].value" />
	<s:set id="carphoneList" name="carphoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CAR_PHONE_TYPE].value" />
	<s:set id="telexList" name="telexList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TELEX_PHONE_TYPE].value" />
	<s:set id="videophoneList" name="videophoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VIDEO_PHONE_TYPE].value" />
	<s:set id="ttydphoneList" name="ttydphoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TTYD_PHONE_TYPE].value" />
	<s:set id="voipphoneList" name="voipphoneList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VOIP_PHONE_TYPE].value" />



	<s:if
		test="%{(#callbackPhoneList != null && #callbackPhoneList.size > 0) || (#otherPhoneList != null && #otherPhoneList.size > 0) 
								|| (#carphoneList != null && #carphoneList.size > 0) || (#telexList != null && #telexList.size > 0) 
								||(#videophoneList != null && #videophoneList.size > 0) || (#ttydphoneList != null && #ttydphoneList.size > 0)
								|| (#voipphoneList != null && #voipphoneList.size > 0)}">
								<div id="OtherNumber"></div>
		<div style="margin: 10px" ><strong>Other Numbers </strong>
			<s:if test="{#otherPhoneList != null && #otherPhoneList.size > 0}">
				<s:iterator value="#otherPhoneList" status="otherPhone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
						class="printLayout"> Other <s:property value="#otherPhoneList[value.index].index"/> </strong>
						<span class="detailsPrintLayout" ><s:property
							value="#otherPhoneList[value.index].number" /></span>
					</div>
				</s:iterator>
			</s:if>
			<s:if test="{#carphoneList != null && #carphoneList.size > 0}">
				<s:iterator value="#carphoneList" status="carphone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span>
						<strong	class="printLayout"> Car Phone </strong> 
						<span class="detailsPrintLayout" > <s:property
							value="#carphoneList[#carphone.index].number" /></span>
					</div>
				</s:iterator>
			</s:if> 
			<s:if test="{#telexList != null && #telexList.size > 0}">
				<s:iterator value="#telexList" status="telex">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
						class="printLayout" > Telex </strong> 
						<span class="detailsPrintLayout" ><s:property
							value="#telexList[#telex.index].number" /></span>
					</div>
				</s:iterator>
			</s:if> 
			<s:if test="{#videophoneList != null && #videophoneList.size > 0}">
				<s:iterator value="#videophoneList" status="videophone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
						class="printLayout"> Videophone </strong> 
						<span class="detailsPrintLayout" > <s:property
							value="#videophoneList[#videophone.index].number" /></span>
					</div>
				</s:iterator>
			</s:if> 
			<s:if test="{#ttydphoneList != null && #ttydphoneList.size > 0}">
				<s:iterator value="#ttydphoneList" status="ttydphone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> 
					<strong	class="printLayout" > TTYD </strong> 
					<span class="detailsPrintLayout" ><s:property
							value="#ttydphoneList[#ttydphone.index].number" /></span>
					</div>
				</s:iterator>
			</s:if> 
			<s:if test="{#voipphoneList != null && #voipphoneList.size > 0}">
				<s:iterator value="#voipphoneList" status="voipphone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> 
					<strong	class="printLayout" > Voiphone </strong> 
						<span class="detailsPrintLayout" ><s:property
							value="#voipphoneList[#voipphone.index].number" /></span>
					</div>
				</s:iterator>
			</s:if> 
			<s:if
				test="{#callbackPhoneList != null && #callbackPhoneList.size > 0}">
				<s:iterator value="#callbackPhoneList" status="callbackPhone">
					<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
						class="printLayout" > CallBack </strong> 
						<span class="detailsPrintLayout" ><s:property
							value="#callbackPhoneList[#callbackPhone.index].number" /></span>
					</div>
				</s:iterator>
			</s:if>
		</div>
	</s:if> <s:set id="primaryfaxList" name="primaryfaxList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_FAX_TYPE].value" />
	<s:set id="businessfaxList" name="businessfaxList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_FAX_TYPE].value" />
	<s:set id="homefaxList" name="homefaxList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_FAX_TYPE].value" />
	<s:set id="otherfaxList" name="otherfaxList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_FAX_TYPE].value" />
	<s:set id="radioList" name="radioList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@RADIO_PHONE_TYPE].value" />
	<s:set id="pagerList" name="pagerList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PAGER_TYPE].value" />
	<s:set id="assistantList" name="assistantList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@ASSISTANT_PHONE_TYPE].value" />
	<s:set id="schoolList" name="schoolList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@SCHOOL_PHONE_TYPE].value" />
	<s:set id="companyList" name="companyList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@COMPANY_MAIN_PHONE_TYPE].value" />
	<s:set id="mainList" name="mainList"
		value="phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_PHONE_TYPE].value" />



	<div style="margin: 10px" >
	<s:if test="{#primaryfaxList != null && #primaryfaxList.size > 0}">
		<s:iterator value="#primaryfaxList" status="primaryfax">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
				class="printLayout"> Primary Fax </strong>
				<span class="detailsPrintLayout" ><s:property
					value="#primaryfaxList[#primaryfax.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#businessfaxList != null && #businessfaxList.size > 0}">
		<s:iterator value="#businessfaxList" status="businessfax">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
				class="printLayout"> Business Fax <s:property value="#businessfaxList[value.index].index"/> </strong>
				<span class="detailsPrintLayout" ><s:property
					value="#businessfaxList[value.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#homefaxList != null && #homefaxList.size > 0}">
		<s:iterator value="#homefaxList" status="homefax">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
				class="printLayout"> Home Fax </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#homefaxList[#homefax.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#otherfaxList != null && #otherfaxList.size > 0}">
		<s:iterator value="#otherfaxList" status="otherfax">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
				class="printLayout"> Other Fax </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#otherfaxList[#otherfax.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#radioList != null && #radioList.size > 0}">
		<s:iterator value="#radioList" status="radio">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
				class="printLayout"> Radio </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#radioList[#radio.index].number" /> </span>
			</div>
		</s:iterator>
	</s:if>
	<s:if test="{#companyList != null && #companyList.size > 0}">
		<s:iterator value="#companyList" status="company">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
				class="printLayout"> Company Main </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#companyList[#company.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#mainList != null && #mainList.size > 0}">
		<s:iterator value="#mainList" status="primary">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
				class="printLayout"> Main </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#mainList[#primary.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#pagerList != null && #pagerList.size > 0}">
		<s:iterator value="#pagerList" status="pager">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"></span> <strong
				class="printLayout"> Pager <s:property value="#pagerList[value.index].index"/> </strong> 
				<span class="detailsPrintLayout" >
				<s:property	value="#pagerList[value.index].number" /> </span>
			</div>
		</s:iterator>
	</s:if>
	<s:if test="{#assistantList != null && #assistantList.size > 0}">
		<s:iterator value="#assistantList" status="assistant">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
				class="printLayout"> Assistant </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#assistantList[#assistant.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	<s:if test="{#schoolList != null && #schoolList.size > 0}">
		<s:iterator value="#schoolList" status="school">
			<div class="phoneNumbersSpacing"><span class="emptyIcon"> </span> <strong
				class="printLayout"> School </strong> 
				<span class="detailsPrintLayout" ><s:property
					value="#schoolList[#school.index].number" /></span>
			</div>
		</s:iterator>
	</s:if> 
	</div>	
	<s:set id="businessEmailList" name="businessEmailList"
		value="emailMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_EMAIL_ADDR_TYPE].value" />
	<s:set id="personalEmailList" name="personalEmailList"
		value="emailMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_EMAIL_ADDR_TYPE].value" />
	<s:set id="otherEmailList" name="otherEmailList"
		value="emailMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_EMAIL_ADDR_TYPE].value" />

	<s:if	test="%{(#businessEmailList != null && #businessEmailList.size >0) ||
								(#personalEmailList != null && #personalEmailList.size >0) ||
									(#otherEmailList != null && #otherEmailList.size >0)}">
		<div id="email" class="printLayoutSeparator"></div>
		<div style="margin:10px;"><strong style="font-size:14px;"> Email </strong>
		<s:if  test="{#personalEmailList != null && #personalEmailList.size > 0}">
			<s:iterator value="#personalEmailList" status="personalEmail">
				<div class="phoneNumbersSpacing"><span class="printFormHomeIcon iconSpacing"> </span> <strong
					class="printLayout"> Personal </strong> <span class="printLayout ellipsis" style="vertical-align: middle;display:inline-block;width: 120px;">
					<s:property	value="#personalEmailList[#personalEmail.index].address" /></span>
				</div>
			</s:iterator>
		</s:if> 
		<s:if	test="{#businessEmailList != null && #businessEmailList.size > 0}">
			<s:iterator value="#businessEmailList" status="businessEmail">
				<div class="phoneNumbersSpacing"><span class="printFormBusinessIcon iconSpacing"> </span> <strong
					class="printLayout"> Business </strong> <span class="printLayout ellipsis" style="vertical-align: middle;display:inline-block;width: 120px;">
					<s:property	value="#businessEmailList[#businessEmail.index].address" /></span>
				</div>
			</s:iterator>
		</s:if> 
		<s:if test="{#otherEmailList != null && #otherEmailList.size > 0}">
			<s:iterator value="#otherEmailList" status="otherEmail">
				<div class="phoneNumbersSpacing"><span class="printFormOtherIcon iconSpacing"> </span> <strong
					class="printLayout"> Other </strong> <span class="printLayout ellipsis" style="vertical-align: middle;display:inline-block;width: 120px;">
					<s:property	value="#otherEmailList[#otherEmail.index].address" /></span>
				</div>
			</s:iterator>
		</s:if>
		</div>
	</s:if> 	
</div>
	

	
	<!--[if gte IE 7]>
		<div id="rightPane"	style="width: 275px; float: right">
	<![endif]--> 
	<!--[if !IE]><!--> 
		<div id="rightPane"		style="width: 275px; float: right">
	<!--<![endif]-->
	<s:if	test="%{ ( ims!= null && ims.size > 0) || (webPageMap != null && webPageMap.size > 0) }">
		<div id="messaging_website" class="printLayoutSeparator"></div>
		<div style="margin: 5px 15px;"><strong style="font-size:14px;"> Messaging & Websites </strong>
		<s:iterator value="ims" status="imsList">
			<div class="phoneNumbersSpacing"><s:if test="#imsList.index == 0">
				<span class="printFormImIcon iconSpacing"> </span>
			</s:if> 
			<s:else>
				<span class="emptyIcon"> </span>
			</s:else> 
			<span class="printLayout" style="text-transform:capitalize;"><b> <span>
			<s:property	value="type" /></span></b> </span> 
			<span class="printLayout ellipsis" style="vertical-align: middle;display:inline-block;width: 100px;">
			<s:property	value="address" /></span>
			</div>
		</s:iterator> 
		<s:set id="businessWebPagesList" name="businessWebPagesList"
			value="webPageMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_WEB_PAGE_TYPE].value" />
		<s:set id="personalWebPagesList" name="personalWebPagesList"
			value="webPageMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_WEB_PAGE_TYPE].value" />
		<s:set id="otherWebPagesList" name="otherWebPagesList"
			value="webPageMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_WEB_PAGE_TYPE].value" />

		<s:if test="%{#businessWebPagesList != null && #businessWebPagesList.size > 0}">
			<s:iterator value="#businessWebPagesList" status="businessWebPages">
				<div class="phoneNumbersSpacing"><s:if test="#businessWebPages.index == 0">
					<span class="printFormWebsiteIcon iconSpacing"> </span>
				</s:if> <s:else>
					<span class="emptyIcon"> </span>
				</s:else> <strong class="printLayout"> Business <s:property
					value="#businessWebPagesList[#businessWebPages.index+1].index" /> </strong>
				<span class="printLayout ellipsis websitesDisplay" >
				<s:property	value="#businessWebPagesList[#businessWebPages.index+1].url" /></span>
				</div>
			</s:iterator>
		</s:if> 
		<s:if test="%{#personalWebPagesList != null && #personalWebPagesList.size > 0}">
			<s:iterator value="#personalWebPagesList" status="personalWebPages">
				<div class="phoneNumbersSpacing"><s:if
					test="%{#personalWebPages.index == 0 && !(#businessWebPagesList != null && #businessWebPagesList.size > 0)}">

					<span class="printFormWebsiteIcon iconSpacing" > </span>
				</s:if> <s:else>
					<span class="emptyIcon"> </span>
				</s:else> <strong class="printLayout"> Personal </strong> 
					<span class="printLayout ellipsis websitesDisplay" >
					<s:property	value="#personalWebPagesList[#personalWebPages.index].url" /></span>
					</div>
			</s:iterator>
		</s:if> 
		<s:if	test="{otherWebPagesList != null && otherWebPagesList.size > 0}">
			<s:iterator value="otherWebPagesList" status="otherWebPages">
				<div class="phoneNumbersSpacing"><s:if
					test="#otherWebPages.index == 0 && !(#personalWebPagesList != null && #personalWebPagesList.size > 0) && !(#businessWebPagesList != null && #businessWebPagesList.size > 0) ">
					<span class="printFormWebsiteIcon iconSpacing" > </span>
				</s:if> <s:else>
					<span class="emptyIcon"> </span>
				</s:else> <strong class="printLayout"> Other </strong> <span
					class="printLayout ellipsis websitesDisplay" > <span><s:property
					value="#otherWebPagesList[#otherWebPages.index].url" /></span> </span></div>
			</s:iterator>
		</s:if></div>
	</s:if>

	<s:set
		id="homeAddressList" name="homeAddressList"
		value="addressMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_ADDR_TYPE].value" />
	<s:set id="businessAddressList" name="businessAddressList"
		value="addressMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_ADDR_TYPE].value" />
	<s:set id="personalAddressList" name="personalAddressList"
		value="addressMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_ADDR_TYPE].value" />
	<s:set id="otherAddressList" name="otherAddressList"
		value="addressMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_ADDR_TYPE].value" />

	<s:if
		test="%{(#homeAddressList != null && #homeAddressList.size > 0) || 
								(#businessAddressList != null && #businessAddressList.size > 0) || 
									(#personalAddressList != null && #personalAddressList.size > 0) || 
										(#otherAddressList != null && #otherAddressList.size > 0)}">
		<div id="address" class="printLayoutSeparator"></div>
		<div style="margin: 5px 15px;"><strong style="font-size:14px;"> Address </strong>

		<s:iterator value="#homeAddressList" status="homeAddress">

			<div class="phoneNumbersSpacing"><s:if test="#homeAddress.index == 0">
				<span class="printFormHomeIcon iconSpacing" style="vertical-align: top">
				</span>
				</s:if> <s:else>
					<span class="emptyIcon"> </span>
				</s:else> <strong class="printLayout" style="width:90px;"> Home 
				<s:property	value="#homeAddressList[value.index].index" /> </strong>				 
				<s:if test="#homeAddressList[value.index].street != null">
					<span class="detailsPrintLayout">
						<s:property	value="#homeAddressList[value.index].apartment" />
						<s:property	value="#homeAddressList[value.index].street" /> 
					</span >
					<div style="margin-left:114px;" class="detailsPrintLayout">
						<s:property value="#homeAddressList[value.index].city" /> , 
						<s:property	value="#homeAddressList[value.index].state" /> 
						<s:property	value="#homeAddressList[value.index].zipCode" /> 
		   			</div>
				</s:if>
				<s:else>
					<span class="detailsPrintLayout">
						<s:property value="#homeAddressList[value.index].city" /> , 
						<s:property	value="#homeAddressList[value.index].state" /> 
						<s:property	value="#homeAddressList[value.index].zipCode" /> 
			   		</span>
		   		</s:else>
		   </div>

		</s:iterator>


		<s:iterator value="#businessAddressList" status="businessAddress">

			<div class="phoneNumbersSpacing"><s:if test="#businessAddress.index == 0">
				<span class="printFormBusinessIcon iconSpacing">
				</span>

			</s:if> <s:else>
				<span class="emptyIcon"> </span>
			</s:else> <strong class="printLayout" style="width:90px;"> Business 
			<s:property	value="#businessAddressList[value.index].index" /> </strong> 
			<s:if test="#businessAddressList[value.index].street != null">
				<span class="detailsPrintLayout">
					<s:property	value="#businessAddressList[value.index].apartment" />
					<s:property	value="#businessAddressList[value.index].street" /> 
				</span>
				<div style="margin-left:114px;" class="detailsPrintLayout">
					<s:property value="#businessAddressList[value.index].city" /> , 
					<s:property	value="#businessAddressList[value.index].state" /> 
					<s:property	value="#businessAddressList[value.index].zipCode" /> 
	   			</div>
			</s:if>
			<s:else>
				<span class="detailsPrintLayout">
					<s:property value="#businessAddressList[value.index].city" /> , 
					<s:property	value="#businessAddressList[value.index].state" /> 
					<s:property	value="#businessAddressList[value.index].zipCode" /> 
		   		</span>
	   		</s:else>
		 </div>
		</s:iterator>


		<s:iterator value="#personalAddressList" status="personalAddress">

			<div class="phoneNumbersSpacing"><s:if test="#personalAddress.index == 0">
				<span class="printFormPersonalIcon iconSpacing"> </span>

			</s:if> <s:else>
				<span class="emptyIcon"> </span>
			</s:else> <strong class="printLayout" style="width:90px;"> Personal 
			<s:property	value="#personalAddressList[value.index].index" /> </strong> 
			<s:if test="#personalAddressList[value.index].street != null">
				<span class="detailsPrintLayout">
					<s:property	value="#personalAddressList[value.index].apartment" />
					<s:property	value="#personalAddressList[value.index].street" /> 
				</span>
				<div style="margin-left:114px;" class="detailsPrintLayout">
					<s:property value="#personalAddressList[value.index].city" /> , 
					<s:property	value="#personalAddressList[value.index].state" /> 
					<s:property	value="#personalAddressList[value.index].zipCode" /> 
	   			</div>
			</s:if>
			<s:else>
				<span class="detailsPrintLayout">
					<s:property value="#personalAddressList[value.index].city" /> , 
					<s:property	value="#personalAddressList[value.index].state" /> 
					<s:property	value="#personalAddressList[value.index].zipCode" /> 
		   		</span>
	   		</s:else>
		</div>

		</s:iterator>

		<s:iterator value="#otherAddressList" status="otherAddress">

			<div class="phoneNumbersSpacing"><s:if test="#otherAddress.index == 0">
				<span class="printFormOtherIcon iconSpacing"> </span>

			</s:if> <s:else>
				<span class="emptyIcon"> </span>
			</s:else> <strong class="printLayout" style="width:90px;"> Other 
			 </strong> 
			<s:if test="#otherAddressList[#otherAddress.index].street != null">
				<span class="detailsPrintLayout">
					<s:property	value="#otherAddressList[#otherAddress.index].apartment" />
					<s:property	value="#otherAddressList[#otherAddress.index].street" /> 
				</span>
				<div style="margin-left:114px;" class="detailsPrintLayout">
					<s:property value="#otherAddressList[#otherAddress.index].city" /> , 
					<s:property	value="#otherAddressList[#otherAddress.index].state" /> 
					<s:property	value="#otherAddressList[#otherAddress.index].zipCode" /> 
	   			</div>
			</s:if>
			<s:else>
				<span class="detailsPrintLayout">
					<s:property value="#otherAddressList[#otherAddress.index].city" /> , 
					<s:property	value="#otherAddressList[#otherAddress.index].state" /> 
					<s:property	value="#otherAddressList[#otherAddress.index].zipCode" /> 
		   		</span>
	   		</s:else>
		</div>

		</s:iterator>
		</div>
	</s:if>

	<div id="other" class="printLayoutSeparator"></div>
	<div style="margin: 5px 15px;"><strong style="font-size:14px"> Other </strong>
	<div >
	<s:if test="%{gender != null }">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Gender </strong> <span>
		<s:property value="gender" /> </span>
		</div>
	</s:if>
	<s:if test="%{namePrefix != null && prefixSuffixMap != null && prefixSuffixMap.size > 0 }">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Prefix </strong> <span>
		<s:property value="prefixSuffixMap[namePrefix]" /> </span>
		</div>
	</s:if>
	<s:if test="%{nameSuffix != null && prefixSuffixMap != null && prefixSuffixMap.size > 0 }">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Suffix </strong> <span>
		<s:property value="prefixSuffixMap[nameSuffix]" /> </span>
		</div>
	</s:if>
	<s:if test="%{middleName != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Middle Name </strong> <span class="detailsPrintLayout">
		<s:property value="middleName" /> </span>
		</div>
	</s:if>
	<s:if test="%{nickName != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Nick Name </strong> <span class="detailsPrintLayout">
		<s:property value="nickName" /> </span>
		</div>
	</s:if> 
	<s:if test="%{birthday != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Date of Birth </strong> <span>
		<s:property value="birthday" /> </span>
		</div>
	</s:if>
	<s:if test="%{anniversary != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Anniversary </strong> <span>
		<s:property value="anniversary" /> </span>
		</div>
	</s:if>
	<s:if test="%{profession != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Profession </strong> <span class="detailsPrintLayout">
		<s:property value="profession" /> </span>
		</div>
	</s:if>
	<s:if test="%{assistant != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Assistant Name </strong> <span class="detailsPrintLayout">
		<s:property value="assistant" /> </span>
		</div>
	</s:if>
	<s:if test="%{orgUnit != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Company Department </strong> <span class="detailsPrintLayout">
		<s:property value="orgUnit" /> </span>
		</div>
	</s:if>
	<s:if test="">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong
			class="printOtherLabel">School </strong> <span class="detailsPrintLayout">
		</span>
		</div>
	</s:if> 
	<s:if test="%{spouse != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Spouse </strong> <span class="detailsPrintLayout">
		<s:property value="spouse" /> </span>
		</div>
	</s:if>
	<s:if test="%{children != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Children </strong> <span class="detailsPrintLayout">
		<s:property value="children" /> </span>
		</div>
	</s:if>
	<s:if test="%{relationship != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Relationship </strong> <span class="detailsPrintLayout">
		<s:property value="relationship" /> </span>
		</div>
	</s:if>
	<s:if test="%{timeZone!=null && timezoneMap != null && timezoneMap.size > 0 }">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel" style="vertical-align: top; border-bottom-width: 10px; margin-top: 0px; padding-bottom: 20px;">
		Time Zone </strong> <span class="detailsPrintLayout" style="white-space:normal;">
		<s:property value="timezoneMap[timeZone]" /> </span>
		</div>
	</s:if>
	<s:if test="%{maritalStatus != null && maritalStatusMap!=null && maritalStatusMap.size>0 }">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">Marital Status </strong> <span class="detailsPrintLayout">
		<s:property value="maritalStatusMap[maritalStatus]" /> </span>
		</div>
	</s:if><!-- 
	<s:if test="%{note != null }">
		<div>
		<span class="emptyIcon"> </span> <strong class="printOtherLabel" style="vertical-align: top; border-bottom-width: 10px; margin-top: 0px; padding-bottom: 20px;">
		Notes </strong> <span class="detailsPrintLayout" style="white-space:normal;height: 105px;*height: 20px;text-overflow:ellipsis; ">
		<s:property value="note" /> </span>
		</div>
	</s:if>-->
	<s:if test="%{note != null}">
		<div class="phoneNumbersSpacing">
		<span class="emptyIcon"> </span> <strong class="printOtherLabel">
		Notes </strong> <span class="detailsPrintLayout">
		<s:property value="note" /> </span>
		</div>
	</s:if>
	</div>

	</div>
  </div>


	<div style="page-break-before: always;"><span
		style="visibility: hidden;">  </span></div>

</s:iterator>
</div>
</body>


</html>

