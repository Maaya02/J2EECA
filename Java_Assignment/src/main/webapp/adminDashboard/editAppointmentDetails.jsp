<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.*"%>
<%@ page import="bookings.ServiceBooking"%>

<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8" />
<!--<title> Drop Down Sidebar Menu | CodingLab </title>-->
<!-- <link rel="stylesheet" href="style.css" /> -->
<!-- Boxiocns CDN Link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<style>
:root {
	--colour-sp: #F6323E;
	--colour-abe: #993300;
	--colour-sb: #FF661B;
	--colour-cls: #D31145;
	--colour-soc: #5B7F95;
	--colour-eee: #22BCB9;
	--colour-mad: #BEBE4D;
	--colour-mae: #0096D7;
	--colour-sma: #0075C2;
	--font-base: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
	--font-heading: 'Poppins', var(--font-base);
	--font-body: 'Gantari', var(--font-base);
}

.settingsDivSection {
	width: 100%;
	flex-shrink: 0;
	border-radius: 1.25rem;
	background: #E9E9E9;
	box-shadow: 0 0 10.4px 4px rgba(0, 0, 0, 0.25);
	padding: 3%;
	margin-top: 4%;
}

/* Google Fonts Import Link */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 260px;
	background: #1a1a1a;
	z-index: 100;
	transition: all 0.5s ease;
}

.sidebar.close {
	width: 78px;
}

.sidebar .logo-details {
	height: 60px;
	width: 100%;
	display: flex;
	align-items: center;
}

.sidebar .logo-details i {
	font-size: 30px;
	color: #fff;
	height: 50px;
	min-width: 78px;
	text-align: center;
	line-height: 50px;
}

.sidebar .logo-details .logo_name {
	font-size: 22px;
	color: #fff;
	font-weight: 600;
	transition: 0.3s ease;
	transition-delay: 0.1s;
}

.sidebar.close .logo-details .logo_name {
	transition-delay: 0s;
	opacity: 0;
	pointer-events: none;
}

.sidebar .nav-links {
	height: 100%;
	padding: 30px 0 150px 0;
	overflow: auto;
}

.sidebar.close .nav-links {
	overflow: visible;
}

.sidebar .nav-links::-webkit-scrollbar {
	display: none;
}

.sidebar .nav-links li {
	position: relative;
	list-style: none;
	transition: all 0.4s ease;
}

.sidebar .nav-links li:hover {
	background: #4f4f4f;
}

