<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../test/navbar.jsp" %>
</head>
<body>
<h1>Homepage</h1>
<%@ page language="java" %>

<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }
    Integer memberID =  (Integer) session.getAttribute("member_id");
    out.print(memberID);
    if(memberID == null){
    	out.print("couldnt get memberID");
    }
%>


<h2>Welcome, <%= name %>!</h2>

</body>
<%@ include file="../test/footer.html" %>
</html>