<%@ include file="../common/taglibraries.jsp" %>
<html>
<head>
   
  </head>

<body>
<s:actionerror/>
<s:div id="loginDiv" >
<s:if test="%{icsSessionVO == null || icsSessionVO.userVO == null}">


<s:form action="icsOverview.action" validate="true" name = "loginForm">
        <input type="hidden" name="TESTING_MODE" value="true" />
		<table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="028000000700001" maxlength="15"/>
				<s:textfield label="MobileNumber" name="am_mobile_number" value="3166483174" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>
	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="2c2d96e7-427a-460c-b0f8-b4dbe823fdf1" ></s:textfield>
	      </tr>
		</table>
		<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>
</s:form>



<s:form action="icsOverview.action" validate="true">
        <input type="hidden" name="TESTING_MODE" value="true" />
        <div>few contacts</div>
		
<table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="1" maxlength="15"/>
				<s:textfield label="MobileNumber" name="am_mobile_number" value="2158700201" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>

	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="17cae7e2-fc30-48ea-8378-3a09d82d1f1a" ></s:textfield>
	      </tr>
	      </table>

		
			<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>
			
</s:form>

<div style="background-color: yellow">
<b>This is HTML version Login</b>
<s:form action="icsPlainHtmlOverview.action" validate="true">
        <input type="hidden" name="TESTING_MODE" value="true" />
        <div>few contacts</div>
		
<table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="1" maxlength="15"/>
				<s:textfield label="MobileNumber" name="am_mobile_number" value="2158700201" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>

	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="17cae7e2-fc30-48ea-8378-3a09d82d1f1a" ></s:textfield>
	      </tr>
	      </table>

		
			<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>
			
</s:form>
</div>

<s:form action="icsOverview.action" validate="true">
        <input type="hidden" name="TESTING_MODE" value="true" />
        <div>lots of contacts</div>
        <table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="000000507900001" maxlength="15"/>

				<s:textfield label="MobileNumber" name="am_mobile_number" value="6096058981" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>

	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="96d7bbe0-bd03-41c4-af3d-674e632f7748" ></s:textfield>

	      </tr>
		</table>

			<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>

</s:form>
		
<s:form action="icsOverview.action" validate="true">
        <input type="hidden" name="TESTING_MODE" value="true" />
		<table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="000000001" maxlength="15"/>
				<s:textfield label="MobileNumber" name="am_mobile_number" value="9789797188" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>

	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="eff393dd-ccd5-4619-8a20-47f5bf0191a4" ></s:textfield>
	      </tr>
		</table>
		
			<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>
			
</s:form>
<s:form action="icsOverview.action" validate="true">
        <input type="hidden" name="TESTING_MODE" value="true" />
        <div>Lots of mails and contacts</div>
        <table>
		<tr>
	      		<s:textfield label="AM Login User Id" name="am_login_id" value="Tom_1908" maxlength="15"/>		
				<s:textfield label="AccountNumber" name="am_account_number" value="000000507900001" maxlength="15"/>

				<s:textfield label="MobileNumber" name="am_mobile_number" value="6096058981" maxlength="10"/>
				<s:select list="#{'accountholder':'Account Holder','mobilesecure':'Mobile Secure','prepay':'Prepay'}" name="role"></s:select>
	       </tr>

	      <tr>
	      	<s:textfield label="AM ICS FLAG" name="am_icsflag" value="B" maxlength="15"/>
	      	<s:textfield label="ICS GUID" name="am_guid" value="d78060f6-996b-4295-bd7d-ac0c23bc2419" ></s:textfield>

	      </tr>
		</table>
		
			<button class="input_primary" onclick="submit();"><span><span><span>Submit</span></span></span></button>
			
</s:form>

</s:if>
<s:else>
	You are already logged in as <s:property value="sessionVO.userVO.userId"/> , please <a
			href="logout.action">logout</a> to login with new user

</s:else>
</s:div>
</body>
</html>
