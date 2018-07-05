<%-- 
    Document   : vote
    Created on : Jul 5, 2018, 6:58:31 AM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    session= request.getSession();
    ResultSet rs1 =null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    
    if(session.getAttribute("userStatus").equals("y"))
        response.sendRedirect("voting-results.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Cast your vote</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="icon" type="image/png" href="./images/favicon.png">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
 	<!-- <link rel="stylesheet" type="text/css" href="./css/hide.css"> -->
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
			<a href="./voting-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
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
					<a href="voting-dashboard.jsp">Free My Vote</a>
				</div>
				<div id="user-icon">
					<div class="drop-down">
						<button onclick="dropFunction()" class="dropbtn"><i class="fas fa-user-circle"></i>${uName}<i class="fas fa-sort-down"></i></button>
						<div id="myDropButton" class="drop-content">
							<a href="./settings.jsp"><i class="fas fa-wrench"></i> Settings</a>
							<a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-bar" style="background-color: black;"></div>
	</div>
	<div id="vote-pg">
		<form id="vote-form" method="post" action="processVote.jsp">
			<h1>Cast your vote</h1>
			<div id="form-content">
				President:
				<p>
					<%
                                                     try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                                        Statement st = con.createStatement() ;
                                                        String selectP = "SELECT * FROM p_candidates";
                                                        rs1 =st.executeQuery(selectP);
                                        %>
                                        <select id="vote-choice1" name="p-vote" required>
						<option value="" disabled selected>Select your option</option>
                                               <% while(rs1.next()){%> 
                                               <option value="<%= rs1.getString("name")%>"><%= rs1.getString("name")%></option>
                                               <%}%>
					</select>
                                        <%
                                            
                                                }
                                                catch(Exception e)
                                                {
                                                     out.println("Unable to get data");
                                                }
                                        %>
				</p>
				Vice President:
				<p>
					<%
                                                     try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                                        Statement st = con.createStatement() ;
                                                        String selectVP= "SELECT name FROM vp_candidates";
                                                        rs2 =st.executeQuery(selectVP);
                                        %>
                                        <select id="vote-choice2" name="vp-vote" required>
						<option value=""disabled selected>Select your option</option>
						<% while(rs2.next()){%> 
                                               <option value="<%= rs2.getString("name")%>"><%= rs2.getString("name")%></option>
                                               <%}%>
					</select>
                                        <%
                                            
                                                }
                                                catch(Exception e)
                                                {
                                                     out.println("Unable to get data");
                                                }
                                        %>
				</p>
				Prime Minister:
				<p>
					<%
                                                     try{
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                                        Statement st = con.createStatement() ;
                                                        String selectPM="SELECT name FROM pm_candidates";
                                                        rs3 =st.executeQuery(selectPM);
                                        %>
                                        <select id="vote-choice3" name="pm-vote" required>
						<option value=""disabled selected>Select your option</option>
						<% while(rs3.next()){%> 
                                               <option value="<%= rs3.getString("name")%>"><%= rs3.getString("name")%></option>
                                               <%}%>
					</select>
                                        <%
                                            
                                                }
                                                catch(Exception e)
                                                {
                                                     out.println("Unable to get data");
                                                }
                                        %>     
				</p>
				<br>
				<input type="submit" value="Submit" name="submit" id="cast-vote">
				<br>
				<!-- <span id="voteCast" class="hidden" style="font-family: 'Montserrat',sans-serif; font-size: 20px; text-align: center; color: white;">Vote Cast</span><br> -->
				<!--<a id="result-link" class="hidden" href="./voting-results.php" style="text-decoration: none; color: gold; font-size: 20px;">See Results</a>-->
			</div>
		</form>
	</div>
	</div>
</body>
</html>