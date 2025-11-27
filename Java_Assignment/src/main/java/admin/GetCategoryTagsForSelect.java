package admin;

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
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import com.google.gson.*;
import admin.CategoryTag;

/**
 * Servlet implementation class GetCategoryTagsForSelect
 */
@WebServlet("/GetCategoryTagsForSelect")
public class GetCategoryTagsForSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCategoryTagsForSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int category = Integer.parseInt(request.getParameter("category")) ;
		try {
			Class.forName("org.postgresql.Driver");

			// url = ""
			String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
			Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
			String sqlStr = "select category_tag.id, category_tag.name, categories.category_name FROM category_tag INNER JOIN categories ON categories.id = category_tag.category_id WHERE categories.id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, category);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<CategoryTag> arrayOfCategoryTags = new ArrayList<>();
			while (rs.next()) {
				arrayOfCategoryTags.add(new CategoryTag(rs.getInt("id"), rs.getString("name"), rs.getString("category_name")));
			}
			
	        String json = new Gson().toJson(arrayOfCategoryTags);

	        response.getWriter().write(json);			
	        conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
