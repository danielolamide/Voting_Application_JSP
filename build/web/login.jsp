<%-- 
    Document   : login
    Created on : Jul 4, 2018, 1:53:43 PM
    Author     : issabeast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page import="java.sql.*, java.util.*" %>

<%
    String f_name = request.getParameter("fName");
    String l_name = request.getParameter("lName");
    String email = request.getParameter("email");
    String id = request.getParameter("idNumber");
    String uPass = request.getParameter("password");
    String name = f_name +" "+l_name;
    
    try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electionJSP","root","");
//       Statement st = con.createStatement();
       String selectUserTable = "SELECT * FROM voterRegistration WHERE id_number=?";
       PreparedStatement pst = con.prepareStatement(selectUserTable);
//       pst = con.prepareStatement(selectUserTable);
       pst.setString(1,id);
       ResultSet rs = pst.executeQuery();
//       rs =pst.executeQuery(selectUserTable);
       
       while(rs.next()){
           String idNumber  = rs.getString("id_number");
           String userName = rs.getString("user_name");
           String email_add  = rs.getString("email_address");
           String pass = rs.getString("password");
           String date_of_birth = rs.getString("user_dob");
           String gender  = rs.getString("user_gender");
           String uType = rs.getString("user_type");
           String stat = rs.getString("vote_status");
           
           
           boolean success = BCrypt.checkpw(uPass, pass);
           
           if(success){
               if((userName.equals(name))&&(idNumber.equals(id))&&(email_add.equals(email))){
                   System.out.println("Successful Login");
                   session = request.getSession();
                   session.setAttribute("uName", name);
                   session.setAttribute("idNo",id);
                   session.setAttribute("DOB",date_of_birth);
                   session.setAttribute("email",email);
                   session.setAttribute("gender",gender);
                   session.setAttribute("userType", uType);
                   session.setAttribute("userStatus",stat );
//                   session.setAttribute("isUserLoggedIn",true);
                    if(!(session.getAttribute("userType").equals("a")))
                    {
                        response.sendRedirect("voting-dashboard.jsp");
                    }
                    else{
                        response.sendRedirect("admin-dashboard.jsp");
                    }
                   
               }
               else{
                   
                    String noDashboardURL = "login.html";
                   response.sendRedirect(noDashboardURL);
                   
               }
           }
           else{
                   
                    String noDashboardURL = "login.html";
                   response.sendRedirect(noDashboardURL);
                   
        }
    }
    }
    catch(Exception e ){
        System.out.println("Success");
    }
%>