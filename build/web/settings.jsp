<%-- 
    Document   : settings
    Created on : Jul 4, 2018, 4:52:20 PM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session =request.getSession();  %>
<!DOCTYPE html>
<html>
<head>
	<title>Account Settings</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="icon" type="image/png" href="./images/favicon.png">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
	<script src="./scripts/script.js"></script>
	<script src="./scripts/jquery.js"></script>
</head>
<body>
	<div id = "side-menu" class="side-nav">
		<div id="closebtn-div"><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a></div>
		<div id="sm-wrapper">
			<a href="./voting-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
			<a href="./vote.html"><i class="fas fa-archive"></i> Cast a vote</a>
			<a href="./settings.jsp"><i class="fas fa-wrench"></i> Settings</a>
		</div>
	</div>
	<div id="wrapper">
		<div id="top-panel-dashboard">
		<div id="top-banner">
			<div id="banner-content">
				<button id="side-menu-btn" style="background-color: #2A3542; color: white; border-style: hidden;" onclick="openNav()"><i class="fas fa-bars"></i></button>
				<div id="logo-image">
					<img src="./images/logo.png">
				</div>
				<div id="logo-text">
					<a href="./voting-dashboard.php">Free My Vote</a>
				</div>
				<div id="user-icon">
					<div class="drop-down">
						<button onclick="dropFunction()" class="dropbtn"><i class="fas fa-user-circle"></i><% String name= (String)session.getAttribute("uName"); out.print(" "+name); %></i></button>
						<div id="myDropButton" class="drop-content">
							<a href="./settings.jsp"><i class="fas fa-wrench"></i> Settings</a>
							<a href="./logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-bar" style="background-color: black;"></div>
	</div>
	<div id="settings-pg">
		<div id="user-image-content">
			<div id = image-frame>
				<img src="./images/id-image.png">
			</div>
			<div style="margin-top:	30px; margin-left:120px;">
					<span style="font-family: 'Montserrat',sans-serif; text-align: center; font-weight: bold; font-size: 20px; color: #2A3542; background-color: white;"><% out.print(name);%></span><br>
			</div>
		</div>
		<div id="settings-content">
			<form id="edit-user-details" method="post" action="./updateSettings.jsp">
				<h1 class="setting-header">Personal Details</h1>
				<h2 class="setting-labels">Name:</h2><input type="text" name="name"  id ="setName" value="${uName}" readonly><br>
				<h2 class="setting-labels">Date of Birth:</h2>
				<input type="date" id="userDOB" value="${DOB}"readonly><br>
				<h2 class="setting-labels">Voter ID:</h2>
				<input type="text" name="vote-id" id="setID" value="${idNo}" readonly><br>
				<h2 class="setting-labels">Email <i class="fas fa-edit"></i>:</h2>
				<input type="email" name="vote-Email" id="setEmail" value="${email}"<br>
				<h2 class="setting-labels">Password <i class="fas fa-edit"></i>:</h2>
				<input type="password" id="setPass" name="uPass" value="12345678"><br>
				<h2 class="setting-labels">Re-type Password <i class="fas fa-edit"></i>:</h2>
				<input type="password" id="setRe-Type" name="uPassConfirm" value="12345678">
				<input type="submit" id="save-settings" name="submit" value="Save Changes">
			</form>
		</div>
	</div>
</body>
</html>
