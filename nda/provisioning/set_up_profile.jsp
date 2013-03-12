<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	

<html>
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/datePicker.css" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<body class="pl" onload="onPageLoad();setAmTimer();">

<style type="text/css">
a.dp-choose-date {
	float: left;
	width: 16px;
	height: 16px;
	padding: 0;
	margin: 5px 3px 0;
	display: block;
	text-indent: -2000px;
	overflow: hidden;
	background: url(<%=staticContentURL%>styles/images/ics/provision/calendar.png) no-repeat; 
}
a.dp-choose-date.dp-disabled {
	background-position: 0 -20px;
	cursor: default;
}
input.dp-applied {
	width: 140px;
	float: left;
}  
.phoneNumbers{
	float:left;
	padding-top:5px;
	padding-bottom:5px;
	border-color:red;
	width:340px;
	border-bottom:2px dotted #CCCCCC;
}
.phoneNumbersWide{
	float:left;
	padding-top:5px;
	padding-bottom:5px;
	border-color:red;
	width:490px;
	border-bottom:2px dotted #CCCCCC;
}
.emails{
	float:left;
	padding-top:5px;
	padding-bottom:5px;
	width:490px;
}
.emailsWide{
	float:left;
	padding-top:5px;
	padding-bottom:5px;
	border-bottom:2px dotted #CCCCCC;
	width:490px;
}
.company{
	float:left;
	padding-bottom:20px;
	border-bottom:2px dotted #CCCCCC;
	width:340px;
}
.companyWide{
	float:left;
	padding-bottom:20px;
	border-bottom:2px dotted #CCCCCC;
	width:490px;
}
.detailPhoto{
	float:left;
	width:490px;
	padding-bottom:20px;
	border-bottom:2px dotted #CCCCCC;
}
.firstRowDiv{
	width:490px;padding-top:5px;
}
.firstRowDivDetail{
	width:490px;padding-top:5px;border-bottom:2px dotted #CCCCCC;
}

.imweb {
	margin-left: 1px;*margin-left:5px;
}
</style>


<script type="text/javascript">
	var phoneNumbersListSize = 1;
	var emailsListSize = 2;
	var addressesListSize = 0;
	var imsListSize = 0;
	var webPagesListSize = 0;
	var showAddMoreDetials = '<s:property value="profileRequest.showAddMoreDetials"/>' ;	
	
	var max_new_phones = 4;
	var max_new_emails = 2;
	var max_new_addresses = 2;
	var max_new_webpages = 4;
	var max_new_ims = 4;
		
	var phones_list_size='<s:property value="profileRequest.profile.phones.size" />';
	var emails_list_size='<s:property value="profileRequest.profile.emails.size" />';	
	var address_list_Size='<s:property value="profileRequest.profile.addresses.size" />';
	var ims_list_size='<s:property value="profileRequest.profile.ims.size" />';
	var web_list_size='<s:property value="profileRequest.profile.webpages.size" />';
	
	
	if(phones_list_size != null && phones_list_size != '') {
		phones_list_size = parseInt(phones_list_size);
	}
	
	if(phones_list_size < max_new_phones) {
		phoneNumbersListSize = phones_list_size - 1; 
	}
	
	if(emails_list_size != null && emails_list_size != '') {
		emails_list_size = parseInt(emails_list_size);
	}
	
	if(emails_list_size < max_new_emails) {
		emailsListSize = emails_list_size - 1; 
	}
	
	if(address_list_Size != null && address_list_Size != '') {
		address_list_Size = parseInt(address_list_Size);
	} 
	
	if(address_list_Size < max_new_addresses) {
		addressesListSize = address_list_Size - 1;
	}

	if(ims_list_size !=null && ims_list_size != '') {
		ims_list_size = parseInt(ims_list_size);
	} 

	if(ims_list_size < max_new_ims) {
			imsListSize = ims_list_size - 1;
	}
	
	if(web_list_size != null && web_list_size != '') {
		web_list_size = parseInt(web_list_size);		
	} 

	if(web_list_size < max_new_webpages) {
			webPagesListSize = web_list_size - 1;
	}
	
			
</script>

