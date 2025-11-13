<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* ========================================== 
Author: Lee Yee Shyan Shanna (P2405889)
Date: 06/11/2025
Description: ST0510/JAD week 3 submission
============================================= */
	String user=request.getParameter("loginid");
	String pwd=request.getParameter("password");
	String userRole = "adminUser";
	/* System.out.println(user);
	System.out.println(pwd); */
	if (user.equals("Lincoln")  && pwd.equals("abc123") ){
		session.setAttribute("loggedIn", "true");
		response.sendRedirect("displayMember.jsp?user="+user+"&role="+userRole);
	} else {
		response.sendRedirect("displayMember.jsp?errCode=invalidLogin");
	}
%>

</body>
</html>