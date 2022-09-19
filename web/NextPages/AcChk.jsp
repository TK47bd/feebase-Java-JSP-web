<%-- 
    Document   : feeBase: all cost
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
   String action = request.getParameter("action");
   if(action.equals("Log in")){
       
       String uID = request.getParameter("Student_ID");
       String uPass = request.getParameter("PassWd");
       
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feeBaseDB","root","");
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select * from Userinf where ID='"+uID+"' and Pass='"+uPass+"'");
           
           if(rs.next()){     
           session.setAttribute("ID",uID); 
           response.sendRedirect("next.jsp");
           }
           else{
               out.println("<script>");
               out.println("alert('Wrong ID and Password!!');");
               out.println("location='../index.htm';");
               out.println("</script>");
           }
       
       }catch(Exception it){
           out.println("Error Found!!"+it);
       }
       
   }
   else if(action.equals("Create")){
              response.sendRedirect("CreateAcc.jsp");
   }
%>