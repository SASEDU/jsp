<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/PackageTree.jsp -->
<%@ page
  language="java"
  import="com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.midtier.components.container.util.impl.ComponentsUtil,
    com.sas.apps.packageviewer.container.PackageViewerFactory"
  contentType= "text/html; charset=UTF-8"
%>

<%@ taglib uri="http://www.sas.com/taglib/saspackageviewer" prefix="packageviewer"%>
<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<%@ taglib uri="http://www.sas.com/taglib/sas-uis" prefix="sas-uis" %>

<sas-uis:Timeout frames="true"/> 

<script type="text/javascript">
function hideshowProgress()
{
   which = document.getElementById('progressIndicatorWIP');
   if (which.style.display == "none") {
      which.style.display = "block";
      which.style.zIndex = 9002;
   } else {
      which.style.display = "none";
      which.style.zIndex = 1;
   }
}
</script>

<%

Logger logger = null;
UserContextInterface userContext = null;
try
{
    userContext = PackageViewerFactory.getUserContext(request);
    logger = (Logger) ComponentsUtil.locateComponent(Logger.class, request);
%>

<html>

<head>
    <sas:InitializeComponents/>
    <sas:StyleSheet/>
</head>

<body>
    <%@ include file="progressIndicatorWIP.jsp" %>

<table border="0" cellpadding="5" cellspacing="5" width="100%">
    <tr><td>
    <sas:TreeView id="PACKAGE_TREEVIEW" scope="request" />
    </td></tr>
</table>

<script type="text/javascript">
   hideshowProgress();
</script>
</body>
</html>
<%
} catch(Exception e) {
    if (logger != null) {
        logger.error(e.getMessage(), "PackageTree.jsp", e, userContext);
    } else {
        System.err.println (e.getMessage());
    }
}

%>
