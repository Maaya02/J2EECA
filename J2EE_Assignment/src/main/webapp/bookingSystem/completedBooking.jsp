<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <style>
        .mainDiv{
            width: 100%;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            display: flex;
            height: 100vh;
        }
    </style>
    <%@ include file="../components/navbar.jsp" %>
    
</head>

<body>
	
    <div class="mainDiv">
        <h1>✅</h1>
        <h1>Appointment Scheduled Successfully!</h1>
        <p>Thanks for choosing us! If you have any questions or need further assistance, feel free to reach out to us. See you soon!</p>
        <div class="d-flex">
            <button class="btn btn-primary" onclick="history.back()">Back</button>
        </div>
    </div>
</body>

</html>