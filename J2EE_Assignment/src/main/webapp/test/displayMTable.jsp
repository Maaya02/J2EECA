<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%--
	- Author: Lee Yee Shyan Shanna (P2405889)
	- Date: 04/11/2025
	- Description: ST0510/JAD week 3 submission
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display: flex; gap: 5%;">
			<div>
		<h1>Using JSP expression tag</h1>
		<table border=1>
		<%
			String row = request.getParameter("row");
			String number = request.getParameter("numberForMultiplication");
			int newNumber = Integer.parseInt(number);
			int newRow = Integer.parseInt(row);
			// loop through to 
			for (int i = 1; i <= newRow;i++){
				
		%>
				<tr><td><%= i %>x<%=newNumber %></td><td><%= i * newNumber %></td></tr>
		<%
			}
		%>
		</table>
	</div>
		<%
		out.println("<div>");
		out.println("<h1>Using out.print</h1>");
		out.println("<table border=1>");
		// loop through to 
		for (int i = 1; i <= newRow;i++){
			out.println("<tr><td>"+i+"x"+newNumber+"</td><td>"+i*newNumber+"</td></tr>");
		}
		out.println("</table>");
		out.println("</div>");
	%>
	</div>



	<button onclick="history.back()">Back</button>

</body>
</html>