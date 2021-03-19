<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/notReady.jsp -->
<%@ page
  language="java"
  isErrorPage="true"
  import="com.sas.apps.packageviewer.res.RB"
        contentType= "text/html; charset=UTF-8"
%>

<%
     //Since this is an error page, be careful that we don't assume objects normally
     //present are present. That's why we won't use the Text custom tag, either.
     String errorTitle = RB.getStringResource ("packageviewer.still.starting.title", request.getLocale());
     String errorMessage = RB.getStringResource ("packageviewer.still.starting.txt", request.getLocale());
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
        <title><%= errorTitle%></title>
  </head>
  <body>
        <%= errorMessage %>
  </body>
</html>
