<%-- 
    Document   : feeBase: all cost
    Created on : Jan 4, 2020, 3:30:23 AM
    Author     : TK47bd 
    Design     : TKBD & LeoMon101
--%>




<html oncontextmenu="return false">

    <head>
    
        <title> Welcome... </title>
        
        <link rel="stylesheet" href="../CSS/nextPage.css" />
        <link rel="stylesheet" href="https://fonts.google.com/specimen/Cute+Font" />
        <link rel="stylesheet" href="https://fonts.google.com/specimen/Oswald" />
        <link rel="icon" href="../imgs/logo.png" sizes="50x50" />

    </head>

           

 <body>

     
    <header>
		<div class="full_wrap_h">
			<div class="wrap head">
				<h2>feeBase</h2>
			</div>
		</div>
	</header>
	<content>
	        <div class="wrap">
			<img src="../imgs/blueLogo.png" alt="" class="wrap ic">
	        </div>
            
                <% String StrID = (String)session.getAttribute("ID"); %>
            
		<div class="wrap form_con">
			<form>
				<fieldset>
					<legend class="admin_pic">Hi, 
                                                        <%=StrID%> 
                                         </legend><br><br>
                                        
                                        
		        	<h6>Choose the options from below:</h6><br>
		<center>	<a href="AllCost.jsp"><h4 class="opt">Full Course Cost</h4></a><br> </center>
					<h6>Or</h6><br/>
		<center>	<a href="CheckAndCount.jsp"><h4 class="opt">Specific Cost</h4></a><br>  </center>
				</fieldset>
			</form>
			<aside>
				<div class="wrap aside">
					<h3>More Options:</h3><br>
					<ul>
						<li><a href="#" target="_blank" > <p> About us </p> </a></li>
						<li><a href="www.byterhythms.com" target="_blank" > <p> byteRhythms </p> </a></li>
                                                <li><a href="Check_init.jsp"><p> Check Initial </p> </a></li>
						<li><a href="loggedOut.jsp"><p> Log Out </p> </a></li>
					</ul>
				</div>
			</aside>
		</div>
	</content>
<center>
		<div class="full_wrap_f">
			<div class="wrap foot">
				<footer>
					<p>&copy; All Right Reserved By byteRhythms</p>
				</footer>
			</div>
		</div>
    
</center>      
 
 
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