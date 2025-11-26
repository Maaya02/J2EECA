<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../test/navbar.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>

    <style>
        .service-card {
            width: 400px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            border: 1px solid #ececec;
        }

        .service-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .service-content {
            padding: 15px 20px 20px;
        }

        .service-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .service-title {
            font-size: 20px;
            font-weight: bold;
        }

        .service-rate {
            font-size: 16px;
            background: #edf2ff;
            color: #3f51b5;
            padding: 4px 10px;
            border-radius: 8px;
            font-weight: 600;
        }

        .service-description {
            font-size: 14px;
            color: #555;
            margin: 10px 0 20px;
        }

        .details-btn {
            width: 100%;
            padding: 10px;
            background: #be6a72;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
        }

        .service-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            jjustify-content: space-between;
            gap: 25px;
            padding: 20px 80px;
        }

        .filter-section {
            margin: 30px 0;
            text-align: center;
            justify-content: space-between;
        }

        .filter-btn {
            margin: 5px;
            padding: 10px 20px;
            background: #ad89e4;
            color: white;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>

<body>

<%
    // ====== POSTGRES CONNECTION ======
    Class.forName("org.postgresql.Driver");
    String connURL = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
    Connection conn = DriverManager.getConnection(connURL, "neondb_owner", "npg_CF5WgzPNhdf6");

    // ====== LOAD CATEGORIES ======
    Statement stmtCat = conn.createStatement();
    ResultSet rsCat = stmtCat.executeQuery("SELECT id, category_name FROM categories");

    // Get selected category from URL (?category=ID)
    String selectedCategory = request.getParameter("category");
%>

    <!-- FILTER BUTTONS -->
    <div class="filter-section">
        <a href="services.jsp">
            <button class="filter-btn">All Services</button>
        </a>
        <% while (rsCat.next()) { %>
            <a href="services.jsp?category=<%= rsCat.getInt("id") %>">
                <button class="filter-btn">
                    <%= rsCat.getString("category_name") %>
                </button>
            </a>
        <% } %>
    </div>
    <!-- SERVICE GRID -->
    <div class="service-grid">
    <%
        // ====== LOAD SERVICES ======
        String sqlServices;

        if (selectedCategory != null) {
            sqlServices = "SELECT * FROM service WHERE category_id = " + selectedCategory;
        } else {
            sqlServices = "SELECT * FROM service";
            
        }

        Statement stmtSvc = conn.createStatement();
        ResultSet rsSvc = stmtSvc.executeQuery(sqlServices);

        while (rsSvc.next()) {
        	int service_id = rsSvc.getInt("id");
    %>
        <div class="service-card">
            <img src="<%= rsSvc.getString("image_url") %>" class="service-img" alt="service">
            <div class="service-content">
                <div class="service-header">
                    <h3 class="service-title"><%= rsSvc.getString("service_name") %></h3>
                    <span class="service-rate">$<%= rsSvc.getString("price") %></span>
                </div>
                <p class="service-description">
                    <%= rsSvc.getString("service_description") %>
                </p>
                <a href="<%=request.getContextPath()%>/service/serviceDetail.jsp?id=<%= service_id %>">More Details</a>
                
            </div>
        </div>

    <% } %>

    </div>

<%
    conn.close();
%>

</body>
</html>
