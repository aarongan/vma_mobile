<%
	String contactId = request.getParameter("cdRequest.contactId");
	if (contactId == null) contactId = "";
 %>

{
    "statusCode":0,
    "statusDesc":"Success",
    "firstName":"Srinivas",
    "lastName":"Kasaraneni",
    "contactId":"<%= contactId %>",
    "picUrl":"",
    "version":"18",
    "middleName":"",
    "namePrefix":"",
    "nameSuffix":"",
    "nickName":"",
    "source":[],
    "prefModeOfComm":"",
    "anniversary":"",
    "spouse":"",
    "children":"",
    "note":"",
    "company":"Verizon Wireless",
    "orgUnit":"",
    "jobTitle":"Associate Director",
    "profession":"",
    "assistant":"",
    "maritalStatus":"",
    "timeZone":"",
    "createdDate":"6, 5 2009",
    "updateDate":"6, 13 2009",
    "newFields":{
    	"namePrefix":"",
    	"nameSuffix":"",
    	"anniversary":"02/23/2005",
    	"spouse":"",
    	"children":"",
    	"note":"",
    	"profession":"actor",
    	"assistant":"",
    	"maritalStatus":"married",
    	"timeZone":""
    },
    "groups":[{
        "id":"145",
        "name":"Starred",
        "version":"3"
    }],
    "mobileGroups":[
	{
        "id":"245",
        "name":"Work",
        "version":"5"
    }    
    ],
    "phones":[{
        "number":"908-607-8419",
        "index":"1",
        "phoneType":"business",
        "carrier":"",
        "isDefault": false,
        "preference":"0"
    },{
        "number":"201-704-2222",
        "index":"2",
        "phoneType":"mobile",
        "carrier":"",
        "isDefault": false,
        "preference":"0"
    },{
        "number":"201-704-1111",
        "index":"1",
        "phoneType":"mobile",
        "carrier":"",
        "isDefault": false,
        "preference":"0"
    },{
        "number":"201-704-9999",
        "index":"1",
        "phoneType":"car",
        "carrier":"",
        "isDefault": false,
        "preference":"0"
    }],
    "emails":[{
        "emailType":"business",
        "index":"",
        "address":"test@verizon.net",
        "preference":"2"
    },{
        "emailType":"personal",
        "index":"",
        "address":"test@gmail.com",
        "preference":"0"
    }],
    "ims":[
		{
			"imType" : "aim",
			"address" :  "bb@aol.com"
		},
		{
			"imType" : "yahoo",
			"address" :  "aa@yahoo.com"
		},
		{
			"imType" : "google",
			"address" :  "bb@gmail.com"
		}
     ],
    "webPages":[{
        "webPageType":"business",
        "index":"1",
        "url":"www.verizonwireless.com"
    }],
    "addresses":[{
        "addressType":"business",
        "index":"1",
        "poBox":"",
        "street":"30 Independence Blvd",
        "apartment":"",
        "city":"Warren",
        "state":"NJ",
        "zipCode":"07059",
        "country":"",
        "preference":"2"
    }],
	"networkList" : [
		{
			"name" : "Facebook",
			 "url" : " sss.com/dsds",
			"imgUrl" : "www.ics.com/network/facebook.jpeg"
		},
		{
			"name" : "twitter",
			 "url" : "sss.com/dsds",
			"imgUrl" : "www.ics.com/network/facebook.jpeg"
		},
		{
			"name" : "someBlog",
			 "url" : " sss.com/dsds",
			"imgUrl" : "www.ics.com/network/facebook.jpeg"
		}
	 ],
	 "notesList" : [
	 	{
	 		"month"	: "03",
	 		"day"	: "23",
	 		"year"	: "2009",
	 		"notes"	: "alsdfjlasfjlkasdfjldksfjlsdafjlsdafjldaskfj",
	 		otherFields:[
	 			{
	 				"field1":"value1",
	 				"field2":"value2",
	 				"field3":"value3",
	 				"field4":"value4"
	 			}
	 		]
	 	}
	 ],
	 "otherFields" : [
	 	{
	 		"label1"	: "label1",
	 		"label2"	: "label2"
	 	}
    
    ],
	 "iceContacts" : [
	 	{
	 		"label"	: "1st ICE Contact",
	 		"value"	: "ICE Contact 1"
	 	},
	 	{
	 		"label"	: "2nd ICE Contact",
	 		"value"	: "ICE Contact 1"
	 	},
	 	{
	 		"label"	: "3rd ICE Contact",
	 		"value"	: "ICE Contact 1"
	 	}	 	
    
    ]

}