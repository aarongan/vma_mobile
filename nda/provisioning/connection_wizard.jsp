<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ include file="/nda/common/taglibraries.jsp" %>


<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.common.ProvisioningConstants"%>
<html>
    <title>
        Connection Wizard
    </title>
    <head>
    <link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
    <script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
   
    <!--[if IE 7]>
		<style type="text/css">
			.endpoints.orderNum{
				margin-left:-15px;
			}
		</style>
	<![endif]-->
	
	

    </head>
    <body class="pl" onload="onPageLoad();setAmTimer();" >
        
    <div id="layer_holder">
    <!--[if gte IE 7]>
		<div id="main" style="text-align: left; margin-left: 10px;margin-right:-40px;">
		<div id="contentDiv" class="icsinline" style="width:630px;/*height:465px;*/ margin-top:10px;margin-right:5px;margin-left:10px;">
	<![endif]--> 
	<!--[if !IE]><!--> 
		<div id="main" style="text-align: left; margin-left: 5px"> 	
		<div id="contentDiv" class="icsinline" style="width:630px;/*height:465px;*/ margin-top:15px;margin-right:5px;margin-left:10px;">
	<!--<![endif]-->     
    
    	<!-- <div id="leftContentDiv" class="icsinline" style="float:left;margin-top:5px;width:475px;height:455px;">-->
		<s:form action="overview.action"  method="post" theme="simple">
			<s:set id="deviceInfo" name="deviceInfo" value="icsSessionVO.userVO.deviceInfo" />
    		<div id="pageHeaderDiv" style="font-family:arial;font-size: 16px; padding-bottom: 7px;">
    			<!-- Show welcome text only for first time -->
    			<s:if test="icsSessionVO.userVO.scWelcomeFlag == true ">
	    			<div id="baNotSetupHeader">
	    				<strong style="font-size:17px;font-weight:bold;color:red">
							Welcome to Sync & Connect 
						</strong><br/><br/>						 
						<p style="font-size:12px;">
							Sync and Connect lets you view all your emails at one<br/>
							time on your wireless device and on the web.
							<br/><br/>
							You can also view and manage your handset contacts<br/>
							<s:set id="learnMoreLink" name="learnMoreLink"
	                               	value="@com.vzw.is.ics.utils.props.ICSProps@getProperty(@com.vzw.is.ics.common.ICSConstants@LEARN_MORE_LINK, 
	                               			@com.vzw.is.ics.common.ICSConstants@LEARN_MORE_DEFAULTVALUE)" />
							<a href="javascript:openLink('<s:property value='#learnMoreLink'/>','LearnMore');" class="a"> Learn More</a> <b>about Sync & Connect</b>
						</p>
	    			</div>
	    		</s:if>
					
			 	<span style="font-size:15px;">			 	
					<s:if test="%{(icsSessionVO.userVO.scWelcomeFlag == true) && ((#deviceInfo != null && #deviceInfo != '') && response.handsetProvisioned == false) }">
						<strong>Your Sync Points...</strong><br/>
					</s:if>
					<s:elseif test="%{(icsSessionVO.userVO.scWelcomeFlag == false) && ((#deviceInfo != null && #deviceInfo != '') && response.handsetProvisioned == false) }">
						<strong>Your Sync Points...</strong><br/>
					</s:elseif>
					<s:elseif test="%{(icsSessionVO.userVO.scWelcomeFlag == true) && ((#deviceInfo != null && #deviceInfo != '') && response.handsetProvisioned == true) }">
						<strong>Your Sync Points:</strong><br/>
					</s:elseif>
					<s:else>
						<strong>Your Sync Points:</strong><br/>		
					</s:else>
				</span>
	        </div>
	        
            <div id="syncPointsDiv" class="icsinline" style="margin-top:3px;width:545px;/*560px*/;height:290px;/*270px*/ border:1px solid #CCCCCC">
            
			 <s:set id="masterProviderList" name="response.masterProviderList" 
			 				value="response.masterProviderList"/>
			 <s:set id="userEndPointList" name="response.userEndPointList" 
			 				value="response.userEndPointList"/>
 					<div id="syncHeaderDiv" style="height:225px;width:544px;overflow:auto;">
 					<span style="font-size:12px;margin-left:3px;">
			            <s:if test="%{(#deviceInfo != null && #deviceInfo != '') && response.handsetProvisioned == true }">
							These are the email accounts and contacts currently syncing to your phone: 
					 		<span style="color:red;"><s:property value="icsSessionVO.userVO.mdn"/></span>
					 	</s:if>
					 	<s:elseif test="%{(#deviceInfo != null && #deviceInfo != '') && response.handsetProvisioned == false }">
					 		These are the email accounts currently syncing to your phone: 
					 		<span style="color:red;"><s:property value="icsSessionVO.userVO.mdn"/></span>
					 	</s:elseif>
					 	<s:if test="%{(#deviceInfo == null || #deviceInfo == '') && response.handsetProvisioned == true }">
			               	These are the contacts syncing to your phone: 
					 		<span style="color:red;"><s:property value="icsSessionVO.userVO.mdn"/></span>
				 		</s:if>
					 	<s:elseif test="%{(#deviceInfo == null || #deviceInfo == '') && response.handsetProvisioned == false }">
					 		These are the email accounts currently available on web for you to manage
					 	</s:elseif>
				 	</span>
					 	<s:iterator id="userEndPointList" value="response.userEndPointList">
					 	    <s:set id="providerServiceDetailId" name="providerServiceDetailId" value="providerServiceDetailId"/>                                        
		                    <s:set id="endPointId" name="endPointId"	value="endPointId" />				 		 	
		       			 	<s:set id="orderId" name="orderId"	value="orderId" />
	                        <s:set id="endPointLoginName" name="endPointLoginName" value="loginUserName"/>
	                        <s:set id="userEndPointId" name="userEndPointId" value="userEndPointId"/>
	                        <s:set id="subscriptionId" name="subscriptionId" value="subscriptionId"/>
	                        <s:set id="emailCount" name="emailCount" value="emailCount"/>
	                        <s:set id="handsetEndPointName" name="handsetEndPointName" value="endPointName"/>	                        
	                        <s:set id="endPointName" name="endPointName"
	                               	value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterProvider(#endPointId).providerName" />
	                         <s:if test="%{(response.handsetProvisioned == true && 
	                         		#handsetEndPointName.equalsIgnoreCase(@com.vzw.is.ics.common.ICSProviderConstants@HANDSET_MESSAGE_SOURCE))}">	                            
	                            
	                            <div id="contactProvidersDiv" style="/*width:535px;*/height: 65px; margin-top: 5px; /*border-bottom: 1px dotted;*/ margin-right: 2px; margin-left: 3px;">
	                            	<s:set id="contactsCount" name="contactsCount" value="contactsCount"/>
	                            	<span class="icsinline endpoints <s:property value='endPointName'></s:property>" 
				                    	style="display:inline-block;">			                          
				                    </span>
				                    <span class="icsinline" style="*margin-left:5px;*margin-top:-35px;width:180px;text-align: left;font-size:12px;word-wrap:break-word;">
				                    	<div id="displayMdn"></div>
				                    	<script type="text/javascript">
					                    	var mdn='<s:property value="icsSessionVO.userVO.mdn"/>';
					                    	if(mdn && mdn.length == 10){
					                    		mdn=mdn.substring(0,3) + "-"+ mdn.substring(3,6)+"-"+mdn.substring(6,mdn.length);
					                    	}
					                    	document.getElementById('displayMdn').appendChild(document.createTextNode(mdn));
					                    </script>
				                    	<div> Synching Contacts </div>
				                    </span>			                    
				                    <span class="icsinline" style="*margin-top:-30px;">
                                		<s:a href="javascript:showContacts();" cssStyle="color:black;"><b>Contacts:</b></s:a>
                                	</span>
			                        <span class="icsinline" style="*margin-top:-30px;*margin-left:3px;"><b><s:property value="#contactsCount" /></b></span><br/>
			                        <s:if test="%{(#deviceInfo == null || #deviceInfo == '') && response.handsetProvisioned == true }">
				                        <p style="font-size: 12px;padding-top:5px;border-top: 1px solid #CCCCCC; ">
										 	These are the email accounts currently available on web for you to manage 
										</p>
									</s:if>
								</div> 
	                          </s:if>
	                                                   
                           	<s:if test="%{!#endPointName.equalsIgnoreCase(
                                 				@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE)
                                 				&& !#endPointName.equalsIgnoreCase(
                                 				@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)
                                 				&& !#endPointName.equalsIgnoreCase(
                                 				@com.vzw.is.ics.common.ICSProviderConstants@HANDSET_MESSAGE_SOURCE)}">    
                        	<div id="providersDiv" style="/*width:535px;*/height: 45px; margin-top: 5px; /*border-bottom: 1px dotted;*/ margin-right: 2px; margin-left: 3px;"> 
	                    
					 		<!-- <div style="margin-left:5px;height:20px;">	   -->	              		
			                    
			                    <span class="icsinline endpoints <s:property value='endPointName'></s:property>" 
			                    	style="display:inline-block;">			                          
			                    </span>           	
	                 			<s:if test="orderId !='' && orderId > 1">
		                 			<span class="icsinline endpoints orderNum">
		                 				<s:property value="orderId"></s:property>
		                 			</span>
	                 			</s:if>		                 		
								
								<s:if test="%{#endPointLoginName.trim() != ''}">							
                                    <s:if test="%{#endPointName.equalsIgnoreCase(
                                				@com.vzw.is.ics.common.ICSProviderConstants@OUTLOOK_MESSAGE_SOURCE)
                                				|| #endPointName.equalsIgnoreCase(
                                				@com.vzw.is.ics.common.ICSProviderConstants@THUNDERBIRD_MESSAGE_SOURCE)}">
                              			<s:set name="contactsServiceStatus" value="@com.vzw.is.ics.utils.props.ICSMasterProps@getMasterService(@com.vzw.is.ics.common.ICSServiceConstants@CONTACTS).getStatus()"/>
                              			<s:if test="@com.vzw.is.ics.common.ICSMasterStatus@ACTIVE == #contactsServiceStatus">
                                  	 	<s:url id="deleteEndPointUrl" value="/provisioning/showDeleteEndPointConfirmation.action" includeParams="post">
                                          <s:param name="endPointRequest.endPointVO.endPointId" value="endPointId"/>
                                         <s:param name="endPointRequest.endPointVO.endPointName" value="endPointName"/>
                                         <s:param name="endPointRequest.endPointVO.userEndPointId" value="#userEndPointId"/>
                                         <s:param name="endPointRequest.endPointVO.loginUserName" value="#endPointLoginName"/>
                                         <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
                                         <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@DELETE_ENDPOINT_OPERATION"/>
                                         <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />											
                                         <s:param name="endPointRequest.redirectSource">connectionWizard</s:param>
                                           </s:url>							
                                           <span class="icsinline" style="text-align: left;font-size:0.9em;word-wrap:break-word;">
			                                   <strong><s:property value="endPointLoginName"/></strong>	                                                 
			                               </span>
			                               <s:a href="%{deleteEndPointUrl}" cssClass="button icsinline" id="connectBtn" cssStyle="float:right;">
						                  		<span class="interface"><span><span>&nbsp;Remove</span></span></span>
								           </s:a>	
                                 		</s:if>                                          	
                                 	</s:if> 
                                 	<s:else>
                                 	<%--
                                 			<!--[if gte IE 7]>
												<div class="icsinline" style="width:430px;float:left;margin-top:-25px;">
											<![endif]--> 
											<!--[if !IE]><!--> 
												<div class="icsinline" style="width:430px;float:left;margin-bottom:5px;margin-top:-10px;">
											<!--<![endif]-->  
                                 		
	                                    	 <div class="icsinline" style="margin-bottom:5px;width:200px;">
	                                               <div style="font-size:0.9em;" >--%>
                                             <s:url id="modifyEndPointWizardUrl" value="/provisioning/endPointConnectionWizard.action" includeParams="post">											
                                                <s:param name="endPointRequest.endPointVO.userEndPointId" value="#userEndPointId"/>
                                                <s:param name="endPointRequest.endPointVO.endPointId" value="endPointId"/>
                                                <s:param name="endPointRequest.endPointVO.endPointName" value="endPointName"/>
		                                        <s:param name="endPointRequest.endPointVO.loginUserName" value="#endPointLoginName"/>
		                                        <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
		                                        <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@MODIFY_ENDPOINT_OPERATION"/>
		                                        <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />
		                                         <s:param name="endPointRequest.redirectSource">connectionWizard</s:param>
                                             </s:url>	                                         
                                              <s:if test="response.userEmailIds != null && response.userEmailIds.size() == 1">
		                                     		<s:set id="lastEndpoint" name="lastEndpoint" value="true"/>
		                                    	</s:if>		
		                                      <s:else>
		                                     		<s:set id="lastEndpoint" name="lastEndpoint" value="false"/>
		                                     </s:else>
				                                         
                                             <s:url id="deleteEndPointUrl" value="/provisioning/showDeleteEndPointConfirmation.action" includeParams="post">
                                                 	<s:param name="endPointRequest.endPointVO.endPointId" value="endPointId"/>
                                                  	<s:param name="endPointRequest.endPointVO.endPointName" value="endPointName"/>
		                                         	<s:param name="endPointRequest.endPointVO.userEndPointId" value="#userEndPointId"/>
		                                         	<s:param name="endPointRequest.endPointVO.loginUserName" value="#endPointLoginName"/>
		                                         	<s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
		                                         	<s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@DELETE_ENDPOINT_OPERATION"/>
		                                         	<s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />	
		                                         	 <s:param name="endPointRequest.lastEndpoint" ><s:property value="#lastEndpoint"/></s:param>
		                                          	<s:param name="endPointRequest.endPointVO.subscriptionId" value="#subscriptionId"/>
		                                          	 <s:param name="endPointRequest.redirectSource">connectionWizard</s:param>
			                                 </s:url>							
                                              	<span class="icsinline" style="*margin-top:-30px;text-align: left;font-size:12px;word-wrap:break-word;width:180px;">
                                  					<strong><s:property value="endPointLoginName"/></strong>	                                                 
                               					</span>
                                				<span class="icsinline" style="*margin-top:-30px;">
                                					<s:a href="javascript:showInbox();" cssStyle="color:black;"><b>New Emails:</b></s:a>
                                				</span>
                             	 				<span class="icsinline" style="*margin-top:-30px;*margin-left:3px;width:15px;"><b><s:property value="#emailCount"/></b></span>
                             	 				<span class="icsinline" style="margin-left:20px;*width:50px;*margin-top:-30px;">	
                             	 				<s:a href="%{deleteEndPointUrl}" cssClass="button icsinline" id="connectBtn" cssStyle="float:right;">
		                  							<span class="interface"><span><span>&nbsp;Remove</span></span></span>
				           	 					</s:a>	</span>
				           	 					<span class="icsinline" style="margin-left:25px;*width:50px;*margin-top:-30px;">	
					           	 					<s:a href="%{modifyEndPointWizardUrl}" cssClass="button icsinline" id="editModifyBtn" cssStyle="float:right;">
			                  							<span class="interface"><span><span>&nbsp;Edit/Modify</span></span></span>
					           	 					</s:a>	
				           	 					</span> 
				           	 					  <!--<span class="icsinline" style="margin-left:15px;*width:50px;*margin-top:-36px;">
				           	 						<s:a href="%{modifyEndPointWizardUrl}" cssClass="button icsinline" cssStyle="float:right;">
			                  							<span class="light_gray">
			                  								<span><span style="text-align:center;"> <div style="margin-top: 5px;">&nbsp;Edit/Modify</div></span></span>
			                  							</span>
				           	 						</s:a>	
				           	 					</span>	-->					
	                                          <%-- </div>			
	                                         </div>
	                                         
	                                         <!--[if gte IE 7]>
												<div class="icsinline" style="height:70px;width:220px;margin-right:10px;">
											 <![endif]--> 
											 <!--[if !IE]><!--> 
												<div class="icsinline" style="height:70px;width:210px;margin-top:-10px;margin-right:10px;">
											 <!--<![endif]-->
	                                    	 	<span class="icsinline"><s:a href="javascript:submitSave();" cssClass="a" ><b>New Emails:</b></s:a></span>
	                                    	 	<span><s:property value="#emailCount"/></span><br/>
	                                    	</div>							
                                 		</div>	--%>
                                    </s:else>
                                   </s:if>
                          			<s:else>
                          			  <div style=" padding-right:4px;">
                                                   <s:url id="addEndPointUrl" value="/provisioning/endPointConnectionWizard.action" includeParams="post">																							
                                                       <s:param name="endPointRequest.endPointVO.endPointId" value="endPointId"/>
                                                       <s:param name="endPointRequest.endPointVO.endPointName" value="endPointName"/>
                                                       <s:param name="endPointRequest.endPointVO.loginUserName" value="#endPointLoginName"/>
		                                            <s:param name="endPointRequest.fmtType" value="@com.vzw.is.ics.common.ICSConstants@FORMAT_TYPE_JSP"/>											
		                                            <s:param name="endPointRequest.operationType" value="@com.vzw.is.ics.common.ICSConstants@CREATE_ENDPOINT_OPERATION"/>
		                                            <s:param name="endPointRequest.source" value="@com.vzw.is.ics.common.ICSConstants@PROVISION" />
		                                             <s:param name="endPointRequest.redirectSource">connectionWizard</s:param>
                                                   </s:url>
                                                   <s:a href="%{addEndPointUrl}" cssClass="a" >Connect</s:a>
                                               </div>
                          			</s:else>                          			
                          			
                              <!-- </div> -->
                      		</div><!-- Providers Div --> 
                      		</s:if>
                      		                     			
                        </s:iterator>     <!-- user services list -->
                        </div>
                        <%--
                        <s:if test="icsSessionVO.userVO.scWelcomeFlag == false ">
                        	<!--[if IE 7]>
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px;">
							 <![endif]-->
							 <!--[if gte IE 8]>
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px;">
							 <![endif]--> 
							 <!--[if !IE]><!--> 
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px; ">
							 <!--<![endif]-->
							 <p>
		       					<strong style="font-size:16px;">Want to set up additional accounts?</strong><br/>
		       					No problem..Simply select Add New Sync Points button below to choose from a list of supported Sync Points
		       				</p>
		       			</div>  
                        </s:if>
                        <s:else>
                        	<!--[if IE 7]>
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px;bottom: 8px;">
							 <![endif]-->
							 <!--[if gte IE 8]>
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px;bottom: 60px;">
							 <![endif]-->  
							 <!--[if !IE]><!--> 
								<div id="syncFooterDiv" style="margin-left: 5px; position: absolute; width: 520px; bottom: 60px;">
							 <!--<![endif]-->
							 <p>
		       					<strong style="font-size:16px;">Want to set up additional accounts?</strong><br/>
		       					No problem..Simply select Add New Sync Points button below to choose from a list of supported Sync Points
		       				</p>
		       			</div>  
                        </s:else>
                        --%>
 						<div id="syncFooterDiv" style="margin-left: 5px;*margin-left: 7px; position: absolute; width: 520px;margin-top:15px;">
		       				<p>
		       					<strong style="font-size:16px;">Want to set up additional accounts?</strong><br/>
		       					No problem..Simply select Add New Sync Points button below to choose from a list of supported Sync Points
		       				</p>
		       			</div>                      
                
                </div> <!-- syncpointsdiv -->	
                        
	            <s:if test="icsSessionVO.userVO.scWelcomeFlag == false ">
	            	<div id="footerDiv" style="padding-top:40px;width:562px;/*600px;*/">
	            </s:if>
	            <s:else>
	            	<div id="footerDiv" style="padding-top:15px;width:562px;/*600px;*/">
	            </s:else>  							
					<div style="/*padding-top:5px;*/width:480px;display:inline-block;"> 
					<div id="addNewDiv" class="icsinline" style="float:left;display:inline-block;">
			               <a id="checkButton" href="javascript:addNewSyncPoint();" 
			               	style="float:left" class="button">
			                  <span class="red"><span><span>Add New Sync Points</span></span></span>
			              </a>
			        </div>  			
      				<div id="defaultMailDiv" class="icsinline" style="display:inline-block;float:right;width:320px;">
                    	<div class="icsinline" style="padding-left: 8px;*padding-left: 0px;"> 	
              				<b style="padding-right:5px;">Default when sending</b> 
              				<s:select cssStyle="width:165px;*width:170px;" theme="simple" id="defaultEmail" headerValue="Select Default Email" headerKey=""
							label="defaultEmail" name="endPointRequest.defaultEmail" value="response.defaultEmail" 
							list="response.userEmailIds"   required="true" >
						</s:select> 
						</div>
              		</div>
             	</div> 
                <!--<div class="icsinline" style="margin-top:10px;font-size:11px;">
               		  	* The Next Sync time shown is only an estimate.  Slight variations in the exact time of the Next Sync (either earlier or later) may occur, and Verizon Wireless disclaims all liability regarding the times at which any syncs actually occur.
                    <br>Your information is safe with us. Check our <a href="javascript:showPrivacyPolicy();" class="a">Privacy Policy.</a>
                    
                </div> -->
        		<div style="float:right;/*padding-top:20px;*/margin-right:10px;*margin-top:-20px;">
		               <a href="javascript:submitSave();" style="float:left" class="button" id="saveButton">
		                  <span class="red">
		                  	<span>
		                  	<!-- 
		                  		<s:if test="icsSessionVO.userVO.scWelcomeFlag == true || icsSessionVO.userVO.firstTimeUser == true">
		                  			<span>Continue</span>
		                  		</s:if>
		                  		<s:else>
		                  			<span>Done</span>
		                  		</s:else>-->
		                  		<span id="saveBtnName"></span>
		                  	</span>
		                  </span>
		              </a>
		              <s:hidden name="icsSessionVO.userVO.scWelcomeFlag" value="false"/>
		        </div>
		        </s:form>
		        </div>
          </div> 
          
    <%--</div>
    
    <div style="display:none;" class="icsinline" >
        <div style="margin-left:5px;margin-top:-10px;" >
            <img src="<%=staticContentURL%>styles/images/ics/provision/horrizontalSeperator.gif" />
         </div>
     </div>		
     <div id="helpDiv" class="icsinline" style="float:right;margin-right:10px;vertical-align:top;width:225px;height:430px;border:1px solid #CCCCCC;white-space: normal; background-color: rgb(230, 238, 242);">
		<div style="text-align: left;text-indent: 10px; padding-top: 10px; font-size: 15px;">
			<strong>Do you know?</strong>				
		</div>
		<div style="margin:10px; text-align: left ;word-wrap:break-word;">
		<strong>Sync</strong>
		<br/>
		Syncing your data, like emails and contacts means that the information will be shared between both services.
		Updates or changes on one side will happen on the other side too.
		
		</div>
		<div style="margin:10px; text-align: left ;word-wrap:break-word;">
		
		Syncing happens automatically when you sign in and whenever you press the "Sync" button on the top right of each screen.

        </div>
     </div>		--%>								
		
      </div>

    
  
        <script type="text/javascript">

	function onPageLoad() {
		var welcomeFlag='<s:property value="icsSessionVO.userVO.scWelcomeFlag"/>';
		if (welcomeFlag == 'false'){//If IE
			if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
				parent.ics.app.listener.setDialogStyle({
					height: '470',
					width: '650'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '470',
					width: '650'
				});
				if (navigator.userAgent.indexOf('MSIE') !=-1){//If IE
					parent.ics.app.listener.setDialogStyle({
						height: '470',
						width: '660'
					});	
					parent.ics.app.listener.setIframeStyle({
						height: '470',
						width: '660'
					});
				}
				document.getElementById('footerDiv').style.paddingTop="45px";
			}else{
				document.getElementById('layer_holder').style.width="635px";
				document.getElementById('layer_holder').style.height="470px";
			}
		}else{
			if(parent.ics && parent.ics.app && parent.ics.app.listener && parent.ics.app.listener.setDialogStyle){
				parent.ics.app.listener.setDialogStyle({
					height: '530',
					width: '650'
				});	
				parent.ics.app.listener.setIframeStyle({
					height: '530',
					width: '650'
				});
			}else{
				document.getElementById('layer_holder').style.width="635px";
				document.getElementById('layer_holder').style.height="530px";
			}
			/*document.getElementById('footerDiv').style.paddingTop="15px";
			document.getElementById('syncFooterDiv').style.bottom="60px";
			if (navigator.userAgent.indexOf('MSIE') !=-1){//If IE
				document.getElementById('syncFooterDiv').style.bottom="8px";
			}*/
	    }
		changeTitle();
		
		var reloadSyncPod = '<s:property value="endPointRequest.reloadSyncPod"/>';
		var showSyncInProgress = '<s:property value="endPointRequest.showSyncInProgress"/>';
		var refreshMails = '<s:property value="endPointRequest.refreshMails"/>';
		var endpointsSize = '<s:property value="response.userEmailIds.size()"/>';
				
		if(reloadSyncPod == 'true')
		{
			if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setRefresh) {
				parent.ics.app.listener.setRefresh(true);
			}			
		}
		if(showSyncInProgress == 'true')
		{
			if(parent.ics && parent.ics.app && parent.ics.app.settings 
				&& parent.ics.app.settings.services&&parent.ics.app.settings.services.updateShowSyncPod) {
				parent.ics.app.settings.services.updateShowSyncPod(false);
			}		
		}
		if(refreshMails == 'true'){
			if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setInboxRefresh) {
					parent.ics.app.listener.setInboxRefresh(true);
				}		
				
		}
		if(endpointsSize < 1){
			if (navigator.userAgent.indexOf('MSIE') !=-1){//If IE
				document.getElementById("saveButton").style.filter="alpha(opacity=50)";
			}else{			
				document.getElementById("saveButton").setAttribute("class", "button disabled");
			}
		}
	}
	
  function changeTitle() {
  	/*var firstTimeUser =  '<s:property value="icsSessionVO.userVO.firstTimeUser"/>';
  	var scWelcomeFlag =  '<s:property value="icsSessionVO.userVO.scWelcomeFlag"/>';
	  	if(firstTimeUser == 'true' || scWelcomeFlag == 'true'){
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Connect Sync Points',true);
			}
			
		}else{
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Manage Sync Points');
			}	
			else if(parent.ics && parent.ics.app && parent.ics.app.listener 
					&& parent.ics.app.listener.setSyncDialogTitle){
				parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points',true);
			}
		
		}*/
		if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Connect Sync Points');
				document.getElementById('saveBtnName').appendChild(document.createTextNode('Continue'));
		}	
		else if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.setSyncDialogTitle){
			parent.ics.app.listener.setSyncDialogTitle('Manage Sync Points',true);
			document.getElementById('saveBtnName').appendChild(document.createTextNode('Done'));
		}
  	}

	function submitSave() {
		var status = '<s:property value="icsSessionVO.userVO.statusId" />';
		var active = '<s:property value="@com.vzw.is.ics.common.ProvisioningConstants@ACTIVE" />';
		var endpointsSize = '<s:property value="response.userEmailIds.size()"/>';
		/** This check is helpful to reroute the error page to 
		 * connection wizard when error happens from inbox adding a connection wizard
		 */
	/*	if(status == active) {
			if(parent.ics && parent.ics.app && parent.ics.app.listener 
				&& parent.ics.app.listener.closeEndPointsDialog) {
				parent.ics.app.listener.closeEndPointsDialog();
			}			
	  	} else 
	  	window.parent.location.href='<s:url value="/provisioning/overview.action" includeParams="post"/>';
	  	*/
	  	if(endpointsSize >= 1)
	  	{
	  			document.forms[0].action='<s:url value="/provisioning/overview.action"/>';
				document.forms[0].submit();
		  		window.parent.location.href='<s:url value="/provisioning/overview.action" includeParams="post"/>';
        } 
  	}

/*function showPrivacyPolicy() {
	window.open('http://www22.verizon.com/privacy/', 'PrivacyPolicy');	
} */           

function openLink(link,value) {
	window.open(link, value);	
}

function showInbox() {
	document.forms[0].action='<s:url value="/provisioning/overview.action"/>';
	document.forms[0].submit();
	window.parent.location.href='<s:url value="/provisioning/overview.action" includeParams="get"/>';
}

function showContacts() {
	document.forms[0].action='<s:url value="/provisioning/overview.action?nab" />';
	document.forms[0].submit();
 	window.parent.location.href='<s:url value="/provisioning/overview.action?nab" includeParams="get"/>';
}

function addNewSyncPoint(){
		document.forms[0].action='<s:url value="/provisioning/newSyncPointWizard.action" includeParams="post"/>';
		document.forms[0].submit(); 
	
}          

        </script>
    </body>
</html>
