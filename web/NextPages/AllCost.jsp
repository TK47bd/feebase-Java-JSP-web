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
        
        <link rel="stylesheet" href="../CSS/AllFee.css" />
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
        
<br/><br/><br/><br/><br/>          
 

<div class="form_container" align="center">        
        
   
<table class="table">
<caption> Semester Wise Fees:</caption>
<thead>
<tr>
        <th align="center">No.</th>
        <th align="center">Reg.</th>
        <th align="center">Mid</th>
        <th align="center">Final</th>
        <th align="center">Total</th>
</tr>
</thead>

<%
try
{
 
    int total_cost = 0;
    int sem_tot    = 0;
    int reg_tot    = 0;
    int mid_tot    = 0;
    int fin_tot    = 0;
    int total_tot  = 0;
     
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/user_feebase";
String username="root";
String password="";
String StrID = (String)session.getAttribute("ID");
String query=String.format("select * from $%s",StrID);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
int s = Integer.parseInt(rs.getString("Sem_no"));    
int a = Integer.parseInt(rs.getString("Reg"));
int b = Integer.parseInt(rs.getString("Mid"));
int c = Integer.parseInt(rs.getString("Final"));

sem_tot = s;
reg_tot = reg_tot + a;
mid_tot = mid_tot + b;
fin_tot = fin_tot + c;

total_cost = a + b + c;

total_tot = total_tot + total_cost;

%>
    <tr>
        <td align="center"><%=rs.getString("Sem_no")%></td>
        <td align="center"><%=rs.getString("Reg") %></td>
        <td align="center"><%=rs.getString("Mid") %></td>
        <td align="center"><%=rs.getString("Final") %></td>
        <td align="center"> <%= total_cost %> </td>
    </tr>
        <%

}
%>

    <tr class="tfoot_td">
        <th align="center">Total:</th>
        <th align="center">Total:</th>
        <th align="center">Total:</th>
        <th align="center">Total:</th>
        <th align="center">Total:</th>
    </tr>

    <tr class="tfoot_td">
        <th align="center"><%= sem_tot %></th>
        <th align="center"><%= reg_tot %></th>
        <th align="center"><%= mid_tot %></th>
        <th align="center"><%= fin_tot %></th>
        <th align="center"><%= total_tot %></th>
    </tr>

    </table>
    
    
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e){
    e.printStackTrace();
    }

%>


    
</div>  

<br/>
<center> 
        <input type="submit" name="action" OnClick="location.href='loggedOut.jsp';" value="Logout" />
        &nbsp;&nbsp;
        <input type="submit" name="action" OnClick="location.href='next.jsp';" value="Back" /> 
</center>
        
        <br/>
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