<div id="layer_holder" style="width:850px;height:445px;*height:452px;overflow: auto">
<s:form name="profile_form" theme="simple" id="profile_form">
<div id="container">
	
	<div id="processingMessageDiv" class="processingMessageDiv">
		<img style="margin-left:50px;padding-top:20px;" src="<%=staticContentURL%>styles/images/ics/common/processing.gif" />
		&nbsp;&nbsp;<i>Processing ...</i>
	</div>
		
	<div id="main" class="bodyDiv"> 
		<div id="leftDiv" class="icsinline" style="width:510px;border-right:1px solid rgb(204, 204, 204);">
			<span id="backButtonDiv" style="float:left;padding-bottom:10px;width:510px;height:10px;text-align:left;display:none">
				<h4>< <a href="javascript:hideMoreDetails();">Back</a></h4>				
			</span>
			
			<input type="hidden" id="showAddMoreDetials" name="profileRequest.showAddMoreDetials" />		
			
			<div id="contactInfoMsg" style="margin-top:10px;text-align: left;">
				Please add your contact information so that when you connect with someone via<br/>
				Sync & Connect, your information will be available to share.
			</div>
		    <div id="fieldHolderDiv" style="margin-right:10px;padding-right:25px;">
		    <div id="contentDiv" style="width:490px;padding-top:10px">	
			<div id="firstRowDiv" class="firstRowDiv" align="left">
			  <div id="leftFirstRowDiv" class="icsinline" style="width:360px;">
				<div>
					<div id="firstNameText" class="icsinline" style="width: 145px;text-alignleft;padding-bottom:3px;">
							<strong>First Name</strong>
					</div>
					<div id="lastNameText" class="icsinline" style="width: 145px;margin-left:20px;padding-right:10px;padding-bottom:3px;">
							<strong>Last Name</strong>
					</div>				
				</div>
				<div style="padding-bottom:10px;width:360px;">
					<div>
						<div id="firstNameDiv" class="icsinline" style="padding-right:20px;" >
							<input type="text" style="border:1px solid #A3A5D3" name="profileRequest.profile.firstName" value="<s:property value="profileRequest.profile.firstName"/>" id="firstName" width="254" maxlength="255"/>
							
						</div>
						<div class="icsinline" style="padding-right:10px;">
							<input type="text" style="border:1px solid #A3A5D3" name="profileRequest.profile.lastName" value="<s:property value="profileRequest.profile.lastName"/>" id="lastName" width="254" maxlength="255"/>
					</div>
				</div>
				</div>
				<div style="width:360px;">
				<div>
					<div id="companyNameText" class="icsinline" style="width: 145px;text-alignleft;padding-bottom:3px;">
							<strong>Company Name</strong>
					</div>
					<div id="jobtitle" class="icsinline" style="width: 145px;margin-left:20px;padding-right:10px;padding-bottom:3px;">
							<strong>Job Title</strong>
					</div>			
				</div>
				
				<div style="padding-bottom:20px;*padding-bottom:2px;width:340px;">
					<div id="companyDiv" class="company">
						<div class="icsinline" style="padding-right:20px;">
							<input type="text" style="border:1px solid #A3A5D3" name="profileRequest.profile.orgName" value="<s:property value="profileRequest.profile.orgName"/>" id="companyName" width="254" maxlength="255"/>
						</div>
						<div class="icsinline" style="padding-right:10px;">
							<input type="text" style="border:1px solid #A3A5D3" name="profileRequest.profile.jobTitle" 
							value="<s:property value="profileRequest.profile.jobTitle"/>" id="jobTitle" width="254" maxlength="255"/>
					</div>
			   </div>
				</div>
					
			   </div>
			  </div> <!-- leftFirstRowDiv -->
			  <div id="photoDiv" class="icsinline" style="width:100px;height:120px;padding-top:5px;">  
				   <div>
				   	<s:if test="{icsSessionVO.imageVO == null || icsSessionVO.imageVO.fileName == ' '} ">
						<div>
									<img src="<%=staticContentURL%>/styles/images/ics/provision/emptyProfilePic.jpg" />
						</div>
						<div style="margin-right:10px;">
							<a href='javascript:showAddPicture()' class="layerLauncher::" title="Add Photo">Add Photo</a>
						</div>							
								</s:if>
								<s:else>
						<div>
							<s:url id="storedImageUrl" namespace="/nab/pictures" action="getstoredimage">
								<s:param name="imageVO.fileName" value="icsSessionVO.imageVO.fileName"/>
								<s:param name="imageVO.contentType" value="icsSessionVO.imageVO.contentType"/>
								<s:param name="imageVO.crop" value="icsSessionVO.imageVO.crop"/>
								<s:param name="imageVO.height" value="icsSessionVO.imageVO.height"/>
								<s:param name="imageVO.width" value="icsSessionVO.imageVO.width" />
								<s:param name="imageVO.xcoordinate" value="icsSessionVO.imageVO.xcoordinate"/>
								<s:param name="imageVO.ycoordinate" value="icsSessionVO.imageVO.ycoordinate" />
								<s:param name="outputFormat" value="jsp" />								
								<s:param name="version" value="version"/>
							</s:url>													
							<img width="100px" height="100px" src="<s:property value="%{storedImageUrl}" escape="true"/>"/> 							
						</div>
						<div style="margin-right:10px;">
							<a href='javascript:showAddPicture()' class="layerLauncher::" title="Edit Photo">Edit Photo</a>							 
						</div>
					</s:else>						
				   </div>
			  </div> <!-- end photoDiv -->			   

						  
		   </div> <!-- end of firstRowDiv -->	
	
		   <div id="phoneNumbersDiv" class="phoneNumbers" align="left">	
			   <div id="phoneNumbersList" style="padding-top:5px;padding-bottom:5px;border-color:green;">
					<div style="padding-left:5px;padding-bottom:5px;">
						<span style="clear:left;padding-right:100px;width:200px;">
							<strong>Phone Numbers</strong>
						</span><br/>
					</div>
		
					<s:iterator id="phoneNumbersListIterator" value="profileRequest.profile.phones" status="phoneCounter">												
						<div id="phoneNumberDiv<s:property value="#phoneCounter.index"/>" style="padding-left: 5px;padding-bottom: 5px;width:300px;">
						
						<s:if test="#phoneCounter.index == 1 && profileRequest.showAddMoreDetials == false">
						<div class="icsinline" style="margin-right:20px;">
							<s:select list="#{'mobile-1':'Mobile 1', 'mobile-2':'Mobile 2', 'mobile-3':'Mobile 3', 'mobile-4':'Mobile 4', 'mobile-5':'Mobile 5', 
								'home-1':'Home 1', 'home-2':'Home 2', 'home-3':'Home 3', 'home-4':'Home 4', 'home-5':'Home 5',
								'business-1':'Business1','business-2':'Business 2', 'business-3':'Business 3', 'business-4':'Business 4', 'business-5':'Business 5',								
								 'pager-1':'Pager 1', 'pager-2':'Pager 2', 'pager-3':'Pager 3', 'pager-4':'Pager 4', 'pager-5':'Pager 5',
								 'other-1':'Other 1', 'other-2':'Other 2', 'other-3':'Other 3', 'other-4':'Other 4', 'other-5':'Other 5'}" 																 	
								 	name="profileRequest.profile.phones[%{#phoneCounter.index}].type"								
									id="phoneNumberType%{#phoneCounter.index}"/>
							</div>
							<div class="icsinline">
								<input id="phoneNum<s:property value="#phoneCounter.index"/>" type="text"  
										name="profileRequest.profile.phones[<s:property value="#phoneCounter.index"/>].number" maxlength="48" width="254" 
										/>
										
							</div>
							<div class="icsinline" style="padding-right:20px;">
								<a id="phoneNumberAnchor<s:property value="#phoneCounter.index"/>" 
										style="display:none;text-align:left;width:10px;padding-top:3px;padding-left:2px;" 
										href="javascript:clearField('phoneNum<s:property value="#phoneCounter.index"/>');" >X</a>
							</div>
						</s:if>
						<s:else>
							<div class="icsinline" style="margin-right:20px;">	
							<s:select list="#{'home-1':'Home 1', 'home-2':'Home 2', 'home-3':'Home 3', 'home-4':'Home 4', 'home-5':'Home 5', 
								'business-1':'Business1','business-2':'Business 2', 'business-3':'Business 3', 'business-4':'Business 4', 'business-5':'Business 5',								
								 'mobile-1':'Mobile 1', 'mobile-2':'Mobile 2', 'mobile-3':'Mobile 3', 'mobile-4':'Mobile 4', 'mobile-5':'Mobile 5',
								 'pager-1':'Pager 1', 'pager-2':'Pager 2', 'pager-3':'Pager 3', 'pager-4':'Pager 4', 'pager-5':'Pager 5',
								 'other-1':'Other 1', 'other-2':'Other 2', 'other-3':'Other 3', 'other-4':'Other 4', 'other-5':'Other 5'}" 																 	
								 	name="profileRequest.profile.phones[%{#phoneCounter.index}].type"								
									id="phoneNumberType%{#phoneCounter.index}"/>
						</div>
							<div class="icsinline">
									<input id="phoneNum<s:property value="#phoneCounter.index"/>" type="text" 
										name="profileRequest.profile.phones[<s:property value="#phoneCounter.index"/>].number" maxlength="48" width="254"
										value="<s:property value="profileRequest.profile.phones[#phoneCounter.index].number"/>"/>
							</div>
							<div class="icsinline" style="margin-right:20px;">
								<a  id="phoneNumberAnchor<s:property value="#phoneCounter.index"/>" 
									style="display:none;text-align:left;width:10px;padding-top:3px;padding-left:2px;"
									 href="javascript:clearField('phoneNum<s:property value="#phoneCounter.index"/>');" >X</a>
							</div>
								</s:else>
						</div>			
					</s:iterator>					
				</div>
				<div id="addNewPhoneNumberDiv" style="padding-left:5px;padding-bottom:5px;display:none;width:300px;">
	   				<br/><a href="javascript:addNewPhoneNumber();" style="text-align:left;">+New Number</a>
		   		</div>					
			</div>
			
			<div id="emailsDiv" class="emails">	  
				<div id="emailsList" style="margin-top:5px;padding-bottom:5px;" align="left">
					<div style="margin-left: 5px;margin-bottom: 5px">
							<strong>Email</strong>
					</div>				
					<s:iterator id="emailsListIterator" value="profileRequest.profile.emails" status="emailCounter">	
					   <div id="emailDiv<s:property value="#emailCounter.index"/>" style="float:left;padding-bottom:5px;width:300px;">
							<div style="padding-left: 5px;">
							<s:if test="#emailCounter.index == 1 && profileRequest.showAddMoreDetials == false">
								<div class="icsinline" style="padding-right:20px;">
									<s:select list="#{'personal-1':'Personal 1',  
										'business-1':'Business 1',  
										'other-1':'Other 1'}" 																 	
								 		name="profileRequest.profile.emails[%{#emailCounter.index}].type"								
											id="emailType%{#emailCounter.index}"/>
								</div>
								<div class="icsinline">
									<input id="email<s:property value="#emailCounter.index"/>" type="text" 
										name="profileRequest.profile.emails[<s:property value="#emailCounter.index"/>].address" 
										value="" width="254" maxlength="255"/>									
								</div>		
								<div class="icsinline" style="padding-right:20px;">
									<a id="emailAnchor<s:property value="#emailCounter.index"/>" 
										href="javascript:clearField('email<s:property value="#emailCounter.index"/>');" 
										style="display:none;float:right;text-align:left;width:10px;padding-top:3px;padding-left:2px;">X</a>
								</div>					
									</s:if>
									<s:else>
								<div class="icsinline" style="padding-right:20px;">
									<s:select list="#{'personal-1':'Personal 1', 
									'business-1':'Business 1', 
									'other-1':'Other 1'}" 																 	
								 		name="profileRequest.profile.emails[%{#emailCounter.index}].type"								
										id="emailType%{#emailCounter.index}"/>
								</div>
								<div class="icsinline">	
										<input id="email<s:property value="#emailCounter.index"/>"type="text" 
										name="profileRequest.profile.emails[<s:property value="#emailCounter.index"/>].address" maxlength="255"
										value="<s:property value="profileRequest.profile.emails[#emailCounter.index].address"/>" />
								</div>
								<div class="icsinline" style="">
									<a id="emailAnchor<s:property value="#emailCounter.index"/>" 
										href="javascript:clearField('email<s:property value="#emailCounter.index"/>');" 
										style="display:none;text-align:left;width:10px;padding-top:3px;padding-left:2px;">X</a>
								</div>
									</s:else> 
					</div>
			   </div>
					</s:iterator>
				</div>
				<div id="newEmailDiv" style="padding-left:5px;padding-bottom:5px;display:none;width:300px;">
		   			<a href="javascript:addNewEmail();" style="text-align:left;">+New Email</a>
			</div>
			</div> <!-- end of emailsDiv -->
			 			 
			<div id="addressesDiv" style="width:490px;display:none;padding-top:5px;padding-bottom:10px;border-bottom:2px dotted #CCCCCC;" align="left">
			  <div id="addressesList" style="margin-top:5px;padding-bottom:10px;">
					<div style="padding-left: 5px;">
					<div style="padding-right:200px;">
						<strong>Address</strong>
					</div>
				</div><br>
				
				<s:iterator id="addressListIterator" value="profileRequest.profile.addresses" status="addressCounter">
				 <div id="address<s:property value="#addressCounter.index"/>">
					<div style="clear:left;padding-left:109px;text-align:left;">
						<div style="padding-right:80px;">
							<strong>Street Address</strong>
						</div>
					</div>
					
					<div id="addressTypeStreetDiv<s:property value="#addressCounter.index"/>" style="clear: left; padding-left: 5px;">
						<div class="icsinline" style="padding-right:13px;">
							<s:select list="#{'home-1':'Home 1', 'business-1':'Business 1', 'other-1':'Other 1'}" 																 	
						 		name="profileRequest.profile.addresses[%{#addressCounter.index}].type"								
								id="addressType%{#addressCounter.index}" />
						</div>
						<div class="icsinline" style="padding-right:10px;">
							<input type="text" name="profileRequest.profile.addresses[<s:property value="#addressCounter.index"/>].street" 
								id="street<s:property value="#addressCounter.index"/>" style="width:200px;border:1px solid #A3A5D3" maxlength="255" 
								value="<s:property value="profileRequest.profile.addresses[#addressCounter.index].street"/>" />
								<a href="javascript:clearField('street<s:property value="#addressCounter.index"/>');" >X</a>
						</div>
					</div>  <!-- end of addressTypeStreetDiv -->
	
					<div id="cityAddressDiv" style="padding-left:108px;padding-top:10px;text-align:left;width:400px;">
						<div class="icsinline" style="padding-right:105px;text-align:left;">
							<strong>City/Region</strong>
						</div>
						<div class="icsinline" style="padding-right:30px;text-align:left;">
							<strong>State</strong>
						</div>
						<div class="icsinline" style="padding-right:5px;text-align:left;">
							<strong>Zipcode</strong>
						</div>						
					</div> <!-- end of cityAddressDiv -->
										
					<div id="cityStateZipDiv<s:property value="#addressCounter.index"/>" style="padding-left: 110px;">
						<div class="icsinline" style="padding-right:10px;">
							<input type="text" style="border:1px solid #A3A5D3" name="profileRequest.profile.addresses[<s:property value="#addressCounter.index"/>].city" 
							value="<s:property value="profileRequest.profile.addresses[#addressCounter.index].city"/>" 
							id="city<s:property value="#addressCounter.index"/>" maxlength="255"/>
							<a href="javascript:clearField('city<s:property value="#addressCounter.index"/>');" >X</a>
						</div>
						<div class="icsinline" style="padding-right:10px;">
							<s:select name="profileRequest.profile.addresses[%{#addressCounter.index}].state"								
							id="state%{#addressCounter.index}"
							list="#{'AL':'AL', 'AK':'AK', 'AZ':'AZ', 'AR':'AR', 'CA':'CA', 'CO':'CO', 'CT':'CT', 'DE':'DE', 'FL':'FL', 
									'GA':'GA', 'HI':'HI', 'ID':'ID', 'IL':'IL', 'IN':'IN', 'IA':'IA', 'KS':'KS', 'KY':'KY', 'LA':'LA', 
									'ME':'ME', 'MD':'MD', 'MA':'MA', 'MI':'MI', 'MN':'MN', 'MS':'MS', 'MO':'MO', 'MT':'MT', 'NE':'NE', 
									'NV':'NV', 'NH':'NH', 'NJ':'NJ', 'NM':'NM', 'NY':'NY', 'NC':'NC', 'ND':'ND', 'OH':'OH', 'OK':'OK', 
									'OR':'OR', 'PA':'PA', 'RI':'RI', 'SC':'SC', 'SD':'SD', 'TN':'TN', 'TX':'TX', 'UT':'UT', 'VT':'VT', 
									'VA':'VA', 'WA':'WA', 'WV':'WV', 'WI':'WI', 'WY':'WY'}"
							/>												
						</div>
						<div class="icsinline" style="padding-right:10px;width:110px;">
							<input type="text" name="profileRequest.profile.addresses[<s:property value="#addressCounter.index"/>].zipCode" style="width: 90px;border:1px solid #A3A5D3" 
							value="<s:property value="profileRequest.profile.addresses[#addressCounter.index].zipCode"/>"
							 id="zipCode<s:property value="#addressCounter.index"/>" maxlength="11" style="width:50px;border:1px solid #A3A5D3"/>
							<a href="javascript:clearField('zipCode<s:property value="#addressCounter.index"/>');" style="clear:right;text-align:left;">X</a>
						</div>
					</div>	
				 </div>
				</s:iterator>
			  </div>	<!-- end of addressesList -->			
			  <div id="newAddressDiv" style="clear:left;padding-top:5px;padding-bottom:20px;text-align:left">
		   			<a href="javascript:addNewAddress();" style="text-align:left">+New Address</a>
		   	  </div>							
		    </div>	<!-- end of addressesDiv -->	
			
			<div  id="messagesAndwebpagesDiv" 
			style="display:none;padding-top:5px;padding-bottom:5px;width:490px;border-bottom:2px dotted #CCCCCC;" align="left">
		   		<div style="padding-left: 5px;padding-bottom:5px;">
						<strong>Messaging & Websites</strong>
				</div>	
				<div id="holderDiv">		   
			   <div class="icsinline" id="imsDiv" style="vertical-align: top;margin-top:5px;padding-bottom:10px;width:220px;">
			   	<div id="imsListDiv" style="padding-bottom:5px;width:220px;">
					<div style="padding-left: 5px;">
						<div style="">
							<strong>IM</strong>
						</div>
					</div>
					<s:iterator id="imsListIterator" value="profileRequest.profile.ims" status="imsCounter">
						<div id="ims<s:property value="#imsCounter.index"/>" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px; clear: left;">
							<div class="icsinline" style="width:70px;padding-right:5px;">
								<s:select list="#{'msn':'MSN', 'yahoo':'Yahoo', 'google':'Google', 
								'aol':'AOL', 'icq':'ICQ', 'skype':'Skype', 'jabber':'Jabber', 'other':'Other'}" 															 	
					 			name="profileRequest.profile.ims[%{#imsCounter.index}].type"								
								id="ims%{#imsCounter.index}" />
							</div>
							<div class="icsinline" >
								<input type="text" name="profileRequest.profile.ims[<s:property value="#imsCounter.index"/>].address" 
								 value="<s:property value="profileRequest.profile.ims[#imsCounter.index].address"/>" 
								 id="imsAddress<s:property value="#imsCounter.index"/>" 
								 style="width:100px;border:1px solid #A3A5D3" maxlength="255"/>
								 
							</div>
							<div class="icsinline" >
								<a class="imweb" href="javascript:clearField('imsAddress<s:property value="#imsCounter.index"/>');" >X</a>
						</div>
					</div>
					</s:iterator>
				</div> <!-- end of  imsListDiv-->	   		 	
				<div id="addNewImsDiv" style="padding-top:5px;padding-bottom:5px;text-align:left;width:210px;">
		   			<a href="javascript:addNewIms();" style="text-align:left">+New Messaging Account</a>
		   	   	</div>
					   		 	
			   </div> <!-- end of imsDiv --> 

			   <div class="icsinline" id="webpagesDiv" style="padding-top:5px;width:260px;vertical-align: top;" align="left">
			     <div id="webpagesListDiv" style="padding-bottom:5px;width:260px;">
			   		<div style="padding-left: 10px;">
						<div style="padding-right:10px;padding-bottom:5px;">
							<strong>Websites</strong>
						</div>
					</div>						
					<s:iterator id="webpagesListIterator" value="profileRequest.profile.webpages" status="webpagesCounter">
						<div id="webPages<s:property value="#webpagesCounter.index"/>" style=";padding-left: 5px;">
							<div class="icsinline" style="width:78px;padding-right:5px;">
								<s:select list="#{'personal':'Personal', 'business':'Business'}" 															 	
					 			name="profileRequest.profile.webpages[%{#webpagesCounter.index}].type"								
								id="webpages%{#webpagesCounter.index}" cssStyle="width:80px;"/>
						</div>
							<div class="icsinline" >
								<input type="text" name="profileRequest.profile.webpages[<s:property value="#webpagesCounter.index"/>].url" 
								 value="<s:property value="profileRequest.profile.webpages[#webpagesCounter.index].url"/>" 
								 id="url<s:property value="#webpagesCounter.index"/>" maxlength="1000" style="width:140px;border:1px solid #A3A5D3"/>
								</div>
							<div class="icsinline" > 
								 <a class="imweb" href="javascript:clearField('url<s:property value="#webpagesCounter.index"/>');" >X</a>
						</div>					
					</div>				
					</s:iterator>
				 </div> <!-- end of webpagesListDiv -->
				 <div id="addNewWebpageDiv" style="padding-top:5px;padding-bottom:5px;padding-left:10px;text-align:left;width:270px;">
		   			<a href="javascript:addWebpages();">+New Website</a>
		   	   	 </div>	
			   </div> <!-- end of webpagesDiv --> 			  
			    </div> <!-- end of holderDiv --><br/>

		   	  			 
		  </div> <!-- end of messagesAndwebpagesDiv  -->
		  
			<div id="notesAndOthersDiv" style="padding-bottom:5px;display:none" align="left">	  
				<div id="dobParentDiv" style="margin-top:5px;padding-bottom:10px;">
					<div style="padding-right:200px;padding-bottom:10px;padding-left: 5px;">
							<strong>Notes & Other</strong>
					</div>				
				<!--  	<div style="float:left;padding-left: 5px;">
						<span style="float:left;padding-right:200px;padding-bottom:5px;">
							<strong>Date of Birth</strong>
						</span>
					</div><br>			
				   <div id="dobDiv" style=";padding-left:5px;padding-right:10px;padding-bottom:5px;">
				   		<span style="float:left;padding-right:5px;width:170px;">
				   			<input name="profileRequest.profile.birthday" id="date" class="date-pick" readonly="readonly" 
				   			value="<s:property value="profileRequest.profile.birthday"/>"/>				   		
						</span>						   	
				   </div> --> 	<!-- end of dobDiv -->
			</div>	<!-- dobParentDiv -->   
			
			<div id="notesDiv">
				
					<div style="padding-left:5px;padding-right:200px;padding-bottom:5px;">
							<strong>Notes</strong>
			   </div>
			   
			    <div id="notesTextDiv" style="float:left;padding-left: 5px;padding-right:10px;">			  
<s:textarea id="notes" rows="4" cols="30" name="profileRequest.profile.note" 
onchange="return imposeNotesMaxLength();" onkeypress="return imposeNotesMaxLength();" 
onkeyup="return imposeNotesMaxLength();" onmouseover="return imposeNotesMaxLength();"></s:textarea> 
<!-- <a href="javascript:clearField('notes');" >X</a> -->
			
				</div> <!-- end of notesTextDiv -->	
			</div>	<!-- end of notesDiv -->					   									
			</div> <!-- end of notesAndOthersDiv -->		
			 
		  </div> <!-- end of contentDiv -->
		  
		  <div id="buttonsErrorDiv1" style="display:none;float:left;width:400px;margin-left:6px;
				border: 1px solid red;margin-bottom:10px;white-space: nowrap;padding:2px;text-align:left">
			 <div class="icsinline">
				<img alt="Error" src="<%=staticContentURL%>styles/images/ics/provision/error_alert.gif" /> 		
			 </div>
			 <div class= "icsinline" style="color: red">
				First Name or Last Name or Company Name is required.   
			 </div>				
		  </div>
		  <div id="buttonsErrorDiv2" style="display:none;float:left;width:400px;margin-left:6px;
				border: 1px solid red;margin-bottom:10px;white-space: nowrap;padding:2px;text-align:left">
			 <div class="icsinline">
				<img alt="Error" src="<%=staticContentURL%>styles/images/ics/provision/error_alert.gif" /> 		
			 </div>
			 <div class= "icsinline" style="color: red">
				Phone or Email or Address is required.   
			 </div>				
		  </div>		  
		  
		  <div id="buttonsDiv" style="width:490px;margin-bottom:15px;display:block;">
				<div class="icsinline" id="addMoreDetailsDiv" style="padding-left: 10px;padding-right:230px;" align="left">
					<a href="javascript:addMoreDetails();" class="a" style="margin-right:15px"><span><span><span>+Add More Details</span></span></span></a>
				</div>
				<div class="icsinline" id="continueToICSButtonDiv" align="right" style="margin-left: 350px;width:150px">
					<a href="javascript:continueToICS();" class="button" id="continueButton"><span class="red"><span><span>Go to Sync & Connect</span></span></span></a>
				</div>
		  </div>
		</div>	
		</div> <!-- end of leftDiv -->
		  
		<div id="rightDiv" class="icsinline" style="vertical-align:top;width:255px;height:382px;*height:387px;margin-left:10px;margin-top:15px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">

						<div style="margin:5px; text-align: left ;word-wrap:break-word;">
						<strong>Sync & Connect Can Connect Profiles.</strong>
						<br/><br/>  	
		  		One feature of Sync & Connect is how it can connect profiles of other Sync & Connect users. When you connect with other users' profiles, you'll store their contact information in your address book. If they change their profiles, your address book will automatically update. 
		</div>		
		  		
		</div>		
</s:form>
</div>

<script src="<%=staticContentURL%>scripts/provisioning/jquery.min.js"></script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/date.js"></script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/jquery.datePicker.js"></script>



<script type="text/javascript">

function onPageLoad() {	
	changeTitle();
	if(showAddMoreDetials == 'true') {
		addMoreDetails();
	}else {
		hideMoreDetails();
	}
}

function changeTitle() {
		parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Set Up Profile');
}

function continueToICS() {
		var firstName = document.getElementById("firstName").value;
		var lastName = document.getElementById("lastName").value;
		var companyName	= document.getElementById("companyName").value;
		var email0	= document.getElementById("email0").value;
		var email1	= document.getElementById("email1").value;
		var phoneNum0	= document.getElementById("phoneNum0").value;
		var phoneNum1	= document.getElementById("phoneNum1").value;
		var street0	= document.getElementById("street0").value;
		var city0	= document.getElementById("city0").value;
		var state0	= document.getElementById("state0").value;
		
		firstName = trim(firstName);
		lastName = trim(lastName);
		companyName = trim(companyName);
		email0 = trim(email0);
		email1 = trim(email1);
		phoneNum0 = trim(phoneNum0);
		phoneNum1 = trim(phoneNum1);
		
		if(firstName == '' && lastName == '' && companyName == '') 
		{
			document.getElementById("buttonsErrorDiv1").style.display="block";
			document.getElementById("buttonsErrorDiv2").style.display="none";
			//document.getElementById("buttonsDiv").style.display="none";						
			document.getElementById("firstName").style.border="1px solid red";
			document.getElementById("lastName").style.border="1px solid red";
			document.getElementById("companyName").style.border="1px solid red";
			document.getElementById("firstNameText").style.color="red";
			document.getElementById("lastNameText").style.color="red";
			document.getElementById("companyNameText").style.color="red";
			document.getElementById("email0").style.border="1px solid #A3A5D3";
			document.getElementById("phoneNum0").style.border="1px solid #A3A5D3";
			document.getElementById("email0").style.color="";
			document.getElementById("phoneNum0").style.color="";
			document.getElementById("street0").style.border="1px solid #A3A5D3";
			document.getElementById("street0").style.color="";
			document.getElementById("city0").style.border="1px solid #A3A5D3";
			document.getElementById("city0").style.color="";
			document.getElementById("state0").style.border="1px solid #A3A5D3";
			document.getElementById("state0").style.color="";	
			return ;

		}
		else if(email0 == '' && email1 == '' && phoneNum0 == '' &&  phoneNum1 == '' && street0 == '' && city0 == ''){
			document.getElementById("buttonsErrorDiv2").style.display="block";
			document.getElementById("buttonsErrorDiv1").style.display="none";
			//document.getElementById("buttonsDiv").style.display="none";						
			document.getElementById("email0").style.border="1px solid red";
			document.getElementById("email0").style.color="red";
			document.getElementById("phoneNum0").style.border="1px solid red";
			document.getElementById("phoneNum0").style.color="red";
			document.getElementById("street0").style.border="1px solid red";
			document.getElementById("street0").style.color="red";
			document.getElementById("city0").style.border="1px solid red";
			document.getElementById("city0").style.color="red";		
			document.getElementById("state0").style.border="1px solid red";
			document.getElementById("state0").style.color="red";
			document.getElementById("firstName").style.border="1px solid #A3A5D3";
			document.getElementById("lastName").style.border="1px solid #A3A5D3";
			document.getElementById("companyName").style.border="1px solid #A3A5D3";
	//		document.getElementById("firstNameText").style.color="";
	//		document.getElementById("lastNameText").style.color="";
	//		document.getElementById("companyNameText").style.color="";
			return ;		
		}
		else {

			var contentType = '<s:property value="imageVO.contentType" escape="true"/>';
			var fileName = '<s:property value="imageVO.fileName" escape="true"/>';
			var version= '<s:property value="version" escape="true"/>';
			
			var url = 'profileRequest.outputFormat=jsp'+
						'&profileRequest.source=provision'+
						'&imageVO.contentType='+contentType+
						'&imageVO.fileName='+fileName+
						'&version='+version;
						
			document.forms[0].action='<s:url value="/provisioning/modifyUserProfile.action?'+url+'"/>';
			document.forms[0].submit(); 
			document.getElementById("container").className="processing";											
		} 
}

function showAddPicture() {
	document.forms[0].action= '<s:url value="/provisioning/showAddPicture.action"/>' ;
	document.forms[0].submit(); 
	document.getElementById("container").className="processing";		
}

function addMoreDetails() {
		var phones_list_size='<s:property value="profileRequest.profile.phones.size" />';
		if(phones_list_size !=null && phones_list_size != '') {
			phones_list_size = parseInt(phones_list_size);
			if(phones_list_size >= max_new_phones || phoneNumbersListSize >= max_new_phones) {
				document.getElementById("addNewPhoneNumberDiv").style.display="none";				
			} else{
		document.getElementById("addNewPhoneNumberDiv").style.display="block";
			}
		} 
	
		for(var i=0;i<phones_list_size;i++) {	
			if(document.getElementById("phoneNumberAnchor"+i) != null)
				document.getElementById("phoneNumberAnchor"+i).style.display="block";			
		}

		if(document.getElementById("phoneNumberDiv2") !=null) {
			document.getElementById("phoneNumberDiv2").style.display="block";
		}
		
		if(document.getElementById("phoneNumberDiv3") !=null) {
			document.getElementById("phoneNumberDiv3").style.display="block";
		}		
		
		var email_list_size='<s:property value="profileRequest.profile.emails.size" />';
		if(email_list_size !=null && email_list_size != '') {
			email_list_size = parseInt(email_list_size);
			if(email_list_size >= 2 || emailsListSize  >= 2) {
				document.getElementById("newEmailDiv").style.display="none";
			} else {
		                document.getElementById("newEmailDiv").style.display="block";
			}	
		} 
	
		for(i=0;i<email_list_size;i++) {	
			if(document.getElementById("emailAnchor"+i) != null)
				document.getElementById("emailAnchor"+i).style.display="block";
		}
			
		var address_list_size='<s:property value="profileRequest.profile.addresses.size" />';
		if(address_list_size !=null && address_list_size != '') {
			address_list_size = parseInt(address_list_size);			
			if(address_list_size >= 2 || addressesListSize >= 1 ) {
				document.getElementById("newAddressDiv").style.display="none";
			} else {
				document.getElementById("newAddressDiv").style.display="block";
			}			
		} 
	
		var ims_list_size='<s:property value="profileRequest.profile.ims.size" />';
		if(ims_list_size !=null && ims_list_size != '') {
			ims_list_size = parseInt(ims_list_size);
			if(ims_list_size >= 4 || imsListSize >= 3)
			{
				document.getElementById("addNewImsDiv").style.display="none";
			} else {
				document.getElementById("addNewImsDiv").style.display="block";
			}			
		} 

		var web_list_size='<s:property value="profileRequest.profile.webpages.size" />';
		if(web_list_size !=null && web_list_size != '') {
			web_list_size = parseInt(web_list_size);
			if(web_list_size >= 4 || webPagesListSize >= 3) {
				document.getElementById("addNewWebpageDiv").style.display="none";
			} else {
				document.getElementById("addNewWebpageDiv").style.display="block";
			}				
		} 

			
		document.getElementById("addressesDiv").style.display="block";
		document.getElementById("messagesAndwebpagesDiv").style.display="block";
		document.getElementById("notesAndOthersDiv").style.display="block";
		document.getElementById("backButtonDiv").style.display="block";
		document.getElementById("addMoreDetailsDiv").style.display="none";
		document.getElementById("showAddMoreDetials").value=true;
		document.getElementById("phoneNumberAnchor1").style.display="block";
		document.getElementById("phoneNumberAnchor1").width="10px";
		document.getElementById("emailAnchor1").style.display="block";
		document.getElementById("contactInfoMsg").style.display="none";
		//document.getElementById("detailPhotoDiv").style.display="block";
		document.getElementById("photoDiv").className="";
		document.getElementById("phoneNumbersDiv").className="phoneNumbersWide";
		document.getElementById("emailsDiv").className="emailsWide";
		document.getElementById("companyDiv").className="companyWide";
		document.getElementById("firstRowDiv").className="firstRowDivDetail";
		
}
		
function hideMoreDetails()
{
		document.getElementById("addNewPhoneNumberDiv").style.display="none";
		document.getElementById("newEmailDiv").style.display="none";
			
		if(document.getElementById("phoneNumberDiv2") !=null)
			document.getElementById("phoneNumberDiv2").style.display="none";

		if(document.getElementById("phoneNumberDiv3") !=null)
			document.getElementById("phoneNumberDiv3").style.display="none";
			
		if(document.getElementById("phoneNumberAnchor0") != null)	
			document.getElementById("phoneNumberAnchor0").style.display="none";
		
		if(document.getElementById("phoneNumberAnchor1") != null)	
			document.getElementById("phoneNumberAnchor1").style.display="none";
		
		if(document.getElementById("emailAnchor0") != null)
			document.getElementById("emailAnchor0").style.display="none";
			
		if(document.getElementById("emailAnchor1") != null)	
			document.getElementById("emailAnchor1").style.display="none";
		
		document.getElementById("addressesDiv").style.display="none";
		document.getElementById("messagesAndwebpagesDiv").style.display="none";
		document.getElementById("notesAndOthersDiv").style.display="none";
		document.getElementById("continueButton").style.paddingLeft="0px";
		document.getElementById("addMoreDetailsDiv").style.display="block";		
		document.getElementById("backButtonDiv").style.display="none";
		document.getElementById("showAddMoreDetials").value=false;
		document.getElementById("phoneNumberAnchor1").style.display="none";
		document.getElementById("emailAnchor1").style.display="none";
		document.getElementById("contactInfoMsg").style.display="block";
		document.getElementById("photoDiv").className="icsinline";
	//	document.getElementById("detailPhotoDiv").style.display="none";
		document.getElementById("phoneNumbersDiv").className="phoneNumbers";
		document.getElementById("emailsDiv").className="emails";
		document.getElementById("companyDiv").className="company";
		document.getElementById("firstRowDiv").className="firstRowDiv";
}

function addNewPhoneNumber() {

	var phones_list_size='<s:property value="profileRequest.profile.phones.size" />';
	if(phones_list_size !=null && phones_list_size != '') {
		phones_list_size = parseInt(phones_list_size);
	} 
	if(phoneNumbersListSize < 3 && phones_list_size < 4) 
	{
		phoneNumbersListSize = phoneNumbersListSize +1 ;	 
		
		var dynaPhoneNumberDivContent = 	
			'<div class="icsinline" style="margin-right:20px;">' +
				'<select id="phoneType'+phoneNumbersListSize+'" name="profileRequest.profile.phones['+phoneNumbersListSize+'].type">' +
					'<option label="Home 1" value="home-1">Home 1</option>' +
					'<option label="Home 2" value="home-2">Home 2</option>' +
					'<option label="Home 3" value="home-3">Home 3</option>' +
					'<option label="Home 4" value="home-4">Home 4</option>' +
					'<option label="Home 5" value="home-5">Home 5</option>' +
					'<option label="Business 1" value="business-1">Business 1</option>' +
					'<option label="Business 2" value="business-2">Business 2</option>' +
					'<option label="Business 3" value="business-3">Business 3</option>' +
					'<option label="Business 4" value="business-4">Business 4</option>' +
					'<option label="Business 5" value="business-5">Business 5</option>' +
					'<option label="Mobile 1" value="mobile-1">Mobile 1</option>' +
					'<option label="Mobile 2" value="mobile-2">Mobile 2</option>' +
					'<option label="Mobile 3" value="mobile-3">Mobile 3</option>' +
					'<option label="Mobile 4" value="mobile-4">Mobile 4</option>' +
					'<option label="Mobile 5" value="mobile-5">Mobile 5</option>' +
					'<option label="Pager 1" value="pager-1">Pager 1</option>' +
					'<option label="Pager 2" value="pager-2">Pager 2</option>' +
					'<option label="Pager 3" value="pager-3">Pager 3</option>' +
					'<option label="Pager 4" value="pager-4">Pager 4</option>' +
					'<option label="Pager 5" value="pager-5">Pager 5</option>' +
					'<option label="Other 1" value="other-1">Other 1</option>' +
					'<option label="Other 2" value="other-2">Other 2</option>' +
					'<option label="Other 3" value="other-3">Other 3</option>' +
					'<option label="Other 4" value="other-4">Other 4</option>' +
					'<option label="Other 5" value="other-5">Other 5</option>' +
				'</select>' +
			'</div>' ;
		
		
		var newDiv  = document.createElement("div");
		newDiv.id="phoneNumberDiv"+phoneNumbersListSize;
		
		newDiv.style.paddingLeft="5px";
		newDiv.style.paddingBottom="5px";	
		newDiv.style.width="300px";
		newDiv.innerHTML = dynaPhoneNumberDivContent;	
		
		var newSpan = document.createElement("div");
		
		newSpan.className = "icsinline";
		
		
		var newInput = document.createElement("input");
		newInput.setAttribute("type", "text");
		newInput.setAttribute("name", "profileRequest.profile.phones["+phoneNumbersListSize+"].number");
		newInput.setAttribute("id", "phoneNum"+phoneNumbersListSize);
		newInput.setAttribute("maxLength", "48");
		
		var newhrefdiv = document.createElement("div");
		newhrefdiv.className = "icsinline";
		var newAnchor = document.createElement("a");
		newAnchor.setAttribute("href", "javascript:clearField(\"phoneNum"+phoneNumbersListSize+"\");");
		newAnchor.setAttribute("id", "phoneNumberAnchor"+phoneNumbersListSize);
		newAnchor.style.paddingLeft="3px";
		
		var newTextNode = document.createTextNode("X");
		newAnchor.appendChild(newTextNode);
		
		newSpan.appendChild(newInput);
		newhrefdiv.appendChild(newAnchor);
		newDiv.appendChild(newSpan);
		newDiv.appendChild(newhrefdiv);
		
		document.getElementById("phoneNumbersList").appendChild(newDiv);
		
		if(phoneNumbersListSize == 3)
		{
			document.getElementById("addNewPhoneNumberDiv").style.display="none";
		}
	}
}

function addNewEmail() {
	var emails_list_size='<s:property value="profileRequest.profile.emails.size" />';
	if(emails_list_size !=null && emails_list_size != '') {
		emails_list_size = parseInt(emails_list_size);
	} 
	if(emailsListSize < 2 && emails_list_size < 2) 
	{
		emailsListSize = emailsListSize +1 ;	 
		
		var dynaEmailDivContent = 	
			'<div class="icsinline" style="padding-right:23px;">' +
				'<select id="emailType'+emailsListSize+'" name="profileRequest.profile.emails['+emailsListSize+'].type">' +
					'<option label="Personal 1" value="personal-1">Personal 1</option>' +
					'<option label="Business 1" value="business-1">Business 1</option>' +
					'<option label="Other 1" value="other-1">Other 1</option>' +
				'</select>' +
			'</div>' ;
				
		var newDiv  = document.createElement("div");
		newDiv.id="emailDiv"+emailsListSize;
		newDiv.style.paddingLeft="5px";
		newDiv.style.paddingBottom="5px";	
		newDiv.style.width="300px";
		newDiv.innerHTML = dynaEmailDivContent;	
			
		var newSpan = document.createElement("div");
		newSpan.className="icsinline";
		newSpan.style.paddingRight="10px";
		
		var newInput = document.createElement("input");
		newInput.setAttribute("type", "text");
		newInput.setAttribute("name", "profileRequest.profile.emails["+emailsListSize+"].address");
		newInput.setAttribute("id", "email"+emailsListSize);
		newInput.setAttribute("maxLength", "255");
		
		var newAnchor = document.createElement("a");
		newAnchor.setAttribute("href", "javascript:clearField(\"email"+emailsListSize+"\");");
		newAnchor.style.paddingLeft="3px";
		
		var newTextNode = document.createTextNode("X");
		newAnchor.appendChild(newTextNode);
		
		newSpan.appendChild(newInput);
		newSpan.appendChild(newAnchor);
		newDiv.appendChild(newSpan);
		
						
		document.getElementById("emailsList").appendChild(newDiv);
		
		if(emailsListSize == 1)
		{
			document.getElementById("newEmailDiv").style.display="none";
		}
		
	}
}

function addNewAddress() {
	if(addressesListSize < max_new_addresses) 
	{
		addressesListSize = addressesListSize +1 ;	 
		
		var newDiv  = document.createElement("div");
		newDiv.id="address"+addressesListSize;
	
		newDiv.style.paddingBottom="5px";
		newDiv.style.paddingTop="5px";	
		
		var streetLableDiv = 
			'<div style="clear:left;padding-left:109px;text-align:left;">'+
						'<div style="padding-right:80px;">'+
							'<strong>Street Address</strong>'+
						'</div>'+
					'</div>';
		newDiv.innerHTML+=streetLableDiv;			
		var addressTypeStreetDiv = document.createElement("div");
		addressTypeStreetDiv.setAttribute("id", "addressTypeStreetDiv"+addressesListSize);
		addressTypeStreetDiv.style.clear="left";
		addressTypeStreetDiv.style.paddingLeft="5px";
					
		var spanSelect = document.createElement("div");
		spanSelect.className = "icsinline"
		spanSelect.style.paddingRight="13px";
		
		var selectAddressType = 
							'<select id="addressType" name="profileRequest.profile.addresses['+addressesListSize+'].type">'+
							'<option label="Home 1" value="home-1">Home 1</option>' +
							'<option label="Business 1" value="business-1">Business 1</option>'+
							'<option label="Other 1" value="other-1">Other 1</option>'+
					'</select>	';
		spanSelect.innerHTML += selectAddressType;
		addressTypeStreetDiv.appendChild(spanSelect);
					
		var streetSpan = document.createElement("div");
		streetSpan.className = "icsinline";
		
		streetSpan.style.paddingRight="10px";
		
		var streetInput = document.createElement("input");
		streetInput.setAttribute("type", "text");
		streetInput.setAttribute("Name", "profileRequest.profile.addresses["+addressesListSize+"].street");
		streetInput.setAttribute("id", "street"+addressesListSize);
		streetInput.setAttribute("maxLength", "255");
		streetInput.style.width="200px";
		
		var streetAnchor = document.createElement("a");
		streetAnchor.setAttribute("href", "javascript:clearField(\"street"+addressesListSize+"\");");
		streetAnchor.style.paddingLeft="5px";
		var newStateTextNode = document.createTextNode("X");
		streetAnchor.appendChild(newStateTextNode);
				
		streetSpan.appendChild(streetInput);
		streetSpan.appendChild(streetAnchor);
		addressTypeStreetDiv.appendChild(streetSpan);
	
		newDiv.appendChild(addressTypeStreetDiv);
	
		var cityAddressDiv = 
				'<div id="cityAddressDiv" style="padding-left: 108px;padding-top:10px;text-align:left;width:400px;">'+
					'<div class="icsinline" style="float: left;padding-right:105px;text-align:left;">'+
							'<strong>City/Region</strong>'+
						'</div>'+
					'<div class="icsinline" style="padding-right:30px;text-align:left;">'+
							'<strong>State</strong>'+
						'</div>'+
						'<div class="icsinline" style="padding-right:5px;text-align:left;">'+
							'<strong>Zipcode</strong>'+
						'</div>'+	
				'</div> <!-- end of cityAddressDiv -->';
										
		newDiv.innerHTML += cityAddressDiv;
		
		var cityStateZipDiv = document.createElement("div");
	
		cityStateZipDiv.style.paddingLeft="110px";
		
		var citySpan = document.createElement("div");
		citySpan.style.paddingRight="10px";
		citySpan.className = "icsinline";
		var cityInput = document.createElement("input");
		cityInput.setAttribute("type", "text");
		cityInput.setAttribute("Name", "profileRequest.profile.addresses["+addressesListSize+"].city");
		cityInput.setAttribute("id", "city"+addressesListSize);
		cityInput.setAttribute("maxLength", "255");
		citySpan.appendChild(cityInput);

		var cityAnchor = document.createElement("a");
		cityAnchor.setAttribute("href", "javascript:clearField(\"city"+addressesListSize+"\");");
		cityAnchor.style.paddingLeft="5px";
		var newCityTextNode = document.createTextNode("X");
		cityAnchor.appendChild(newCityTextNode);
		citySpan.appendChild(cityAnchor);
		
		cityStateZipDiv.appendChild(citySpan);
		
		var stateSpan = 
						'<div class="icsinline" style="padding-right:10px;">'+
						'<select id="state'+addressesListSize+'" name="profileRequest.profile.addresses['+addressesListSize+'].state">'+
								'<option value="AL">AL</option>'+
								'<option value="AK">AK</option>'+
								'<option value="AZ">AZ</option>'+
								'<option value="AR">AR</option>'+
								'<option value="CA">CA</option>'+
								'<option value="CO">CO</option>'+
								'<option value="CT">CT</option>'+
								'<option value="DE">DE</option>'+
								'<option value="FL">FL</option>'+
								'<option value="GA">GA</option>'+
								'<option value="HI">HI</option>'+
								'<option value="ID">ID</option>'+
								'<option value="IL">IL</option>'+
								'<option value="IN">IN</option>'+
								'<option value="IA">IA</option>'+
								'<option value="KS">KS</option>'+
								'<option value="KY">KY</option>'+
								'<option value="LA">LA</option>'+
								'<option value="ME">ME</option>'+
								'<option value="MD">MD</option>'+
								'<option value="MA">MA</option>'+
								'<option value="MI">MI</option>'+
								'<option value="MN">MN</option>'+
								'<option value="MS">MS</option>'+
								'<option value="MO">MO</option>'+
								'<option value="MT">MT</option>'+
								'<option value="NE">NE</option>'+
								'<option value="NV">NV</option>'+
								'<option value="NH">NH</option>'+
								'<option value="NJ">NJ</option>'+
								'<option value="NM">NM</option>'+
								'<option value="NY">NY</option>'+
								'<option value="NC">NC</option>'+
								'<option value="ND">ND</option>'+
								'<option value="OH">OH</option>'+
								'<option value="OK">OK</option>'+
								'<option value="OR">OR</option>'+
								'<option value="PA">PA</option>'+
								'<option value="RI">RI</option>'+
								'<option value="SC">SC</option>'+
								'<option value="SD">SD</option>'+
								'<option value="TN">TN</option>'+
								'<option value="TX">TX</option>'+
								'<option value="UT">UT</option>'+
								'<option value="VT">VT</option>'+
								'<option value="VA">VA</option>'+
								'<option value="WA">WA</option>'+
								'<option value="WV">WV</option>'+
								'<option value="WI">WI</option>'+
								'<option value="WY">WY</option>'+
							'</select>'+	
						'</div>';
		cityStateZipDiv.innerHTML += stateSpan;
		
		var zipSpan = document.createElement("div");
		zipSpan.className = "icsinline";
		zipSpan.style.paddingRight="10px";
		
		var zipInput = document.createElement("input");
		zipInput.setAttribute("type", "text");
		zipInput.setAttribute("name", "profileRequest.profile.addresses["+addressesListSize+"].zipCode");
		zipInput.setAttribute("id", "zipCode"+addressesListSize);
		zipInput.setAttribute("maxLength", "11");
		zipInput.style.width="90px";
		
		zipSpan.appendChild(zipInput);
		
		var zipAnchor = document.createElement("a");
		zipAnchor.setAttribute("href", "javascript:clearField(\"zipCode"+addressesListSize+"\");");
		zipAnchor.style.paddingLeft="5px";
		var newCityTextNode = document.createTextNode("X");
		zipAnchor.appendChild(newCityTextNode);
		zipSpan.appendChild(zipAnchor);
		
		cityStateZipDiv.appendChild(zipSpan);
		newDiv.appendChild(cityStateZipDiv);
					
		document.getElementById("addressesList").appendChild(newDiv);
		
		if(addressesListSize == max_new_addresses-1)
		{
			document.getElementById("newAddressDiv").style.display="none";
		}
	}
}

function addNewIms() {
	if(imsListSize < max_new_ims ) 
	{
		imsListSize = imsListSize +1 ;	 
		
		var dynaImsDivContent =
				'<div class="icsinline" style="width:72px;*width:70px;">'+
					'<select id="imsType'+imsListSize+'" name="profileRequest.profile.ims['+imsListSize+'].type">'+
						'<option label="MSN" value="msn">MSN</option>'+
						'<option label="Yahoo" value="yahoo">Yahoo</option>'+
						'<option label="Google" value="google">Google</option>'+
						'<option label="AOL" value="aol">AOL</option>'+
						'<option label="ICQ" value="icq">ICQ</option>'+
						'<option label="Skype" value="skype">Skype</option>'+
						'<option label="Jabber" value="jabber">Jabber</option>'+
						'<option label="Other" value="other">Other</option>'+
					'</select>'+	
				'</div>';
	
		var newDiv  = document.createElement("div");
		newDiv.id="ims"+imsListSize;		
		newDiv.style.paddingTop="5px";	
		newDiv.style.paddingBottom="5px";	
	//	newDiv.style.paddingRight="5px";
		newDiv.style.clear="left";
		newDiv.innerHTML = dynaImsDivContent;	
		
		var newSpan = document.createElement("div");
		newSpan.className="icsinline";
		newSpan.style.width="100px";
		newSpan.style.marginLeft="5px";
		
		
		var newInput = document.createElement("input");
		newInput.setAttribute("type", "text");
		newInput.setAttribute("name", "profileRequest.profile.ims["+imsListSize+"].address");
		newInput.setAttribute("id", "imsAddress"+imsListSize);
		newInput.setAttribute("maxLength", "255");
		newInput.style.width="100px";		
		
		
		var newhref = document.createElement("div");
		newhref.className="icsinline";
		newhref.style.cssText="margin-left:2px;*margin-left:5px;_margin-left:5px";
		
		var newAnchor = document.createElement("a");
		newAnchor.setAttribute("href", "javascript:clearField(\"imsAddress"+imsListSize+"\");");
		newAnchor.style.marginLeft="3px";
		
		var newTextNode = document.createTextNode("X");

		newAnchor.appendChild(newTextNode);
		
		newSpan.appendChild(newInput);
		newhref.appendChild(newAnchor);
		newDiv.appendChild(newSpan);
		newDiv.appendChild(newhref);
		document.getElementById("imsListDiv").appendChild(newDiv);
				
		if(imsListSize == max_new_ims-1)
		{
			document.getElementById("addNewImsDiv").style.display="none";
		}		
	}
}

function addWebpages() {

	if(webPagesListSize < max_new_webpages) 
	{
		webPagesListSize = webPagesListSize +1 ;	 
		
		var dynaWebpagesDivContent =
				'<div class="icsinline" style="padding-right:5px;">'+
					'<select id="webPagesType'+webPagesListSize+'" name="profileRequest.profile.webpages['+webPagesListSize+'].type" style="width:80px;">'+
						'<option label="Personal" value="personal">Personal</option>'+
						'<option label="Business" value="business">Business</option>'+
					'</select>'+	
				'</div>' ;
	
		var newDiv  = document.createElement("div");
		newDiv.id="webPages"+webPagesListSize;
		newDiv.style.clear="left";
		newDiv.style.paddingTop="5px";	
		newDiv.style.paddingBottom="5px";	
		newDiv.style.paddingLeft="5px";	
		newDiv.innerHTML = dynaWebpagesDivContent;	
		
		var newSpan = document.createElement("div");
		newSpan.className = "icsinline";
		
		var newInput = document.createElement("input");
		newInput.setAttribute("type", "text");
		newInput.setAttribute("name", "profileRequest.profile.webpages["+webPagesListSize+"].url");
		newInput.setAttribute("id", "url"+webPagesListSize);
		newInput.setAttribute("maxLength", "1000");
		newInput.style.width="140px";
		
		
		var newhref = document.createElement("div");
		newhref.className = "icsinline";
		
		var newAnchor = document.createElement("a");
		newAnchor.setAttribute("href", "javascript:clearField(\"url"+webPagesListSize+"\");");
		newAnchor.style.marginLeft="3px";
		
		var newTextNode = document.createTextNode("X");
		newAnchor.appendChild(newTextNode);
		
		newSpan.appendChild(newInput);
		newhref.appendChild(newAnchor);
		newDiv.appendChild(newSpan);
		newDiv.appendChild(newhref);
		
				
		document.getElementById("webpagesListDiv").appendChild(newDiv);
		
		if(webPagesListSize == max_new_webpages-1)
		{
			document.getElementById("addNewWebpageDiv").style.display="none";
		}			
	}
}

function clearField(fieldId) {
	document.getElementById(fieldId).value="";
}

function imposeNotesMaxLength()
{
	var notes = document.getElementById("notes");
	if(notes != null && notes.value.length <= 3000) {
  		return true;
  	} else {
  		notes.value = notes.value.substring(0, 3000);
  		return false;
  	}
}

$(function()
{
	Date.firstDayOfWeek = 0;
	Date.format = 'mm/dd/yyyy';
	$('.date-pick').datePicker({startDate:'01/01/1910'});
	$('.date-pick').datePicker({endDate:'01/01/2020'});
});



</script>

</body>
</html>
