<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<sas:DocType mode="XHTML_FRAMESET"/>
<!-- Copyright (c) 2002-2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/PackageViewer.jsp -->
<%@ page
  language="java"
  import="java.net.URLEncoder,
          com.sas.web.keys.CommonKeys"
  contentType= "text/html; charset=UTF-8"
%>


<%
String packageId = request.getParameter("com.sas.bip.packageid");
String docBase = request.getContextPath();
String postpend = "?com.sas.bip.packageid=" + URLEncoder.encode(packageId, "UTF-8");
String srcUrlHeader =  docBase + "/packageheader" + postpend;

String srcLeftTreeTitle = (String) request.getAttribute("ExplorerFrameTitle");
String srcLeftTreeView =  docBase + "/packagetreeview" + postpend;

String srcRightContentTitle = (String) request.getAttribute("ViewerFrameTitle");
String srcRightContentWindow =  docBase + "/packagecontent" + postpend;

boolean showBanner = true;
Boolean showBannerObj = (Boolean) session.getAttribute(CommonKeys.PFS_REQUEST_SHOW_BANNER);
if (showBannerObj != null) {
    showBanner = showBannerObj.booleanValue();
}

%>

<% if (showBanner) { %>

<frameset ROWS="60,*">
        <frame name="title" SCROLLING="no" src="<%= srcUrlHeader %>" frameborder="0"/>
<% } %>
        <frameset cols="250,*" >
                <frame name="packagecontent" target="contentoutput" scrolling="auto" src="<%= srcLeftTreeView %>"
                  title="<%=srcLeftTreeTitle %>" frameborder="0"  marginheight="10" marginwidth="20"/>
                <frame name="contentoutput" target="main" scrolling="auto" src="<%= srcRightContentWindow %>"
                  title="<%=srcRightContentTitle %>" frameborder="0" />
        </frameset>

<% if (showBanner) { %>

</frameset>

<% } %>

