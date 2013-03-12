<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("X-UA-Compatible", "IE=7");
response.setDateHeader("Expires", 0);

%>
<%@page import="java.util.Date,com.vzw.is.ics.utils.ICSUtils,com.vzw.is.ics.utils.props.ICSExtProps,com.vzw.is.ics.utils.props.ICSPathProperties"%>

<!--[if !(IE 6)]>
<div style="height: 20px">&nbsp;</div>
<![endif]-->

<!-- BEGIN: Footer -->
<% 
	ICSPathProperties   pathProperties = ICSPathProperties.getInstance();
%>

<div class="footer" style="clear:both">

	<div class="footerLinks">
		<div style="padding-top:5px;">&copy; <% int cyear=1900 + new Date().getYear(); %><%=cyear %> Verizon Wireless</div>
		<div style="padding-top:10px;">
	
		<a href="<%= ICSUtils.cdssoRedirect(ICSExtProps.getProperty("CDSSO_REDIRECT_URL",""),pathProperties.getServer_name_ssl()+"/b2c/sitemap.jsp") %>">Site Map</a> <span class="pipe">|</span>
	   	<a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?contentType=globalContent">Privacy</a> <span class="pipe">|</span> 
	    <a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?contentType=Legal Notice">Legal Notices</a> <span class="pipe">|</span>
	    <a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?textName=WEBSITE_USE&amp;jspName=footer/webuse.jsp">Website Use</a> <span class="pipe">|</span>	
		<a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?textName=CUSTOMER_AGREEMENT&amp;jspName=footer/customerAgreement.jsp">Customer Agreement</a> <span class="pipe">|</span>
	   	<a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?textName=RETURN_POLICY&amp;jspName=footer/returnPolicy.jsp">Return Policy</a> <span class="pipe">|</span>  
	    <a href="<%= pathProperties.getServer_name_ssl() %>/b2c/globalText?textName=WORRY_FREE_GUARANTEE&amp;jspName=support/worryFree.jsp">Worry Free Guarantee</a> <span class="pipe">|</span>  
	    <a href="<%= pathProperties.getServer_name_ssl() %>/b2c/bestNetwork/itsthenetwork.jsp" style="white-space: nowrap;" >Best Network</a>
	
				</div>
	   
	 	<div class="clear30">&nbsp;</div>
 	</div>
		</div>

