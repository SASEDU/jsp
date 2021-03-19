<%@page language="java"%>
<%@page import="java.net.*"%>
<%
	String ipaddress = request.getHeader("X-FORWARDED-FOR");
	String hostname = java.net.InetAddress.getByName(ipaddress).getHostName();
%>
<%pageContext.forward("/do?_program=/Shared Data/Framework/HomePage&IPADDRESS="+ipaddress+"&HOSTNAME="+hostname);%>
