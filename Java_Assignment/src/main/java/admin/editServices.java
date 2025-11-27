package admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class editServices
 */
@WebServlet("/editServices")
@MultipartConfig
public class editServices extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public editServices() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        
		try {
			// TODO Auto-generated method stub
			System.out.println("Starting servlet");
	        // --- 1. Handle file upload ---
	        Part imagePart = request.getPart("image");
	        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
	        String uploadPath = "/Users/leeshanna/git/J2EECA/Java_Assignment/src/main/webapp/adminDashboard/images";	        
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) uploadDir.mkdir();
	        System.out.println(uploadPath);
	        File savedFile = new File(uploadDir, fileName);
	        // Optionally delete previous image with the same name
	        if (savedFile.exists()) {
	            savedFile.delete();  // deletes only this file
	        }

	        try (InputStream is = imagePart.getInputStream()) {
	            Files.copy(is, savedFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
	        }

	        String imageUrl = "images/"+fileName;

	        
			String nameOfService = request.getParameter("name");
			String description = request.getParameter("description");
			int price = Integer.parseInt(request.getParameter("price"));
			String location = request.getParameter("location");
			String categoryTag = request.getParameter("categoryTag");
			String category = request.getParameter("serviceCategory");
			int service = Integer.parseInt(request.getParameter("serviceId"));
			int categoryId;
			int categoryTagId;

			Class.forName("org.postgresql.Driver");
			String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
			Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
			String sqlStr = "CALL update_services(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, nameOfService);
			ps.setString(2, description);
			ps.setInt(3, price);
			ps.setString(4, location);
			ps.setString(5, imageUrl);
			try {
				categoryTagId = Integer.parseInt(categoryTag);
				ps.setInt(7, categoryTagId);
				ps.setNull(9, Types.VARCHAR);

			} catch (NumberFormatException e) {
				ps.setString(9, categoryTag);
				ps.setNull(7, java.sql.Types.INTEGER);	
			}
			try {
				categoryId = Integer.parseInt(category);
				ps.setInt(6, categoryId);
				ps.setNull(9, Types.VARCHAR);
			} catch (NumberFormatException e) {
				ps.setString(8, category);
				ps.setNull(6, java.sql.Types.INTEGER);
			}
			
			ps.setInt(10, service);
			
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
