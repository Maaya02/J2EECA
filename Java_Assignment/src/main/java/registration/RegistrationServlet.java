package registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    // this method is to insert items 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("Working");
		
		String uname = request.getParameter("name");
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("pass");
		int umobile=Integer.parseInt(request.getParameter("contact"));
		RequestDispatcher dispatcher = null;	
		try{
			
			out.print(uname);
			out.print(uemail);
			out.print(upwd);
			out.print(umobile);
			
			 Class.forName("org.postgresql.Driver"); // load driver

		     String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		     String username = "neondb_owner";
		     String password = "npg_CF5WgzPNhdf6";

		     Connection conn = DriverManager.getConnection(dbUrl, username, password);
		     //String sqlStr = "UPDATE members SET username = ? WHERE id =?";
		     
		    // PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		    //pstmt.setInt(1, id);
		    //pstmt.setString(2, new_name);
		    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO member (username, password, email, number) VALUES (?, ?, ?,?);");
		    pstmt.setString(1, uname);
		    pstmt.setString(2, upwd);
		    pstmt.setString(3, uemail);
		    pstmt.setInt(4, umobile);
		    
		    // number of records affected
		     int nRowsAffected = pstmt.executeUpdate();
		     
		     // extra debugging 
		     if(nRowsAffected>0){
		    	 request.setAttribute("status", "success");
		    	 dispatcher = request.getRequestDispatcher("/authentication/login.jsp");
		     }else{
		    	 request.setAttribute("status", "failed");
		     }
		     dispatcher.forward(request, response);
		     conn.close();
		    
		 } catch(Exception e) {
		     e.printStackTrace();
		 }
		}
	}
	
