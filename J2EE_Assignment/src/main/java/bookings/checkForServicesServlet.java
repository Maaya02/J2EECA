package bookings;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;

import services.services;
import com.google.gson.*;

/**
 * Servlet implementation class checkForServicesServlet
 */
@WebServlet("/checkForServicesServlet")
public class checkForServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkForServicesServlet() {
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
		HttpSession session = request.getSession();
		String json = "";
	    if (session.getAttribute("serviceToBook") != null){
	    	int service = (int) session.getAttribute("serviceToBook");
			@SuppressWarnings("unchecked")
			ArrayList<services> servicesArray = (ArrayList<services>) session.getAttribute("services");	
			for (services serviceForLoop: servicesArray){
				if (serviceForLoop.getServiceId() == service){
				     json = new Gson().toJson(serviceForLoop);
				}
			}
	    }
	     response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
