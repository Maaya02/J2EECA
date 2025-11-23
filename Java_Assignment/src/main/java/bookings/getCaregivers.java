package bookings;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bookings.caregiver.*;
import com.google.gson.*;
/**
 * Servlet implementation class getCaregivers
 */
@WebServlet("/getCaregivers")
public class getCaregivers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCaregivers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			 Class.forName("org.postgresql.Driver"); // load driver
		     String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		     String username = "neondb_owner";
		     String password = "npg_CF5WgzPNhdf6";
		     Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
		     PreparedStatement pstmt = conn.prepareStatement("SELECT id,username FROM member WHERE role='staff'");

		     HttpSession session = request.getSession();
//	    	 dispatcher = request.getRequestDispatcher("authentication/homepage.jsp");

		     ResultSet rs = pstmt.executeQuery();
		     ArrayList<caregiver> caregiverNames = new ArrayList<>();
		     while(rs.next()) {
		    	 int memberId = rs.getInt("id");
		    	 String memberName = rs.getString("username");
		    	 caregiverNames.add(new caregiver(memberId, memberName));
//		    	 response.sendRedirect("authentication/homepage.jsp");
		     }
		     String json = new Gson().toJson(caregiverNames);
		     response.getWriter().write(json);

		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
