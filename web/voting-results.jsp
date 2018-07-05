<%-- 
    Document   : voting-results
    Created on : Jul 5, 2018, 10:10:55 AM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    session = request.getSession();
%>
<!DOCTYPE html>
<html>
<head>
	<title>Voting Results</title>
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
</head>
<body>
	<div id = "side-menu" class="side-nav">
		<div id="closebtn-div"><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a></div>
		<div id="sm-wrapper">
			<a href="./admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
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
	<div id="vote-results">
		<div style="padding-top: 40px;">
		<div id="result-card">
			<div id="president">
				Presidential Results
				<br>
				<hr class="result-hr">
				<table>
					<tr>
						<th style="border-bottom: 2px solid black;">Name</th>
						<th style="border-bottom: 2px solid black;">Votes</th>
					</tr>
					<%
                                            try
                                            {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            String pquery="select * from p_candidates";
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                            Statement st=con.createStatement();
                                            ResultSet rs=st.executeQuery(pquery);
                                            while(rs.next())
                                            {

                                            %>
                                                <tr><td style="padding: 4px 8px;"> <%=rs.getString("name") %></td>
                                                <td  style="padding: 4px 8px;"> <%=rs.getInt("votes") %></td>
                                                </tr>
                                            <%

                                            }
                                            %>
				</table>
                                <%
                                    rs.close();
                                    }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }

                                %>        
			</div>
			<div id="vice-president" style="margin-left: -160px;">
				<br>
				<br>Vice President Results
				<hr class="result-hr">
				<table>
                                    <tr>
						<th style="border-bottom: 2px solid black;">Name</th>
						<th style="border-bottom: 2px solid black;">Votes</th>
                                    </tr>
				   <%
                                            try
                                            {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            String vpquery="select * from vp_candidates";
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                            Statement st=con.createStatement();
                                            ResultSet rs=st.executeQuery(vpquery);
                                            while(rs.next())
                                            {

                                            %>
                                                <tr><td style="padding: 4px 8px;"> <%=rs.getString("name") %></td>
                                                <td  style="padding: 4px 8px;"> <%=rs.getInt("votes") %></td>
                                                </tr>
                                            <%

                                            }
                                            %> 
				</table>
                                <%
                                    rs.close();
                                    }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }

                                %>    
			</div>
			<div id="prime-minister" style="margin-left: -170px;">
				<br>
				<br>
				<br>
				<br>Prime Minister Results
				<hr class="result-hr">
                                <table>
				<tr>
						<th style="border-bottom: 2px solid black;">Name</th>
						<th style="border-bottom: 2px solid black;">Votes</th>
                                </tr>
				   <%
                                            try
                                            {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            String pmquery="select * from pm_candidates";
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
                                            Statement st=con.createStatement();
                                            ResultSet rs=st.executeQuery(pmquery);
                                            while(rs.next())
                                            {

                                            %>
                                                <tr><td style="padding: 4px 8px;"> <%=rs.getString("name") %></td>
                                                <td  style="padding: 4px 8px;"> <%=rs.getInt("votes") %></td>
                                                </tr>
                                            <%

                                            }
                                            %> 
				</table>
                                <%
                                    rs.close();
                                    }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                                %>  
			</div>
		</div>
		</div>
	</div>
</body>
</html>