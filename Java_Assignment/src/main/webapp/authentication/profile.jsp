<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.*"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.profile-container {
    max-width: 700px;
    margin: 40px auto;
    font-family: Arial, sans-serif;
}

.section-title {
    font-size: 22px;
    font-weight: 600;
}

.section-subtitle {
    color: #666;
    margin-top: 4px;
    margin-bottom: 20px;
}

.subsection-title {
    font-size: 18px;
    margin-bottom: 15px;
}

.divider {
    height: 1px;
    background: #e5e5e5;
    margin: 20px 0;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding: 10px 0;
}

.detail-label {
    font-weight: 600;
    width: 150px;
}

.detail-content {
    flex-grow: 1;
}

.value {
    font-size: 15px;
}

.edit-input {
    width: 60%;
    padding: 8px 10px;
    border: 1px solid #d0d0d0;
    border-radius: 6px;
    font-size: 15px;
    display: none;
}

.edit-btn {
    background: none;
    border: none;
    color: #4a4a4a;
    font-weight: 500;
    cursor: pointer;
    margin-left: 20px;
}

.edit-actions {
    display: none;
    margin-top: 10px;
}

.cancel-btn,
.save-btn {
    padding: 6px 14px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    font-size: 14px;
}

.cancel-btn {
    background: none;
    color: #444;
}

.save-btn {
    background: #111;
    color: white;
    margin-left: 5px;
}

.booking-card {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 10px;
    border-bottom: 1px solid #eee;
    font-family: Arial;
}

.booking-left {
    display: flex;
    gap: 18px;
}

.booking-date {
    text-align: center;
    font-weight: bold;
    width: 60px;
}

.booking-service {
    display: flex;
    flex-direction: column;
    gap: 3px;
}

.booking-status {
    padding: 3px 10px;
    border-radius: 14px;
    font-size: 12px;
    font-weight: bold;
}

