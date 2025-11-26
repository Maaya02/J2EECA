package bookings;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import services.services;
import jakarta.json.JsonArrayBuilder;
import com.google.gson.Gson;
import java.util.*;

/**
 * Servlet implementation class getServices
 */
@WebServlet("/getServices")
public class getServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getServices() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession sessions = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<services> servicesArray = (ArrayList<services>) sessions.getAttribute("services");	
		
		
		String serviceType = request.getParameter("serviceType");

		ArrayList<services> arrayToSendOut = new ArrayList<>();
		for (services service: servicesArray) {
			if (service.getCategoryDescription().equals(serviceType)) {
				arrayToSendOut.add(service);
			}
		}
		
        String json = new Gson().toJson(arrayToSendOut);

        response.getWriter().write(json);
	}

}
