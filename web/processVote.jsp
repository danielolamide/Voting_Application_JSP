<%-- 
    Document   : processVote
    Created on : Jul 5, 2018, 10:14:00 AM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%      
        session = request.getSession();
        String pChoice = request.getParameter("p-vote");
        String vpChoice = request.getParameter("vp-vote");
        String pmChoice = request.getParameter("pm-vote");
        int voteUpdate = 0;
        String id_number = (String)session.getAttribute("uName");
        String status = (String)session.getAttribute("userStatus");
        String newStat= "y";

    try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
       String pSelect = "SELECT votes FROM p_candidates WHERE name='"+pChoice+"'";
       Statement st  = con.createStatement();
       ResultSet rs =st.executeQuery(pSelect);
       if(rs.next()){
        int votes = rs.getInt("votes");
        voteUpdate = votes+1;
       }
       String pVote = "UPDATE p_candidates SET votes=?  WHERE name=?";
       PreparedStatement pst= con.prepareStatement(pVote);
       pst.setInt(1, voteUpdate);
       pst.setString(2,pChoice);
       pst.executeUpdate();
       
       String vpSelect = "SELECT votes FROM vp_candidates WHERE name='"+vpChoice+"'";
       Statement st1  = con.createStatement();
       ResultSet rs1 =st1.executeQuery(vpSelect);
       if(rs1.next()){
        int votes = rs1.getInt("votes");
        voteUpdate = votes+1;
       }
       String vpVote = "UPDATE vp_candidates SET votes=?  WHERE name=?";
       PreparedStatement pst1= con.prepareStatement(vpVote);
       pst1.setInt(1, voteUpdate);
       pst1.setString(2,vpChoice);
       pst1.executeUpdate();
       
       String pmSelect = "SELECT votes FROM pm_candidates WHERE name='"+pmChoice+"'";
       Statement st2  = con.createStatement();
       ResultSet rs2 =st2.executeQuery(pmSelect);
       if(rs2.next()){
        int votes = rs2.getInt("votes");
        voteUpdate = votes+1;
       }
       String pmVote = "UPDATE pm_candidates SET votes=? WHERE name=?";
       PreparedStatement pst2= con.prepareStatement(pmVote);
       pst2.setInt(1, voteUpdate);
       pst2.setString(2,pmChoice);
       pst2.executeUpdate();
       
       String updateVoteSt = "UPDATE  voterRegistration SET vote_status=? WHERE id_number=?";
       PreparedStatement pstUpdate = con.prepareStatement(updateVoteSt);
       pstUpdate.setString(1,newStat);
       pstUpdate.setString(2,id_number); 
       pstUpdate.executeUpdate();
        
       session.setAttribute("userStatus", newStat);
       response.sendRedirect("voting-results.jsp");
    }
    catch(Exception e){
        out.print("Error Voting");
    }

%>