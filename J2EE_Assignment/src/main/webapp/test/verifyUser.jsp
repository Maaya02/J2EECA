<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- Author: Lee Yee Shyan Shanna (P2405889)
	- Date: 23/10/2025
	- Description: ST0510/JAD week 1 submission
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String user=request.getParameter("loginid");
	String pwd=request.getParameter("password");
%>
These are the parameter values retrieved<br>
<%-- user: <%=com.login.jsp.utils.makeItLower(user) %> --%>
user: <%=user %>
password: <%=pwd %>
</body>
</html>