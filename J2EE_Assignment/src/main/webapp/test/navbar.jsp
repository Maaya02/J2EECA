<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.*"%>
<%@ page import="teamplateForCategories.categories"%>
<%@ page import="java.util.Objects" %>
	
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
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">🏠 SilverCare</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="#" id="homeScreenAnchorTag">Home</a></li>

					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						aria-expanded="false"> Services </a>
						<div class="dropdown-menu mega-dropdown-menu">
							<div class="mega-dropdown-content">
								<div class="category-list">
									<%
									try {
										Class.forName("org.postgresql.Driver");

										// url = ""
										String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
										Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
										Statement stmt = conn.createStatement();
										String sqlStr = "SELECT * FROM categories";
										ResultSet rs = stmt.executeQuery(sqlStr);
										ArrayList<categories> categoriesArray = new ArrayList<>();
										while (rs.next()) {
											String category = rs.getString("category_name");
											String category_description = rs.getString("category_description");
											out.println("<div class='category-item' data-category='" + category_description + "'>" + category + "</div>");
											categoriesArray.add(new categories(category, category_description));
										}

										conn.close();
									} catch (Exception e) {
										out.println("Error: " + e);
									}
									%>
								</div>
								<div class="services-list">
									<%
									try {
										Class.forName("org.postgresql.Driver");

										// url = ""
										String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
										Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
										Statement stmt = conn.createStatement();
										String sqlStr = "SELECT service.service_name, service.service_url, categories.category_description, category_tag.name FROM service INNER JOIN categories ON service.category_id = categories.id LEFT JOIN category_tag ON service.category_tag_id = category_tag.id";
										ResultSet rs = stmt.executeQuery(sqlStr);
										String previousCategory = "";
										String previousCategoryTag = "";
										Boolean notStarted = false;
										while (rs.next()) {
											
											String category_name = rs.getString("category_description");
											String service_name = rs.getString("service_name");
											String category_tag = rs.getString("name");
											String service_url = rs.getString("service_url");
											if (notStarted == false){
												notStarted = true;
												previousCategory = category_name;
												previousCategoryTag = category_tag;
												out.println("<div class='service-group' id='" + category_name + "'>");
												if (category_tag == null) {
													out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
												} else {
													out.println("<h6 class='service-category-title'>"+category_tag+"</h6>");
													out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
												}
											}
											else if (category_name.equals(previousCategory) && Objects.equals(category_tag, previousCategoryTag)) {
												previousCategory = category_name;
												previousCategoryTag = category_tag;
												out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
											} else if (!category_name.equals(previousCategory) && (!Objects.equals(category_tag, previousCategoryTag)) && notStarted == true) {
												previousCategory = category_name;
												previousCategoryTag = category_tag;
												out.println("</div>");
												out.println("<div class='service-group' id='" + category_name + "'>");
												if (category_tag == null) {
													out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
												} else {
													out.println("<h6 class='service-category-title'>"+category_tag+"</h6>");
													out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
												}
											} else if (!category_name.equals(previousCategory)) {
												previousCategory = category_name;
												previousCategoryTag = category_tag;
												out.println("</div>");
												out.println("<div class='service-group' id='" + category_name + "'>");
												out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
											} else if (!Objects.equals(category_tag, previousCategoryTag)) {
												previousCategory = category_name;
												previousCategoryTag = category_tag;
												out.println("<h6 class='service-category-title'>"+category_tag+"</h6>");
												out.println("<a href='" + service_url + "' class='service-link'>" + service_name + "</a>");
											}
										}
										out.print("</div>");
										conn.close();
									} catch (Exception e) {
										out.println("Error: " + e);
									}
									%>
								</div>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#aboutus">About
							Us</a></li>
				</ul>
				<form class="d-flex ms-auto" action="bookingOfServices.jsp">
					<button class="btn btn-info" type="submit">Book Services</button>
				</form>
			</div>
		</div>
	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const categoryItems = document.querySelectorAll('.category-item');
            const serviceGroups = document.querySelectorAll('.service-group');

            categoryItems.forEach(item => {
                item.addEventListener('mouseenter', function() {
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

</html>