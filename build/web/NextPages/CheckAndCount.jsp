<%-- 
    Document   : feeBase: all cost
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to feeBase</title>
        
        <link rel="stylesheet" href="../CSS/CAC.css" />
        <link rel="icon" href="../imgs/logo.png" sizes="50x50" />
        
    </head>

<body>
    <% 
        if(session.getAttribute("ID") == null)
    { %>
    <script> alert("you are not logged in!!");
    </script> 
   <%  response.sendRedirect("../index.htm");    
   } 
    %>    
       
    
        <%@ page import="java.sql.*"%>
        
<br/><br/><br/>

<div class="cost_adder">  
<form action="CheckAndCount.jsp" method="POST"> 
    
    <center> <label style="color:gray"> Select Semester no.: </label> </center> <br/>

<center>  
    <select name="SemesterList" id="SemesterList">
        
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
        <option>11</option>
        <option>12</option>
        
    </select>
</center> 
 <br/>
<center> <label style="color:gray"> Select Waver %(if any, select 0 for none): </label> </center> <br/>

<center>
<select name="WaverList" id="WaverList">
    
    <option>0</option>
    <option>10</option>
    <option>20</option>
    <option>30</option>
    <option>40</option>
    <option>50</option>
    <option>60</option>
    <option>80</option>
    
</select>
</center> <br/><br/>    

<center> <input type="submit" value="Calculate"/> </center> <br/> 

</form>
</div>


<% try{
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/user_feebase";
           String username="root";
           String password="";
           int SeMe = Integer.parseInt(request.getParameter("SemesterList"));
           int WaVe = Integer.parseInt(request.getParameter("WaverList"));   
           String StrID = (String)session.getAttribute("ID");
           String query=String.format("select * from $%s",StrID)+" where Sem_no='"+SeMe+"'";
           Connection conn=DriverManager.getConnection(url,username,password);
           Statement stmt=conn.createStatement();
           ResultSet rs=stmt.executeQuery(query);
           
           if(rs.next()){ 

String reg = rs.getString("Reg");
String mid = rs.getString("Mid");
String fin = rs.getString("Final");
int a = Integer.parseInt(reg);
int b = Integer.parseInt(mid);
int c = Integer.parseInt(fin);

int total = a+b+c;
 
int waved_b = b - (b*WaVe)/100;
int waved_c = c - (c*WaVe)/100;

int total_waved = a+waved_b+waved_c;

           %>
           
<center>
           <table>
               
               <center>  <h3> Your actual semester cost is: </h3>  </center> <br/>
               
               <tr>
                   
                   <th align="center"> Reg. </th>
                   <th align="center"> Mid </th>
                   <th align="center"> Final </th>
                   <th align="center"> Total </th>
                   
               </tr>
               
               <tr>
                   
                   <td align="center"> <%=reg%> </td>
                   <td align="center"> <%=mid%> </td>
                   <td align="center"> <%=fin%> </td>
                   <td align="center"> <%=total%> </td>
                   
               </tr>
               
           </table>
</center>

<br/>

<center>
           <table>
           
               <center>  <h3> Your payable semester cost is: </h3>  </center> <br/>

               <tr>
                   
                   <th align="center"> Reg. </th>
                   <th align="center"> Mid </th>
                   <th align="center"> Final </th>
                   <th align="center"> Total </th>
                   
               </tr>
               
               <tr>
                   
                   <td align="center"> <%=reg%> </td>
                   <td align="center"> <%=waved_b%> </td>
                   <td align="center"> <%=waved_c%> </td>
                   <td align="center"> <%=total_waved%> </td>
                   
               </tr>
               
           </table>
</center>               
           <%}
           else{
               out.println("<script>");
               out.println("alert('Sorry, Something went Wrong!!');");
               out.println("location='next.jsp';");
               out.println("</script>");
           }
       
       }catch(Exception it){
           out.println("");
       } %>

       <br/><br/><br/>
<center> 
        <input type="submit" name="action" OnClick="location.href='loggedOut.jsp';" value="Logout" />
        &nbsp;&nbsp;
        <input type="submit" name="action" OnClick="location.href='next.jsp';" value="Back" /> 
</center>
             
        <div class="footr">

                <p>&copy; byteRhythms tech. (2020)</p>

    	</div>  
       
       
            <script language="JavaScript">
    	

		document.onkeydown = function(e) {
			if(event.keyCode == 123) {
				return false;
			}
			if(e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)){
				return false;
			}
			if(e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)){
				return false;
			}
			if(e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)){
				return false;
			}
		}


            </script>
       
       
    </body>
</html>
