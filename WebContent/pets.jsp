<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/splashscreen.css" />
<style type="text/css">
*{
	font-family: sans-serif;
}
body{
	margin:0;
	overflow:auto;
	box-sizing:border-box;
	padding-top:60px;
}
.pcard{
	border:1px solid gray;border-radius:0.2em;width:18%;color:white
}
.pcard:hover{
	transform:scale(1.1)
}
html,body{
	width: 100%;
	height: 100%;
}
li{border-bottom: 1px solid #c1c1c1;padding: 5px;}
li:last-child{border-bottom:0!important}
</style>
<title>Pet Peaker</title>
</head>
<body>
<% HashMap h3=(HashMap)request.getSession().getAttribute("services"); %>
<nav>
	<div class="wrapper">
	    <div style="width:15%" class="brand">
	        <h1>Pet Peaker</h1>
	    </div>
	    <ul style="padding:0;display:flex;justify-content:flex-end" class="nav-links">
	    	<li><a href="/">Home</a></li>	    		    
	    	<li>
	    		<a href="#">Services</a>
			    <% if(!h3.isEmpty()){  %>	    		
		    		<ul class="drop-menu">
		    		<div style="background-color: white;box-shadow:0 4px 5px 0 #d4d4d4;padding:0px 10px;">
						<% for(int i=0;i<h3.size();i++){ %>                		    		
			    			<li><a href="/pricing?sid=<%=h3.keySet().toArray()[i] %>"><%= ((String[])h3.get(h3.keySet().toArray()[i]))[0] %></a></li>
			    		<% } %>
		    		</div>		    		
		    		</ul>		    		
		    	<% } %>
	    	</li>
	    	<li><a href="/services">Plans/Offers</a></li>	    	
	    	<li><a href="/shop">Shop</a></li>	    		    	
			<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("0")) { %>         	    
		    	<li><a href="/joinus">Join us</a></li>	    		    				
			<% } %>
	    	<li>
	    		<a href="#">Own a pet</a>
	    		<div class="mega-box">
	    			<div class="mcontent">
	    				<div class="row" style="display: flex;align-items: center;">
	    					<img style="width:250px" src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/dog2.jpg?alt=media&token=81341c42-6b72-4962-afa9-822162809182" />
	    				</div>	    					    					    			
	    				<div class="row">
	    					<header>Breeds</header>
	    					<ul class="mega-links">
	    					</ul>	    					
	    				</div>
	    				<div class="row">
	    					<header>Pets</header>
	    					<ul class="mega-links">
	    					</ul>
	    				</div>	    				
	    			</div>
	    		</div>
	    	</li>
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ){ %>        
	    	<li><a href="/account">Account</a></li>	    	
	    	<li><a href="/mycart">My Cart</a></li>	    		    			
	    	<li><a href="/logout">Logout</a></li>	    		    				    	
		<% }else{ %>	    	
	    	<li><a href="/login">Login</a></li>	    		    				    			
		<% } %>
	    </ul>
	</div>
</nav>
<div style="height:75%;position:relative;top:0;color:white;display:flex;justify-content:center;align-items:center">
	<img style="z-index:-1;width:100%;height: 100%;object-fit:cover;object-position: center;position:absolute;top:0;bottom:0;left:0;right:0;filter: brightness(0.8);" src="https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/planthumb.jpg?alt=media&token=d3b00c82-9700-4f54-a6b2-881ad2dc759b" />
	<h1 style="font-size: 50px;font-weight: 100;">Select a pet</h1>
</div>
<div style="display:flex;justify-content:space-between;padding:0px 20px">
	<div>
		<img src="" />
	</div>
</div>
<script type="text/javascript" src="javascript/navbar.js"></script>
</body>
</html>