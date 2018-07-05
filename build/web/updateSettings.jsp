<%-- 
    Document   : updateSettings
    Created on : Jul 4, 2018, 8:58:23 PM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page import="java.sql.*, java.util.*" %>
<%
    session = request.getSession();
    String email = request.getParameter("vote-Email");
    String password = request.getParameter("uPass");
    String id = (String)session.getAttribute("idNo");
    String passConfirm = request.getParameter("uPassConfirm");
    String hashed =BCrypt.hashpw(password, BCrypt.gensalt(12));
    
    if(password.equals(passConfirm)){
         try{
        Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
       String sql_update = "UPDATE voterRegistration SET password=?, email_address=? WHERE id_number =?";
       PreparedStatement pst= con.prepareStatement(sql_update);
       pst.setString(1, hashed);
       pst.setString(2,email);
       pst.setString(3,id);
       
       pst.executeUpdate();
       session.setAttribute("email", email);
       response.sendRedirect("settings.jsp");
    }
    catch(Exception e){
        out.print("Error Updating Data");
    }
    }
    else
        out.print("Passwords don't match");
   
%>