/* STATUS COLORS */
.status-upcoming { background: #dbeafe; color:#2563eb; }
.status-done     { background: #dcfce7; color:#15803d; }
.status-cancelled{ background: #fee2e2; color:#b91c1c; }

.price {
    font-weight: bold;
    font-size: 16px;
}



</style>
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<%
HttpSession session1 = request.getSession();
RequestDispatcher dispatcher = null;
Integer memberID =  (Integer) session1.getAttribute("member_id");

String member_name = null;
String email = null;
int number = 0;
try {
			 Class.forName("org.postgresql.Driver"); // load driver
		     String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
		     String username = "neondb_owner";
		     String password = "npg_CF5WgzPNhdf6";
		     Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
		     PreparedStatement pstmt = conn.prepareStatement("select * from member WHERE id=?");
		     
		     pstmt.setInt(1, memberID);
		     
		     ResultSet rs = pstmt.executeQuery();
		     if(rs.next()) {
		    	 // getting profile details for now
		    	 member_name = rs.getString("username");
		    	 email = rs.getString("email");
		    	 String n = rs.getString("number");
		    	 number = Integer.parseInt(n);
		     }else {
		    	 dispatcher = request.getRequestDispatcher("../authentication/login.jsp");
		     }
		     
		     //dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
			
		}
%>
<form action="${pageContext.request.contextPath}/updateProfile" method="post">

	<div class="profile-container">

    <h2 class="section-title">My profile</h2>
    <p class="section-subtitle">Manage your profile details.</p>

    <div class="divider"></div>

    <h3 class="subsection-title">Personal details</h3>

    <div class="detail-row">
        <label class="detail-label">Full name</label>

        <div class="detail-content">
            <span class="value" id="name-value"><%=member_name %></span>

            <input type="text" name='username' id="name-input" class="edit-input" value="<%=member_name %>">

            <div class="edit-actions" id="name-actions">
            </div>

            <button class="edit-btn" id="name-edit-btn" type="button">Edit</button>
        </div>
    </div>

    <div class="divider"></div>

    <!-- EMAIL -->
    <div class="detail-row">
        <label class="detail-label">Email address</label>

        <div class="detail-content">
            <span class="value"  id="email-value"><%=email %></span>

            <input type="text" name='email' id="email-input" class="edit-input" value="<%=email%>">

            <div class="edit-actions" id="email-actions">
            </div>

            <button class="edit-btn" id="email-edit-btn" type="button">Edit</button>
        </div>
    </div>

    <div class="divider"></div>

    <div class="detail-row">
        <label class="detail-label">Phone number</label>

        <div class="detail-content">
            <span class="value" id="phone-value"><%=number %></span>

            <input type="text" name='number' id="phone-input" class="edit-input" placeholder="98765432" value="<%=number%>">

            <div class="edit-actions" id="phone-actions">
            </div>

            <button class="edit-btn" id="phone-edit-btn" type="button">Edit</button>
        </div>
     </div>
     
     <div style="text-align:right; margin-top:20px;">
    <button type="submit" class="save-btn">Save all changes</button>
</div>

	</div>
	
</form>



<%

ResultSet rsBooking = null;
try {
	 Class.forName("org.postgresql.Driver"); // load driver
    String dbUrl = "jdbc:postgresql://ep-green-mode-a1uewakv-pooler.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require";
    String username = "neondb_owner";
    String password = "npg_CF5WgzPNhdf6";
    Connection conn = DriverManager.getConnection(dbUrl, username, password);
	
    PreparedStatement pstmt2 = conn.prepareStatement(
    	    " SELECT b.id, b.service_date, b.status, s.service_name, s.price FROM member_booking b JOIN service s ON b.service_id = s.id  WHERE b.member_id = ? ORDER BY b.service_date DESC;"
    	);
    

	pstmt2.setInt(1, memberID);
	rsBooking = pstmt2.executeQuery();
    
    //dispatcher.forward(request, response);
}catch(Exception e){
	e.printStackTrace();	
}
%>


<div class="profile-container">
    <h2 class="section-title">My Appointments</h2>
    <p class="section-subtitle">View all your upcoming and past bookings.</p>
    <div class="divider"></div>

<%
while (rsBooking.next()) {

	 // Get date & time
    java.sql.Timestamp ts = rsBooking.getTimestamp("service_date");
    java.time.LocalDateTime dt = ts.toLocalDateTime();

    // Format month properly
    String monthRaw = dt.getMonth().toString();   // "NOVEMBER"
    String month = monthRaw.substring(0, 1).toUpperCase() +
                   monthRaw.substring(1, 3).toLowerCase(); // "Nov"

    int day = dt.getDayOfMonth();
    String time = dt.toLocalTime().toString().substring(0, 5); // "12:47"

    // Status
    String status = rsBooking.getString("status");
    String statusClass = "";

    if (status.equalsIgnoreCase("UPCOMING")) 
        statusClass = "status-upcoming";
    else if (status.equalsIgnoreCase("COMPLETED")) 
        statusClass = "status-done";
    else if (status.equalsIgnoreCase("CANCELLED")) 
        statusClass = "status-cancelled";

    // Service name & price
    String serviceName = rsBooking.getString("service_name");
    int price = rsBooking.getInt("price");
%>

    <div class="booking-card">

        <div class="booking-left">
            <div class="booking-date">
                <div class="day"><%= day %></div>
                <div class="month"><%= month %></div>
            </div>

            <div class="booking-service">
                <span><%= rsBooking.getString("service_name") %></span>
                <small><%= time %></small>

                <span class="booking-status <%= statusClass %>">
                    <%= status %>
                </span>
            </div>
        </div>

        <div class="price-section">
            <div class="price">$<%= rsBooking.getInt("price") %></div>
        </div>

    </div>

<%
} // end while
%>

</div>




	
	
<script>
// for name
document.getElementById("name-edit-btn").addEventListener("click", function () {
    document.getElementById("name-value").style.display = "none";
    document.getElementById("name-input").style.display = "block";
    document.getElementById("name-actions").style.display = "flex";

});

//document.getElementById("save-btn").addEventListener("click", function () {
    //document.getElementById("name-value").style.display = "block";
   // document.getElemenyById("name-input").style.display = "none"
//});


document.getElementById("email-edit-btn").addEventListener("click", function () {
    document.getElementById("email-value").style.display = "none";
    document.getElementById("email-input").style.display = "block";
    document.getElementById("email-actions").style.display = "flex";
});

// for phone nuber
document.getElementById("phone-edit-btn").addEventListener("click", function () {
    document.getElementById("phone-value").style.display = "none";
    document.getElementById("phone-input").style.display = "block";
    document.getElementById("phone-actions").style.display = "flex";
});

</script>

</body>
</html>