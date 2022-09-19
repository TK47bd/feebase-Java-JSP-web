<%-- 
    Document   : feeBase: all cost
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Initials</title>
        
        <link rel="stylesheet" href="../CSS/CI.css" />
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
    
    <center>
        
    <div class="cost_adder"> <br/><br/>    
    <form name="checkInitial" action="Check_init.jsp" method="POST"> 
    
        <center> <label style="color:black"> <b><i>Enter Initial</i>:</b> </label> </center> <br/>
        
        <center> <input style="font-family:bold;text-align:center" type="text" id="init_inp" name="init_inp" size="12" placeholder="Enter Initial" /> </center><br/>
        
        <center> <input type="submit" onclick="return valid();" value="Find"/> </center> <br/> <br/> 
    
    </form>
    </div>
        
    </center>
    
    <script type="text/javascript">
        
             function valid(){
                 
                 var uname=document.checkInitial.init_inp.value;
                 if(uname===""){
                     alert("Please Enter an Initial!!");
                     document.checkInitial.init_inp.focus();
                     return false;
                 }
                 if((uname.length<1) ||(uname.length>4)){
                     alert("Invalid format!!!");
                     document.checkInitial.init_inp.focus();
                     return false;
                 }
             }
    </script>
    
    
    <% try{
           String Init = request.getParameter("init_inp").toString();
           try {  
               Double.parseDouble(Init);  
               out.println("<script>");
               out.println("alert('Wrong Initial!!');");
               out.println("location='Check_init.jsp';");
               out.println("</script>");
            } catch(NumberFormatException e){  
              
           }
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teachers","root","");
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select * from teach_init where Initial='"+Init+"'");
           
           if(rs.next()){ %>

           
<center>   
<table class="table" border="1">
<caption> Teacher Info:</caption>
<thead>
<tr>
        <th align="center">Initial</th>
        <th align="center">Name</th>
        <th align="center">Link</th>
</tr>
</thead>

<tr>
        <td align="center"><%=rs.getString("Initial")%></td>
        <td align="center"><%=rs.getString("Name")%></td>
        <td align="center"> <a style="text-decoration:none" href="<%=rs.getString("Link")%>" target="_blank" > <%=rs.getString("Link")%> </a> </td>
</tr>

</table>
</center> 
              
           
          <% }
           else{
               out.println("<script>");
               out.println("alert('Initial not found!!');");
               out.println("location='Check_init.jsp';");
               out.println("</script>");
           }
       
       }catch(Exception it){
           out.println("");
       } %>
        
      
<br/><br/>
<center> 
        <input type="submit" name="action" OnClick="location.href='loggedOut.jsp';" value="Logout" />
        &nbsp;&nbsp;
        <input type="submit" name="action" OnClick="location.href='next.jsp';" value="Back" /> 
</center>
        
        <br/><br/>
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
