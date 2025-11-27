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
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			try {
				int userId = Integer.parseInt(request.getParameter("userIdForDelete"));

				
				Class.forName("org.postgresql.Driver");
				String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
				Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
				String sqlStr = "DELETE FROM member WHERE id = ?";
				PreparedStatement ps = conn.prepareStatement(sqlStr);
				ps.setInt(1, userId);
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
