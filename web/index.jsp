<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : feeBase: Login
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="javax.swing.JOptionPane" %>
<html oncontextmenu="return false">
    <head>
        
        <title> feeBase: Semester fee Manager </title>
        
        <link rel="stylesheet" href="CSS/styleSheet.css" />
        <link rel="icon" href="imgs/logo.png" sizes="50x50" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Welcome to feeBase</title>
    </head>

    <body>
    
        <center>
            <p class="link_rel"> <a class="link_rel_lnk" href="www.byterhythms.com" target="_blank" > Move me to <b><i>byteRhythms</i></b> home </a> </p>
        </center>
      
    <div class="login_pan">     

		<form name="LogPan" method="post" action="NextPages/AcChk.jsp">

			<fieldset>

				<legend style="color:red"> Log in </legend>
                                
				<label style="color:gray"> Student ID: </label> <br>
				<input type="text" name="Student_ID" placeholder="Student ID" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> <br>


				<label style="color:gray"> Password: </label> <br>
				<input type="password" name="PassWd" placeholder="password" /> <br>


				<br/>

				<center> 
                                    <input type="submit" name="action" OnClick="return valid();" value="Log in" />
                                    &nbsp;
                                    <input type="submit" name="action" value="Create" /> 
                                </center>
                                
                     
			</fieldset>

		</form>

    </div>   
        
        <center> <p class="Query"> <a href="NextPages/Public_Query.jsp" style="text-decoration:none" target="_blank"> View course fees </a> </p> </center> 
        
        <br/>
        <div class="footr">

                <p>&copy; byteRhythms tech. (2020)</p>

    	</div>    
          
     
        <script type="text/javascript">
        
             function valid(){
                 
                 var uname=document.LogPan.Student_ID.value;
                 if(uname===""){
                     alert("Please Enter an ID!!");
                     document.LogPan.Student_ID.focus();
                     return false;
                 }
                 if((uname.length<4) ||(uname.length>6)){
                     alert("Invalid ID format!!!");
                     document.LogPan.Student_ID.focus();
                     return false;
                 }
                 
                 var upass=document.LogPan.PassWd.value;
                 if(upass===""){
                     alert("Please Enter Password!!");
                     document.LogPan.PassWd.focus();
                     return false;
                 }
                 if((upass.length<5) ||(upass.length>10)){
                     alert("Invalid password format!!!");
                     document.LogPan.PassWd.focus();
                     return false;
                 }
             }
    
        </script>
        
        
        
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
