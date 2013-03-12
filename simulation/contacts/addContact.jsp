<%
	String firstName = request.getParameter("contactRequest.contact.firstName");
	if (firstName == null) firstName = "";
	String lastName = request.getParameter("contactRequest.contact.lastName");
	if (lastName == null) lastName = "";
	String company = request.getParameter("contactRequest.contact.orgName");
	if (company == null) company = "";
	String jobTitle = request.getParameter("contactRequest.contact.jobTitle");
	if (jobTitle == null) jobTitle = "";
 %>

{"statusCode":0,"statusDesc":"success",
"contact":[{
"firstName":"<%= firstName %>",
"lastName":"<%= lastName %>",
"contactId":"6eb23ed1-0121-1000-804f-50256654842f",
"version":"39",
"company":"<%= company %>",
"jobTitle":"<%= jobTitle %>",
"picUrl":"",
"createdDate":"June 28, 2009","updatedDate":"",
"defaultEmail":"p@vzw.net",
"defaultPhone":"999-999-9999",
"inNetworkFlag":false,
"connected":false,
"buddyuserid":"",
"phones":[{"number":"999-999-9999","phoneType":"mobile","carrier":"","preference":""},
{"number":"888-888-8888","phoneType":"home","carrier":"","preference":""},
{"number":"777-777-7777","phoneType":"business","carrier":"","preference":""}],
"searchPhones":["9999999999","8888888888","7777777777"],
"searchEmails":["p@vzw.net"],
"emails":[{"emailType":"personal","index":"","address":"p@vzw.net","preference":""}],
"groups":[{"id":"145","name":"Starred","version":"3"},{"id":"147","name":"Buddies","version":"2"}],
"mobileGroups":[{"id":"141","name":"Family","version":"4"}],
"endPointAssoc":[]}
]}
