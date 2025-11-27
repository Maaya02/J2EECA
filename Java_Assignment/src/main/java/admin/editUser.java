package admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class editUser
 */
@WebServlet("/editUser")
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String username = request.getParameter("username");
			int user_id = Integer.parseInt(request.getParameter("userId"));
			String email = request.getParameter("email");
			String role = request.getParameter("role");
			int phoneNo = Integer.parseInt(request.getParameter("phoneNumber"));
			
			Class.forName("org.postgresql.Driver");
			String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
			Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
			String sqlStr = "UPDATE member SET username = ?, email = ?, role = ?::role_type, number = ? WHERE member.id = ?";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, role);
			ps.setInt(4, phoneNo);
			ps.setInt(5, user_id);
			int rows = ps.executeUpdate();
			if (rows == 1) {
				response.sendRedirect("adminDashboard/completedUpdate.jsp");
			} else {
				response.sendRedirect("adminDashboard/errorScreen.html");
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
