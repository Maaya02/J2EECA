package admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class editServices
 */
@WebServlet("/editServices")
public class editServices extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editServices() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String service_date = request.getParameter("date");
			String service_time = request.getParameter("time");
			int booking_id = Integer.parseInt(request.getParameter("bookingId"));
			String timeStamp = service_date + " " + service_time + ":00";
			int staffId = Integer.parseInt(request.getParameter("caregivers"));
			int serviceId = Integer.parseInt(request.getParameter("services"));
			
			Class.forName("org.postgresql.Driver");
			String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
			Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
			String sqlStr = "UPDATE member_booking SET service_date = ?, caregiver_id = ?, service_id = ? WHERE member_booking.id = ?";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date parsedDate = dateFormat.parse(timeStamp);
            Timestamp timeStampToBeParsed = new Timestamp(parsedDate.getTime());
			ps.setTimestamp(1, timeStampToBeParsed);
			ps.setInt(2, staffId);
			ps.setInt(3, serviceId);
			ps.setInt(4, booking_id);
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
