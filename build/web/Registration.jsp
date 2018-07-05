<%-- 
    Document   : Registration
    Created on : Jul 4, 2018, 11:25:28 AM
    Author     : issabeast
--%>

<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%  
    String f_name = request.getParameter("fName");
    String l_name = request.getParameter("lName");
    String email = request.getParameter("email");
    String id = request.getParameter("idNumber");
    String uPass = request.getParameter("uPass");
    String confirmPass = request.getParameter("cUpass");
    String dob= request.getParameter("dob");
    String sex= request.getParameter("sex");
    String name = f_name +" "+l_name;
    String hashed =BCrypt.hashpw(uPass, BCrypt.gensalt(12));
    
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
        Statement st = con.createStatement();
        String userType = "u";
        String voteSt = "n";
        String insertUsers = "INSERT INTO voterRegistration(id_number, user_name,email_address,password,user_gender,user_dob,user_type,vote_status) VALUES('"+id+"','"+name+"','"+email+"','"+hashed+"','"+sex+"','"+dob+"','"+userType+"','"+voteSt+"')";
        st.executeUpdate(insertUsers);
        out.println("Data successfully inserted");
        String loginURL = "login.html";
        response.sendRedirect(loginURL);
        
    }
    catch(Exception e){
       out.println("Error Connecting to DB");
    }
%>