.sidebar .nav-links li .iocn-link {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.sidebar.close .nav-links li .iocn-link {
	display: block;
}

.sidebar .nav-links li i {
	height: 50px;
	min-width: 78px;
	text-align: center;
	line-height: 50px;
	color: #fff;
	font-size: 20px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.sidebar .nav-links li.showMenu i.arrow {
	transform: rotate(-180deg);
}

.sidebar.close .nav-links i.arrow {
	display: none;
}

.sidebar .nav-links li a {
	display: flex;
	align-items: center;
	text-decoration: none;
}

.sidebar .nav-links li a .link_name {
	font-size: 18px;
	font-weight: 400;
	color: #fff;
	transition: all 0.4s ease;
}

.sidebar.close .nav-links li a .link_name {
	opacity: 0;
	pointer-events: none;
}

.sidebar .nav-links li .sub-menu {
	padding: 6px 6px 14px 80px;
	margin-top: -10px;
	background: #1d1b31;
	display: none;
}

.sidebar .nav-links li.showMenu .sub-menu {
	display: block;
}

.sidebar .nav-links li .sub-menu a {
	color: #fff;
	font-size: 15px;
	padding: 5px 0;
	white-space: nowrap;
	opacity: 0.6;
	transition: all 0.3s ease;
}

.sidebar .nav-links li .sub-menu a:hover {
	opacity: 1;
}

.sidebar.close .nav-links li .sub-menu {
	position: absolute;
	left: 100%;
	top: -10px;
	margin-top: 0;
	padding: 10px 20px;
	border-radius: 0 6px 6px 0;
	opacity: 0;
	display: block;
	pointer-events: none;
	transition: 0s;
}

.sidebar.close .nav-links li:hover .sub-menu {
	top: 0;
	opacity: 1;
	pointer-events: auto;
	transition: all 0.4s ease;
}

.sidebar .nav-links li .sub-menu .link_name {
	display: none;
}

.sidebar.close .nav-links li .sub-menu .link_name {
	font-size: 18px;
	opacity: 1;
	display: block;
}

.sidebar .nav-links li .sub-menu.blank {
	opacity: 1;
	pointer-events: auto;
	padding: 3px 20px 6px 16px;
	opacity: 0;
	pointer-events: none;
}

.sidebar .nav-links li:hover .sub-menu.blank {
	top: 50%;
	transform: translateY(-50%);
}

.sidebar .profile-details {
	position: fixed;
	bottom: 0;
	width: 260px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	background: #3d3d3e;
	padding: 12px 0;
	transition: all 0.5s ease;
}

.sidebar.close .profile-details {
	background: none;
}

.sidebar.close .profile-details {
	width: 78px;
}

.sidebar .profile-details .profile-content {
	display: flex;
	align-items: center;
}

.sidebar .profile-details img {
	height: 52px;
	width: 52px;
	object-fit: cover;
	border-radius: 16px;
	margin: 0 14px 0 12px;
	background: #3d3d3e;
	transition: all 0.5s ease;
}

.sidebar.close .profile-details img {
	padding: 10px;
}

.sidebar .profile-details .profile_name, .sidebar .profile-details .job
	{
	color: #fff;
	font-size: 18px;
	font-weight: 500;
	white-space: nowrap;
}

.sidebar.close .profile-details i, .sidebar.close .profile-details .profile_name,
	.sidebar.close .profile-details .job {
	display: none;
}

.sidebar .profile-details .job {
	font-size: 12px;
}

.home-section {
	position: relative;
	background: #FFFFFF;
	height: 100vh;
	left: 260px;
	width: calc(100% - 260px);
	transition: all 0.5s ease;
}

.sidebar.close ~.home-section {
	left: 78px;
	width: calc(100% - 78px);
}

.home-section .home-content {
	height: 60px;
	display: flex;
	align-items: center;
}

.home-section .home-content .bx-menu, .home-section .home-content .text
	{
	color: #11101d;
	font-size: 35px;
}

.home-section .home-content .bx-menu {
	margin: 0 15px;
	cursor: pointer;
}

.bx-menu {
	position: fixed;
}

.custom-icon {
	vertical-align: middle !important;
	/* margin-bottom: -5px; */
}

.home-section .home-content .text {
	font-size: 26px;
	font-weight: 600;
}

@media ( max-width : 420px) {
	.sidebar.close .nav-links li .sub-menu {
		display: none;
	}
}

.inputDivForSettings {
	display: flex;
	justify-content: space-between;
	padding: 1.5%;
}

.form-control {
	border-radius: 0.375rem;
	border: 1px solid rgba(0, 0, 0, 0.23);
	background: #FFF;
	padding: 0.5rem;
	width: 100%;
	/* max-width: 220px; */
	height: 45px;
	padding: 12px;
	border-radius: 12px;
	outline: none;
	transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
	box-shadow: 0px 0px 20px -18px;
}

.form-control:hover {
	border: 2px solid lightgrey;
	box-shadow: 0px 0px 20px -17px;
}

.form-control:active {
	transform: scale(0.95);
}

.form-control:focus {
	border: 2px solid grey;
}
/* 
.divForInputs {
  flex: 1;
  display: flex;
  justify-content: center;
} */
.footerForSettingsDiv {
	display: flex;
	justify-content: flex-end;
	gap: 3%;
	margin-top: 3%;
	margin-right: 5.5%;
}

/* From Uiverse.io by e-coders */
.formButton {
	appearance: none;
	background-color: transparent;
	border-radius: 0.9375em;
	box-sizing: border-box;
	/* color: #3B3B3B; */
	cursor: pointer;
	display: inline-block;
	font-family: Roobert, -apple-system, BlinkMacSystemFont, "Segoe UI",
		Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
		"Segoe UI Symbol";
	font-size: 16px;
	font-weight: 600;
	line-height: normal;
	margin: 0;
	min-height: 3.75em;
	min-width: 0;
	outline: none;
	padding: 1em 2.3em;
	text-align: center;
	text-decoration: none;
	transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	will-change: transform;
}

.formButton:disabled {
	pointer-events: none;
}

.formButton:hover {
	box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
	transform: translateY(-2px);
}

.formButton:active {
	box-shadow: none;
	transform: translateY(0);
}

#resetChanges {
	border-radius: 0.875rem;
	background: #A1A1A1;
}

#resetChanges:hover {
	background: #757575;
	color: #FFF;
}

