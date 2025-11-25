<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page import="bookings.ServiceBooking" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = (String) session.getAttribute("name");
	if (name == null) {
		response.sendRedirect("http://localhost:8080/Java_Assignment/authentication/login.jsp");
		return;
	}
	Integer memberID = (Integer) session.getAttribute("member_id");
	if (memberID == null) {
		out.print("couldnt get memberID");
	}
	String role = (String) session.getAttribute("role");
	if (!role.equals("admin")){
		response.sendRedirect("errorScreen.jsp");
	}
	try {
		Class.forName("org.postgresql.Driver");
		
		// url = ""
		String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		Connection conn = DriverManager.getConnection(connURL,"neondb_owner","npg_CF5WgzPNhdf6");
		String sqlStr = "UPDATE member_booking SET status='CANCELLED' WHERE member_booking.id = ?";
		PreparedStatement pdst = conn.prepareStatement(sqlStr);
		pdst.setInt(1, Integer.parseInt(request.getParameter("id")) );
		int rs = pdst.executeUpdate();
		if (rs == 1){
			response.sendRedirect("completedUpdate.jsp");
		} else {
			response.sendRedirect("errorScreen.html");
		}
		conn.close();
	} catch (Exception e){
		out.println("Error: "+ e);
	}
	%>
</body>
</html>