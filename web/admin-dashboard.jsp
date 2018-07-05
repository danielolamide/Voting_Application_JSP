<%-- 
    Document   : admin-dashboard
    Created on : Jul 4, 2018, 8:31:58 PM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%  session = request.getSession();
    if(session.getAttribute("uName")==null)
        response.sendRedirect("login.html");
    if(!(session.getAttribute("userType").equals("a")))
        response.sendRedirect("voting-dashboard.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Dashboard</title>
	<link rel="stylesheet" type="text/css" href="./css/admin-dashboard.css">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="icon" type="image/png" href="./images/favicon.png">
	<meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<script src="./scripts/script.js"></script>
</head>
<body>
	<div id = "side-menu" class="side-nav">
		<div id="closebtn-div"><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a></div>
		<div id="sm-wrapper">
			<a href="./admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
			<a href="./createB.jsp"><i class="fas fa-archive"></i> Create a ballot</a>
			<a href="./vote.jsp"><i class="fas fa-archive"></i> Cast a vote</a>
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
						<button onclick="dropFunction()" class="dropbtn"><i class="fas fa-user-circle"></i> ${uName} <i class="fas fa-sort-down"></i></button>
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
	<div id="admin-page-content">
		<div style="background-color: #EDEDED;display: inline-block; margin-top: 20px; margin-left:5px; border-radius: 10px; width: 90%;">
			<div style="float: left; padding: 5px 30px; width: 25%; border-right: 1px solid grey;">
				<small style="font-family: 'Montserrat',sans-serif; font-size: 12px; font-weight: bold;">Total Number of Registered Voters</small>
				<br>
				<span style="font-family: 'Montserrat',sans-serif; font-size: 30px;">
                                    <%
                                    try
                                    {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root",""); 
                                    Statement st=con.createStatement();
                                    String strQuery = "SELECT COUNT(*) FROM voterRegistration";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrow="";
                                    while(rs.next()){
                                    Countrow = rs.getString(1);
                                    out.println(Countrow);
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }
                                %>
                                </span>
			</div>
			<div style="float: left; padding: 5px 30px; width: 25%;border-right: 1px solid grey;">
				<small style="font-family: 'Montserrat',sans-serif; font-size: 12px; font-weight: bold;">Total Number of Active Elections</small>
				<br>
				<span style="font-family: 'Montserrat',sans-serif; font-size: 30px;"><%
                                    try
                                    {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root",""); 
                                    Statement st=con.createStatement();
                                    String strQuery = "SELECT COUNT(*) FROM ballotBox";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrow="";
                                    while(rs.next()){
                                    Countrow = rs.getString(1);
                                    out.println(Countrow);
                                    }
                                    }
                                    catch (Exception e){
                                    e.printStackTrace();
                                    }
                                %></span>
			</div>
			<div style="float: left; padding-top : 5px; padding-bottom: 5px; padding-left: 5px;width: 30%;">
				<small style="font-family: 'Montserrat',sans-serif; font-size: 12px; font-weight: bold;">Total Number of Votes Cast</small>
				<br>
                                <span style="font-family: 'Montserrat',sans-serif; font-size: 30px;">
                                    3
                                </span>
			</div>
		</div>
		<div id="admin-card">
			<div id="admin-card-details">
				<div id="admin-header-img">
					<img src="./images/user.png">
				</div>
				<div id="admin-header-txt">
					<span>Administrator Details</span>
				</div>
				<div id="admin-icon">
					<img src="./images/id-image.png">
				</div>
				<div id="admin-details">
					<ul>
						<li>Name:<b> ${uName} </b></li>
						<li>ID Number:<b> ${idNo} </b></li>
						<li>Date of Birth:<b> ${DOB} </b></li>
                                                <li>Gender:<b> ${gender} </b></li>
					</ul>
				</div>
				<div style="margin-left: 300px; margin-top: 60px;"><button onclick="location.href='./admin-settings.php'" id="edit-settings-btn"><i class="fas fa-wrench"></i> Edit Details</button></div>
			</div>
		</div>
		<div id="createBallot">
			<div id="ballot-details">
				<span>Create a ballot</span>
			</div>	
			<div id="ballotBtn"><a href="./createB.jsp">Create Ballot</a></div>
		</div>
		<div id="admin-faq-card">
			<div id="admin-faq-detail"><a href= "#">FAQ</a></div>
			<div style="margin-left: 230px; margin-top: 20px;"><span style="font-family: 'Montserrat',sans-serif; font-size: 14px; font-weight: bold; color: white; background-color: #7CFC00; border-radius: 5px; padding: 2px 4px;">Coming Soon</span></div>
		</div> 
		<div id="admin-settings-card">
			<div id="admin-setting-detail">
				<a href="./settings.jsp">Settings</a>
			</div>
		</div>
	</div>
</body>
</html>