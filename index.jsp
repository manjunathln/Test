<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="css/images/favicon.ico" type="image/x-icon" />
<html lang="en-us">
	<%@include file="indexInclude.jsp" %>
	
	<%@include file="poll.js"%>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/libs/oj/v1.0/alta/oj-alta-min.css" type="text/css"/>
        <link rel="stylesheet" href="css/demo-alta-patterns-min.css"/>
        <link rel="stylesheet" href="css/override.css" type="text/css"/>
		
		
		<%@ page import="java.awt.ComponentOrientation,java.util.Locale,java.util.Properties,java.util.Vector,com.iflex.fic.client.SMSServices"%>
	<%
	Locale localeForOrient = (Locale) session.getAttribute("userLocale");
	boolean isLeftToRight = ComponentOrientation.getOrientation(new Locale(localeForOrient.toString().substring(0,2))).isLeftToRight();
	Vector cssv = new Vector<String>();
	cssv.add("DEFAULT_AAICSS_INFO");
	cssv.add("AAICSS_HEROBANNER_REQ");
	cssv.add("AAICSS_HEROBANNER_ICON_REQ");
	cssv.add("OBIEE_LOGOUT_URL_VAL");
	cssv.add("OBIEE_CROSS_DOMAIN_VAL");
	String commonAAICSS = "stylesheetAAI";
	String aaicss_herobanner_req = "false";
	String aaicss_herobanner_icon_req = "true";
	String isCrossDomain = "false";
	String commonOBIEELOGOUTURL = "";
	Properties cssprops = SMSServices.getConfiguration(cssv);
	if(cssprops.getProperty("DEFAULT_AAICSS_INFO") != null && !"".equals(cssprops.getProperty("DEFAULT_AAICSS_INFO"))) {
		commonAAICSS = cssprops.getProperty("DEFAULT_AAICSS_INFO").trim();
	}
	if(cssprops.getProperty("AAICSS_HEROBANNER_REQ") != null && !"".equals(cssprops.getProperty("AAICSS_HEROBANNER_REQ"))) {
		aaicss_herobanner_req = cssprops.getProperty("AAICSS_HEROBANNER_REQ").trim();
	}
	if(cssprops.getProperty("AAICSS_HEROBANNER_ICON_REQ") != null && !"".equals(cssprops.getProperty("AAICSS_HEROBANNER_ICON_REQ"))) {
		aaicss_herobanner_icon_req = cssprops.getProperty("AAICSS_HEROBANNER_REQ").trim();
	}
	if(cssprops.getProperty("OBIEE_LOGOUT_URL_VAL") != null && !"".equals(cssprops.getProperty("OBIEE_LOGOUT_URL_VAL"))) {
		commonOBIEELOGOUTURL = cssprops.getProperty("OBIEE_LOGOUT_URL_VAL").trim();		
	}
	if(cssprops.getProperty("OBIEE_CROSS_DOMAIN_VAL") != null && !"".equals(cssprops.getProperty("OBIEE_CROSS_DOMAIN_VAL"))) {
		isCrossDomain = cssprops.getProperty("OBIEE_CROSS_DOMAIN_VAL").trim();		
	}
%>
    <link rel="stylesheet" href="css/home_<%= commonAAICSS %>.css">
	<%
		if(aaicss_herobanner_req.equals("true")){
	%>
		<style>
			#aai_hero_banner{display:block !important}
		</style>
	<% }else{ %>
		<style>
			#aai_hero_banner{display:none !important}
		</style>	
	<% } %>
	<%
		if(aaicss_herobanner_icon_req.equals("true")){
	%>
		<style>
			#aai_hero_banner_icon{display:block}
		</style>
	<% }else{ %>
		<style>
			#aai_hero_banner_icon{display:none}
		</style>	
	<% } %>
	<script>
		var aaicss_herobanner_req = "<%=aaicss_herobanner_req%>";
		var aaicss_herobanner_icon_req = "<%=aaicss_herobanner_icon_req%>";
		var obiee_logout_url_val = "<%=commonOBIEELOGOUTURL%>";		
		var isObieeCrossDomain ="<%=isCrossDomain%>";		
	</script>
	
        <script data-main="js/main" src="js/libs/require/require.js"></script>
	<style>.progress-bar{background-image:url(css/images/progress_bar.gif);width:70px;height:53px;overflow:hidden;position:absolute;left:49%;top:49%;z-index:100}</style>
    </head> 
	
    <body class="mainbody">
	<div id="progressbar" class="progress-bar"></div>
	<div id="disablePageFrame" class="" style="display:none;width:100%;height:100%;position:absolute;z-index:10000;left:0;top:0"></div>
        <div id="mainContainer" class="main-container">
        <header role="banner">
          <div id='demo_appheader_div' data-bind="template: {name: 'AAIHeader'}"></div>
        </header>
            <div id="contents"  class="aai-cont oj-row-cont">
				
                <div id="contentTab" class="aai-main-tree oj-col" style="overflow:auto" data-bind="template: {name: getFormTmpl,foreach: forms}"></div>
				
            </div>
        <footer role="contentinfo"> 
           <div id='demo_appfooter_div' data-bind="template: {name: 'AAIFooter'}"></div>
        </footer> 
        </div>
		<span id="dummy_check_tab_length" class="oj-tabs-title-dummy" style="display: inline-block;"></span>
		<div id="compat_check" class="compat-check speech-bubble" data-bind="template: {name: 'AAICompat'}"></div>
    </body>
</html>