#saveChanges {
	border-radius: 0.875rem;
	background: #ED6565;
}

#saveChanges:hover {
	background: #ba4f4f;
	color: #FFF;
}

.activePage {
	background: var(--colour-sp);
}

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
	padding: 3.5%;
	width: 100%;
}

.divForInputs {
	border-radius: 1.0625rem;
	background: #FFF;
	box-shadow: 0 0 18px 2px rgba(0, 0, 0, 0.25);
	padding: 2%;
	margin-top: 3%;
}

.divForInputs2 {
	border-radius: 1.0625rem;
	background: #FFF;
	box-shadow: 0 0 18px 2px rgba(0, 0, 0, 0.25);
	padding: 2%;
	margin-top: 3%;
	max-height: min-content;
}

.radio-inputs {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	max-width: 100%;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.radio-inputs>* {
	margin: 6px;
}

.radio-input:checked+.radio-tile {
	border-color: #2260ff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	color: #2260ff;
}

.radio-input:checked+.radio-tile:before {
	transform: scale(1);
	opacity: 1;
	background-color: #2260ff;
	border-color: #2260ff;
}

.radio-input:checked+.radio-tile .radio-icon svg {
	fill: #2260ff;
}

.radio-input:checked+.radio-tile .radio-label {
	color: #2260ff;
}

.radio-input:focus+.radio-tile {
	border-color: #2260ff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1), 0 0 0 4px #b5c9fc;
}

.radio-input:focus+.radio-tile:before {
	transform: scale(1);
	opacity: 1;
}

.radio-tile {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 120px;
	min-height: 90px;
	border-radius: 0.5rem;
	border: 2px solid #b5bfd9;
	background-color: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	transition: 0.15s ease;
	cursor: pointer;
	position: relative;
}

.radio-tile:before {
	content: "";
	position: absolute;
	display: block;
	width: 0.75rem;
	height: 0.75rem;
	border: 2px solid #b5bfd9;
	background-color: #fff;
	border-radius: 50%;
	top: 0.25rem;
	left: 0.25rem;
	opacity: 0;
	transform: scale(0);
	transition: 0.25s ease;
}

.radio-tile:hover {
	border-color: #2260ff;
}

.radio-tile:hover:before {
	transform: scale(1);
	opacity: 1;
}

.radio-icon svg {
	width: 2rem;
	height: 2rem;
	fill: #494949;
}

.radio-label {
	color: #707070;
	transition: 0.375s ease;
	text-align: center;
	font-size: 17px;
}

.radio-input {
	clip: rect(0, 0, 0, 0);
	-webkit-clip-path: inset(100%);
	clip-path: inset(100%);
	height: 1px;
	overflow: hidden;
	position: absolute;
	white-space: nowrap;
	width: 1px;
}

.inputsNextToEachOther {
	display: flex;
	justify-content: space-between;
}

.widthOfInput {
	width: 300px !important;
}
</style>
<body>
	<%!ServiceBooking booking;%>
	<%
	try {
		Class.forName("org.postgresql.Driver");
		int appointmentId = Integer.parseInt(request.getParameter("id"));

		// url = ""
		String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
		Statement stmt = conn.createStatement();
		String sqlStr = "SELECT member_booking.status, member_booking.id, member_booking.service_date, service.service_name, member.username FROM member_booking INNER JOIN service ON member_booking.service_id = service.id INNER JOIN member ON member_booking.caregiver_id = member.id WHERE member_booking.id = ?;";
		PreparedStatement psmt = conn.prepareStatement(sqlStr);
		psmt.setInt(1, appointmentId);
		ResultSet rs = psmt.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String status = rs.getString("status");
			if (status.equals("CANCELLED")){
				response.sendRedirect("errorScreen.jsp");
			} else {
				String serviceName = rs.getString("service_name");
				String staffName = rs.getString("username");
				Timestamp timeAndDateOfAppointment = rs.getTimestamp("service_date");
				booking = new ServiceBooking(id, timeAndDateOfAppointment, serviceName, staffName);
			}

		}
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<div class="sidebar close">
		<ul class="nav-links">
			<li><a href="#"> <i class='bx  bx-arrow-left-stroke'><svg
							xmlns="http://www.w3.org/2000/svg" fill="white" width="24"
							height="24">
							<!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path
								d="M11.79 6.29 6.09 12l5.7 5.71 1.42-1.42L9.91 13H18v-2H9.91l3.3-3.29z" />
                        </svg></i> <span class="link_name">Back</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="../landingPage/homepage.html">Back</a></li>
				</ul></li>
			<li><a href="userManagement.jsp"> <i class='bx  bx-user'></i>
					<span class="link_name">Manage Users</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="userManagement.jsp">Manage
							Users</a></li>
				</ul></li>
			<li><a href="appointmentManagement.jsp"> <i class='bx'><svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							fill="white">
							<!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path
								d="M19 4h-2V2h-2v2H9V2H7v2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2M5 20V8h14V6v14z" />
                            <path
								d="M7 11h2v2H7zM11 11h2v2h-2zM15 11h2v2h-2zM7 15h2v2H7zM11 15h2v2h-2zM15 15h2v2h-2z" />
                        </svg></i> <span class="link_name">Manage
						Appointments</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="appointmentManagement.jsp">Manage
							Appointments</a></li>
				</ul></li>
			<li><a href="servicesManagement.jsp"> <i
					class='bx  bx-clipboard-detail'><svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							fill="white">
							<!--Boxicons v3.0 https://boxicons.com | License  https://docs.boxicons.com/free-->
                            <path d="M7 10h10v2H7zm0 4h7v2H7z" />
                            <path
								d="M19 3h-2c0-.55-.45-1-1-1H8c-.55 0-1 .45-1 1H5c-1.1 0-2 .9-2 2v15c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2m0 17H5V5h2v2h10V5h2z" />
                        </svg></i> <span class="link_name">Manage Services</span>
			</a>
				<ul class="sub-menu blank">
					<li><a class="link_name" href="servicesManagement.jsp">Manage
							Services</a></li>
				</ul></li>
		</ul>
	</div>
	<section class="home-section">
		<div class="home-content"
			style="flex-direction: column; align-items: baseline; margin-top: 12px;">
			<i class="bx bx-menu"></i>

			<div class="mainDiv">
				<h1 style="margin-top: -1%;">Edit booking details</h1>
				<div
					style="display: flex; gap: 3.5%; width: 100%; justify-content: space-evenly;">
					<div class="divForInputs" style="width: 900px;">
						<form method="post"
							action="${pageContext.request.contextPath}/editServices">
							<div style="display: flex; flex-direction: column;">
								<label for="services" style="margin-top: 3.5%;">
									<h2>Service</h2>
								</label> <select name="services" id="services" class="form-select">
									<option selected hidden>Select...</option>
									<%
									try {
										Class.forName("org.postgresql.Driver");

										// url = ""
										String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
										Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");
										Statement stmt = conn.createStatement();
										String sqlStr = "SELECT id,service_name FROM service";
										ResultSet rs = stmt.executeQuery(sqlStr);

										while (rs.next()) {
											int id = rs.getInt("id");
											String service_name = rs.getString("service_name");
											if (service_name.equals(booking.getServiceName())) {
										out.println("<option value='" + id + "' selected>" + service_name + "</option>");

											} else {
										out.println("<option value='" + id + "'>" + service_name + "</option>");
											}
										}
										conn.close();
									} catch (Exception e) {
										out.println("Error: " + e);
									}
									%>
								</select>
							</div>
							<div
								style="display: flex; flex-direction: column; margin-top: 3.5%;">
								<label for="date">
									<h2>Date</h2>
								</label>
								<%
								String dateFormat = booking.getDate().toString().substring(0, 10);
								out.println("<input type='date' name='date' id='date' class='form-control' value='" + dateFormat + "' min='"
										+ dateFormat + "'");
								%>
							</div>
							<div
								style="display: flex; flex-direction: column; margin-top: 3.5%;">
								<label for="time">
									<h2>Time</h2>
								</label> <input type="time" name="time" id="time" class="form-control"
									value="<%=booking.getDate().toString().substring(11, 16)%>">
							</div>

							<div
								style="display: flex; flex-direction: column; margin-top: 3.5%;">
								<label for="caregivers">
									<h2>Staff</h2>
								</label> <select name="caregivers" id="caregivers" class="form-select">
									<option selected hidden>Select...</option>
									<%
									try {
										Class.forName("org.postgresql.Driver"); // load driver
										String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
										String username = "neondb_owner";
										String password = "npg_CF5WgzPNhdf6";
										Connection conn = DriverManager.getConnection(dbUrl, username, password);

										PreparedStatement pstmt = conn.prepareStatement("SELECT id,username FROM member WHERE role='staff'");

										//								    	 dispatcher = request.getRequestDispatcher("authentication/homepage.jsp");

										ResultSet rs = pstmt.executeQuery();
										while (rs.next()) {
											int memberId = rs.getInt("id");
											String memberName = rs.getString("username");
											if (memberName.equals(booking.getStaff())) {
										out.println("<option value='" + memberId + "' selected>" + memberName + "</option>");

											} else {
										out.println("<option value='" + memberId + "'>" + memberName + "</option>");
											}
										}

									} catch (Exception e) {
										e.printStackTrace();

									}
									%>
								</select>
							</div>

							<div
								style="margin-top: 5%; display: flex; justify-content: flex-end;">
								<button type="submit" class="btn btn-primary px-5 py-2" id="saveChanges" disabled>Save
									Changes</button>
							</div>
							<input type="hidden" value="<%= booking.getId() %>" id="bookingId" name="bookingId"/>
							
						</form>
					</div>
				</div>

			</div>

		</div>
	</section>

	</section>
	<script src="https://unpkg.com/boxicons@2.1.3/dist/boxicons.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
            arrow[i].addEventListener("click", (e) => {
                let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
                arrowParent.classList.toggle("showMenu");
            });
        }
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".bx-menu");
        console.log(sidebarBtn);
        sidebarBtn.addEventListener("click", () => {
            sidebar.classList.toggle("close");
        });
        document.addEventListener("DOMContentLoaded",(event)=>{
            let input = document.querySelectorAll("input, select");
            let saveChanges = document.getElementById("saveChanges");
            let oldValues = [];
            input.forEach((inputField) => {
                let id = inputField.id;
                let oldValue = inputField.value;
                oldValues.push({ id: id, oldValueOfInput: oldValue });
                inputField.addEventListener("input", (e) => {
                    if (inputField.value === oldValue) {
                        saveChanges.setAttribute("disabled", "");
                    } else {
                        saveChanges.removeAttribute("disabled");
                    }
                });
            });
        })
    </script>
</body>

</html>