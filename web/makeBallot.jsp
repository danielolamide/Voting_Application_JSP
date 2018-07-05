<%-- 
    Document   : makeBallot
    Created on : Jul 5, 2018, 8:00:21 AM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%      String ballot_name = request.getParameter("ballotName");
        String noOfVoters = request.getParameter("voterNumber");
        String cand1 = request.getParameter("cand1");
        String cand2 = request.getParameter("cand2");
        String cand3 = request.getParameter("cand3");
        int ballotID = 1;
        int votes  = 0;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
            Statement st = con.createStatement();
            String insertBallot = "INSERT INTO ballotBox(ballot_id,ballot_name) VALUES('"+ballotID+"','"+ballot_name+"')";
            st.executeUpdate(insertBallot);
            String insertPresidents = "INSERT INTO p_candidates(ballot_id,name,votes) VALUES('"+ballotID+"','"+cand1+"','"+votes+"' )";
            st.executeUpdate(insertPresidents);
            String insertPresidents1 = "INSERT INTO p_candidates(ballot_id,name,votes) VALUES('"+ballotID+"','"+cand2+"','"+votes+"' )";
            st.executeUpdate(insertPresidents1);
            String insertPresidents2 = "INSERT INTO p_candidates(ballot_id,name,votes) VALUES('"+ballotID+"','"+cand3+"','"+votes+"' )";
            st.executeUpdate(insertPresidents2);
            response.sendRedirect("createB1.jsp");
        }   
        catch(Exception e){
            System.out.print("Error Adding Ballot");
        }
        
%>