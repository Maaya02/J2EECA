package bookings;

import jakarta.servlet.RequestDispatcher;

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
 * Servlet implementation class serviceBookings
 */
@WebServlet("/ServiceBookings")
public class serviceBookings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String service_id = request.getParameter("services");
		String service_date = request.getParameter("date");
		String service_time = request.getParameter("time");
		String phone_no = request.getParameter("phoneNumber");
		String name = request.getParameter("name");
		String caregiver_id = request.getParameter("caregivers");
		String message = request.getParameter("message");
		String timeStamp = service_date + " " + service_time + ":00";
		
		try {
			 Class.forName("org.postgresql.Driver"); // load driver
		     String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		     String username = "neondb_owner";
		     String password = "npg_CF5WgzPNhdf6";
		     Connection conn = DriverManager.getConnection(dbUrl, username, password);
		     HttpSession session = request.getSession();

		     PreparedStatement pstmt = conn.prepareStatement("INSERT INTO member_booking(service_date, name, member_id, service_id, message, number, caregiver_id) VALUES (?,?,?,?,?,?,?);");
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            java.util.Date parsedDate = dateFormat.parse(timeStamp);
		     Timestamp timeStampToBeParsed = new Timestamp(parsedDate.getTime());
		     pstmt.setTimestamp(1, timeStampToBeParsed);
		     pstmt.setString(2, name);
		     pstmt.setInt(3, (int) session.getAttribute("member_id"));
		     pstmt.setInt(4, Integer.parseInt(service_id));
		     pstmt.setString(5,message);
		     pstmt.setInt(6, Integer.parseInt(phone_no));
		     pstmt.setInt(7, Integer.parseInt(caregiver_id));
//	    	 dispatcher = request.getRequestDispatcher("authentication/homepage.jsp");
		     int nRowsAffected = pstmt.executeUpdate();
		     if (nRowsAffected > 0) {
		    	response.sendRedirect("bookingSystem/completedBooking.jsp");
		     } else {
			    	response.sendRedirect("bookingSystem/booking.jsp?err=unsuccessful");

		     }
		  
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

}
