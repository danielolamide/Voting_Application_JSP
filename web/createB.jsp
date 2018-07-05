<%-- 
    Document   : createB
    Created on : Jul 5, 2018, 6:59:45 AM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    session = request.getSession();
     if(session.getAttribute("uName")==null)
        response.sendRedirect("login.html");
    if(!(session.getAttribute("userType").equals("a")))
        {
            response.sendRedirect("voting-dashboard.jsp");
        }
%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Create A Ballot</title>
	<link rel="icon" type="image/png" href="./images/favicon.png">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/ballot.css"> 
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
	<script src="./scripts/script.js"></script>
</head>
<body>
	<div id = "side-menu" class="side-nav">
		<div id="closebtn-div"><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a></div>
		<div id="sm-wrapper">
			<a href="./admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
			<a href="./createB.jsp"><i class="fas fa-archive"></i> Create a ballot</a>
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
					<a href="./admin-dashboard.jsp">Free My Vote</a>
				</div>
				<div id="user-icon">
					<div class="drop-down">
						<button onclick="dropFunction()" class="dropbtn"><i class="fas fa-user-circle"></i>${uName}<i class="fas fa-sort-down"></i></button>
						<div id="myDropButton" class="drop-content">
							<a href="./settings.jsp"><i class="fas fa-wrench"></i> Settings</a>
							<a href="./logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-bar"></div>
	</div>
	<div id="ballot-div">
		<form id="create-ballot-form" method="post" action="makeBallot.jsp">
			<h1>Create a ballot - Set President</h1>
			<div id="ballot-form-content">
				Ballot Name:
				<p>
					<input class= "ballotDetail" type="text" name="ballotName" required>
				</p>
				Number of Voters:
				<p>
					<input class= "ballotDetail" type="number" name="voterNumber" required>
				</p>
				Candidate 1:
				<p>
				<input class= "ballotDetail" type="text" name="cand1" required>
				</p>
				Candidate 2:
				<p>
				<input class= "ballotDetail" type="text" name="cand2" required>
				</p>
				Candidate 3:
				<p>
				<input class= "ballotDetail" type="text" name="cand3">
				</p>
				<p>
					<input type="submit" name="submit" value="Continue">
				</p>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
