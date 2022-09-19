<%-- 
    Document   : feeBase: all cost
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd and Design: LeoMon101
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feeBase by byteRhythms tech.</title>
        
        <link rel="icon" href="../imgs/logo.png" sizes="50x50" />
        <link rel="stylesheet" href="https://fonts.google.com/specimen/Cute+Font" />
        <link rel="stylesheet" href="https://fonts.google.com/specimen/Oswald" />
        <link rel="stylesheet" href="../CSS/Create.css" />
        
    </head>
    
    <body class="body">
        
        <br/><br/><br/>
        <center> <h2 class="h2class">Welcome new user, </h2> </center>
        
        <%@ page import="java.sql.*" %>
       
        <center>
        <form name="CreateData" method="post" action="CreateAcc.jsp" class="full_form" >
            
            <label>Name : </label>
            <input id="Name" placeholder="UserName" type="text" name="Name" value="" size="12" /> <br/>
            <label>ID : </label>
            <input id="ID" type="text" placeholder="ID initial" name="ID" value="" size="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  /> <br/>
            <label>Department : </label>
            <select name="Dept" id="Dept">
                
                <option>BBA</option>
                <option>CE</option>
                <option>CIS</option>
                <option>CSE</option>
                <option>EEE</option>
                <option>ETE</option>               
                <option>SWE</option>
                <option>TE</option>
     
            </select> <br/>
            <label>Batch : </label>
            <select name="Batch" id="Batch">
                
                <option>201</option>
                <option>193</option>
                <option>192</option>
                <option>191</option>
                <option>183</option>
                <option>182</option>
                <option>181</option>
                <option>173</option>
                <option>172</option>
                <option>171</option>
                
            </select> <br/>
            <label>Password : </label>
            <input type="password" placeholder="Password" name="PassWord" value="" size="12" /> <br/>
            <label>Email : </label>
            <input type="email" placeholder="Email" name="Email" value="" size="12" /> <br/>
            <h4>Click on "Create" if all the information are correct.</h4> <br/>
            <input type="submit" onclick="return valid();" value="Create" name="action" class="cr_button" />
            <input type="submit" onclick="location='../index.htm';" value="Back" class="back_button" />
            
        </form>
        </center>    
       
        <% int checkIfOk; %>
        
        <% 
          
         try{
           
            String IDStr;
            String Check;
            String Check2;
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feeBaseDB","root","");
           String SQL = "insert into userinf(Name,ID,Dept,Batch,Pass,Mail) values (?,?,?,?,?,?)";
           PreparedStatement st = con.prepareStatement(SQL);

            st.setString(1,request.getParameter("Name").toString());
            IDStr = request.getParameter("ID").toString();
            st.setString(2, IDStr);
            Check = request.getParameter("Dept").toString();
            st.setString(3, Check);
            Check2 = request.getParameter("Batch").toString();
            st.setString(4, Check2);
            st.setString(5,request.getParameter("PassWord").toString());
            st.setString(6,request.getParameter("Email").toString());
            st.execute();
            
            checkIfOk = 0;
            
         }catch(Exception E){
            checkIfOk = 1; 
         }
         
         try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_feebase","root","");
           
           String IDStr = request.getParameter("ID");
           String StrSQL = String.format("CREATE TABLE $%s (Sem_no int(2) NOT NULL, Reg int(6) NOT NULL, Mid int(6) NOT NULL, Final int(6) NOT NULL, Total int(8) NOT NULL, PRIMARY KEY (Sem_no))",IDStr);
           PreparedStatement s = con.prepareStatement(StrSQL);
           s.executeUpdate();

           checkIfOk = 0;
          
         }catch(Exception E){
           checkIfOk = 1;
         }
         
         try{
           String IDStr = request.getParameter("ID").toString();
           String Dept = request.getParameter("Dept").toString();
           String Batch = request.getParameter("Batch").toString();
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_feebase","root","");  
             
           String SQL2 = String.format("INSERT INTO $%s",IDStr)+ String.format(" SELECT * from semfees.$%s_%s",Dept,Batch);
           PreparedStatement s = con.prepareStatement(SQL2);
           s.executeUpdate();

           checkIfOk = 0;

         }catch(Exception E){
           checkIfOk = 1;
         } 

        %>    
        
        
        
        <script type="text/javascript">
        
             function valid(){
                 
                 var uname=document.CreateData.Name.value;
                 if(uname===""){
                     alert("Please Enter a name!!");
                     document.CreateData.Name.focus();
                     return false;
                 }
                 if((uname.length<5) ||(uname.length>12)){
                     alert("Invalid Name format!!!");
                     document.CreateData.Name.focus();
                     return false;
                 }
                 
                 
                 var uid=document.CreateData.ID.value;
                 if(uid===""){
                     alert("Please Enter an ID!!");
                     document.CreateData.ID.focus();
                     return false;
                 }
                 if((uid.length<4) ||(uid.length>6)){
                     alert("Invalid ID format!!!");
                     document.CreateData.ID.focus();
                     return false;
                 }
                 
                 
                 var upass=document.CreateData.PassWord.value;
                 if(upass===""){
                     alert("Please Enter Password!!");
                     document.CreateData.PassWord.focus();
                     return false;
                 }
                 if((upass.length<5) ||(upass.length>10)){
                     alert("Invalid password format!!!");
                     document.CreateData.PassWord.focus();
                     return false;
                 }
                 
                 
                 var umail=document.CreateData.Email.value;
                 if(umail===""){
                     alert("Please Enter Email!!");
                     document.CreateData.Email.focus();
                     return false;
                 }
                 if((umail.length<7) ||(umail.length>25)){
                     alert("Invalid Email format!!!");
                     document.CreateData.Email.focus();
                     return false;
                 }
             }
    
        </script>
        
        
       <%  if(checkIfOk == 0){%> <script>alert("Success!!"); location="../index.htm";</script> <%}
        else{%> <script>alert("Error...!!!");</script> <%} %> 
        
        
        
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
        
            
        <div class="footr">

                <p>&copy; byteRhythms tech. (2020)</p>

    	</div>          
            
            
        
    </body>
</html>
