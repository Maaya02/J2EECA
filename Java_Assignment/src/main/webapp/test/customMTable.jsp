<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="displayMTable.jsp" method="post">
			<h1>Type in the number of the multiplication table</h1>
            <input type="text" name="number" min="1">
            <button type="submit" name="btnSubmit">Next</button>
	</form>
	<%
		if ("invalidNumber".equals(request.getParameter("errCode"))){
			out.print("<p>Invalid input, please try again</p>");
		}
	%>
</body>
</html>