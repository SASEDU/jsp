<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2006 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/startupError.jsp -->
<%@ page language="java" isErrorPage="true"
    import="com.sas.apps.packageviewer.res.RB,
          java.util.Locale,
          java.util.Date,
          java.text.DateFormat"
    contentType="text/html; charset=UTF-8"%>

<%
    //get the date-time as soon as possible to when the error condition
    // called this page.
     Date date = new Date();

     Locale loc = request.getLocale();

     //Since this is an error page, be careful that we don't assume objects normally
     // present are present. That's why we won't use the Text custom tag, either.
     String dateString =
        DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.LONG, loc ).format(date);
     String errorTitle = RB.getStringResource ("packageviewer.startup.error.title", loc);
     String errorMessage = RB.getStringResource ("packageviewer.startup.error.txt", loc);
     String exceptionMessage = (String) request.getAttribute("exception.message");

%>

<html>
    <head>
        <title><%= errorTitle%></title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    </head>
    <body>
        <b><%= errorMessage %></b>
        <p><%= dateString %></p>
        <%if(exceptionMessage != null) {%>
        <pre>
               <%= exceptionMessage%>
            </pre>
        <%}%>
    </body>
</html>
