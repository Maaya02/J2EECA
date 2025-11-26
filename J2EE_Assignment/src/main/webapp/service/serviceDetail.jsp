<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.*"%>
<%@ page import="templateForCategories.categories"%>
<%@ page import="java.util.Objects"%>
<%@ page import="services.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Silver Care</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<style>
.mega-dropdown {
	position: static !important;
}

.mega-dropdown-menu {
	width: 600px;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
	border: none;
	display: none;
}

.mega-dropdown:hover .mega-dropdown-menu {
	display: block;
}

@media ( min-width : 992px) {
	.mega-dropdown .dropdown-toggle::after {
		display: inline-block;
	}
}

.mega-dropdown-content {
	display: flex;
	gap: 30px;
}

.category-list {
	flex: 1;
	border-right: 1px solid #dee2e6;
	padding-right: 20px;
}

.category-item {
	padding: 12px 15px;
	margin-bottom: 5px;
	border-radius: 8px;
	cursor: pointer;
	transition: all 0.3s;
	font-weight: 500;
	color: #555;
	text-decoration: none;
	display: block;
}

.category-item:hover, .category-item.active {
	background: #8fa9ba;
	color: white !important;
}

.services-list {
	flex: 1;
	padding-left: 10px;
}

.service-group {
	display: none;
}

.service-group.active {
	display: block;
	animation: fadeIn 0.3s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateX(-10px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
.service-link {
	padding: 10px 0;
	color: #666;
	font-size: 15px;
	transition: all 0.3s;
	display: block;
	text-decoration: none;
}

.service-link:hover {
	color: #8fa9ba;
	padding-left: 5px;
}

.service-category-title {
	font-weight: 600;
	color: #333;
	margin-bottom: 10px;
	font-size: 16px;
}

.navbar-brand {
	font-weight: 700;
	color: #333 !important;
}

.btn-info {
	background: #5a9fd4;
	border: none;
	border-radius: 25px;
	padding: 8px 25px;
	font-weight: 500;
}

.btn-info:hover {
	background: #4a8fc4;
}

.nav-link {
	font-weight: 500;
	color: #757575 !important;
}

.nav-link:hover {
	color: #8fa9ba !important;
}

#homeScreenAnchorTag {
	color: #000000 !important;
}

#homeScreenAnchorTag:hover {
	color: #8fa9ba !important;
}

.mainDiv {
	display: flex;
	height: 50%;
}

.colorsForFAQs {
	color: white !important;
	background-color: #869293 !important;
}
</style>
<%@ include file="../components/navbar.jsp"%>
</head>

<body>

	<div>
		<%
		@SuppressWarnings("unchecked")
		ArrayList<services> serviceArray = (ArrayList<services>) session.getAttribute("services");
		String serviceId = request.getParameter("id");
		int serviceIdInt = Integer.parseInt(serviceId);
		for (services service : serviceArray) {
			if (serviceIdInt == service.getServiceId()) {
				
		%>

		<div class="mainDiv">
			<div
				style="width: 50%; background-color: #D9D9D9; display: flex; flex-direction: column; justify-content: center; gap: 2%; padding: 3%;"
				class="flex-fill px-5">
				<h1><%= service.getServiceName() %></h1>
				<p><%= service.getServiceDescription() %></p>
				<form method="POST" action="${pageContext.request.contextPath}/redirectToBooking">
					<input type='hidden'  value=<%= service.getServiceId() %> id="serviceId" name="serviceId">
					<button class="btn btn-primary" type="submit">Book now</button>
				</form>
			</div>
			<div style="width: 50%;" class="flex-fill">
				<img src="./2dce49bc59a27384a110faf008dc7f27fa004659.png"
					alt="imageOfElderly" class="img-fluid"
					style="width: 100%; object-fit: cover; height: 100%;">
			</div>
		</div>
				<%
			}
		}
		%>
		<div style="padding: 4%; background-color: #869293; color: white;">
			<h1>FAQs</h1>
			<div class="accordion accordion-flush" id="accordionExample">
			
	<%
		try {
			Class.forName("org.postgresql.Driver");
			
			// url = ""
			String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
			Connection conn = DriverManager.getConnection(connURL,"neondb_owner","npg_CF5WgzPNhdf6");
			Statement stmt = conn.createStatement();
			String sqlStr = "SELECT faq_questions, faq_answer, service_faq.id FROM faq INNER JOIN service_faq ON faq.id = service_faq.faq_id INNER JOIN service ON service.id = service_faq.service_id WHERE service.id=?;";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
			ResultSet rs = pstmt.executeQuery();
			Boolean haventStarted = true;
			while (rs.next()) {
				if (haventStarted){
					String faq_answer = rs.getString("faq_answer");
					String faq_questions = rs.getString("faq_questions");
					int faqId = rs.getInt("id");
					out.print("<div class='accordion-item colorsForFAQs'>");
					out.print("<h2 class='accordion-header colorsForFAQs'>");
					out.print("<button class='accordion-button colorsForFAQs' type='button' data-bs-toggle='collapse' data-bs-target='#faqId"+faqId+"' aria-expanded='true' aria-controls='faqId"+faqId+"'>" + faq_questions+"</button>");
					out.print("</h2>");
					out.print("<div id='faqId"+ faqId+"' class=' show accordion-collapse collapse colorsForFAQs' data-bs-parent='#accordionExample'>");
					out.print("<div class='accordion-body colorsForFAQs'>");
					out.print(faq_answer);
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					haventStarted = false;
				} else {
				String faq_answer = rs.getString("faq_answer");
				String faq_questions = rs.getString("faq_questions");
				int faqId = rs.getInt("id");
				out.print("<div class='accordion-item colorsForFAQs'>");
				out.print("<h2 class='accordion-header colorsForFAQs'>");
				out.print("<button class='accordion-button colorsForFAQs collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#faqId"+faqId+"' aria-expanded='false' aria-controls='faqId"+faqId+"'>" + faq_questions+"</button>");
				out.print("</h2>");
				out.print("<div id='faqId"+ faqId+"' class='accordion-collapse collapse colorsForFAQs' data-bs-parent='#accordionExample'>");
				out.print("<div class='accordion-body colorsForFAQs'>");
				out.print(faq_answer);
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
			}
			}
			conn.close();
		} catch (Exception e){
			out.println("Error: "+ e);
		}
	%>
				
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<script>
        document.addEventListener('DOMContentLoaded', function () {
            const categoryItems = document.querySelectorAll('.category-item');
            const serviceGroups = document.querySelectorAll('.service-group');

            categoryItems.forEach(item => {
                item.addEventListener('mouseenter', function () {
                    // Remove active class from all categories
                    categoryItems.forEach(cat => cat.classList.remove('active'));

                    // Add active class to hovered category
                    this.classList.add('active');

                    // Hide all service groups
                    serviceGroups.forEach(group => group.classList.remove('active'));

                    // Show corresponding service group
                    const categoryName = this.getAttribute('data-category');
                    document.getElementById(categoryName).classList.add('active');
                });
            });
        });
    </script>

</body>
<%@ include file="../components/footer.html"%>

</html>