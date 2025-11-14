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
		String number=request.getParameter("number");
		try {
		out.println("<h1>Multiply by "+number+"</h1>");	
		int newNumber = Integer.parseInt(number);
		out.println("<table border=1>");
		for (int i = 1; i <= 10; i++ ){
			out.print("<tr><td>"+number+"x"+i+"</td><td>"+i*newNumber+"</td></tr>");
		}
		out.print("	<button onclick='javascript:history.go(-1)'>Back</button>");
		} catch (NumberFormatException e){
			response.sendRedirect("customMTable.jsp?errCode=invalidNumber");
		}
	%>
</body>
</html>