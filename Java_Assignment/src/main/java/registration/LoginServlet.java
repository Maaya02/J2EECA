package registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.http.HttpSession; 	 
import javax.swing.JOptionPane;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("useremail");
		String upwd = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		
		try {
			 Class.forName("org.postgresql.Driver"); // load driver
		     String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		     String username = "neondb_owner";
		     String password = "npg_CF5WgzPNhdf6";
		     Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
		     PreparedStatement pstmt = conn.prepareStatement("select * from member WHERE email = ? and password = ?;");
		     
		     pstmt.setString(1, uemail);
		     pstmt.setString(2, upwd);
		     
		     ResultSet rs = pstmt.executeQuery();
		     if(rs.next()) {
		    	 HttpSession session = request.getSession();
//		    	 dispatcher = request.getRequestDispatcher("authentication/homepage.jsp");
		    	 session.setAttribute("name", rs.getString("username"));
		    	 session.setAttribute("member_id", rs.getInt("id"));
//		    	 dispatcher = request.getRequestDispatcher("authentication/homepage.jsp");
		    	 response.sendRedirect("authentication/homepage.jsp");
		     }else {
		    	 request.setAttribute("status", "error");
		    	 dispatcher = request.getRequestDispatcher("authentication/login.jsp");
		    	
		     }
		     
		     dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

}

