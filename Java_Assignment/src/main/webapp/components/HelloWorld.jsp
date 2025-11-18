<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p id="textShown">Hello World!</p>
</body>
<script>
/* ========================================== 
Author: Lee Yee Shyan Shanna (P2405889)
Date: 23/10/2025
Description: ST0510/JAD week 1 submission
============================================= */
	studentID = prompt("Enter your Student ID:")
	let name = prompt("Enter your Name:");
	if (studentID == "" && name == ""){
		alert("Student ID and/or name is empty. Please type again")
	} else {
		let timeNow = new Date().getHours()
		if (timeNow >=0 && timeNow <=10){
		alert("Good Morning!.." + name + "("+ studentID+")")
		document.getElementById("textShown").innerText = "Good Morning!.." + name + "("+ studentID+")"

		} else if (timeNow > 10 && timeNow < 1600){
			alert("Good Afternoon!.." + name + "("+ studentID+")")
			document.getElementById("textShown").innerText = "Good Afternoon!.." + name + "("+ studentID+")"

		} else {
			alert("Good Night!.." + name + "("+ studentID+")")
			document.getElementById("textShown").innerText = "Good Night!.." + name + "("+ studentID+")"
		}
	}
</script>
</html>