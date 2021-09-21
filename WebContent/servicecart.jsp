<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	font-family:sans-serif;
}
html,body{
	width: 100%;
    height: 100%;
    margin: 0;
}
body{
    overflow: auto;
    padding-top: 70px;
    box-sizing: border-box;
    background-color:#f1f3f6;
}
.selected{
	background-color:blue;
	color:white;
}
.pmodule{
	border:1px solid gray;border-radius:0.3em;padding:10px;min-width: 14%;text-align: center;cursor:pointer
}
.displaypanel{
	position: fixed;top: 130px;right: 20px;background-color:white;padding:10px;border-radius:0.2em;border:1px solid gray
}
button{
	background-color:blue;font-size:16px;margin-left:3px;margin-right:3px;color: white;background: transparent;border: 0;background-color: blue;padding: 10px;padding-left: 15px;padding-right: 15px;border-radius: 0.3em;width:100%
}
.pdata{
	display:flex;justify-content:space-between;align-items:center
}
</style>
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<meta charset="ISO-8859-1">
<title>Pet Peaker</title>
</head>
<body onload="setcharge(0)">
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
	    	<li><a href="/shop">Shop</a></li>	    		    	
			<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1")) { %>         	    
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
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
	    	<li><a href="/account">Account</a></li>	    	
	    	<li><a href="/mycart">My Cart</a></li>	    		    			
	    	<li><a href="/logout">Logout</a></li>	    		    				    	
		<% }else{ %>	    	
	    	<li><a href="/login">Login</a></li>	    		    				    			
		<% } %>
	    </ul>
	</div>
</nav>
<div style="margin:25px 35px;width:60%">
	<div style="overflow:auto">
		<h3>You are almost done! Complete your order</h3>	
	</div>
	<div style="background-color:white;padding:10px;width:100%;box-sizing:border-box;padding:20px 10px;border:1px solid gray;border-radius:0.2em">
		<div style="overflow:auto">
			<p style="font-size:25px;margin:0"><%=request.getAttribute("plan") %></p>
			<p>Select your duration</p>
		</div>
		<div style="display:flex;justify-content:space-evenly">
		<% int price=Integer.valueOf((String)request.getAttribute("price"));int deleivery=20; %>
			<div onclick="setcharge(0)" class="pmodule" >
				<p style="margin:4px 0px 15px 0px">1 month</p>
				<p style="font-size:20px;margin:0"> &#8377 <%=price %><br><small style="font-size:15px">/month</small></p>				
			</div>		
		<%for(int i=1;i<4;i++){ %>
			<div onclick="setcharge(<%=i%>)" class="pmodule">
				<p style="margin:4px 0px 15px 0px"><%=i*12 %> month</p>
				<p style="font-size:20px;margin:0"> &#8377 <%=price*(i*12) %><br><small style="font-size:15px">/month</small></p>				
			</div>
		<% } %>
		</div>
	</div>
</div>
	<div style="width:30%" class="displaypanel">
		<div class="panelhead" style="border-bottom:1px solid #c1c1c1">
			<h2 style="margin:5px 0px">Price details</h2>
		</div>					
		<div style="padding:10px 20px">
			<div class="pdata" >
				<p style="font-size:18px">Price</p>
				<p style="font-size:15px"></p>				
			</div>	
			<div class="pdata" >
				<p style="font-size:18px">GST</p>
				<p style="font-size:15px"></p>				
			</div>	
			<div class="pdata" >
				<p style="font-size:18px">Delivery charges</p>
				<p style="font-size:15px"></p>				
			</div>	
			<div  class="pdata"  style="border-top:1px dotted #a5a5a5">
				<p style="font-size:18px">Total Amount</p>
				<p style="font-size:15px"></p>				
			</div>				
		<div style="margin:10px auto"><button>Proceed</button></div>								
		</div>
	</div>
	<script>
		let ccharge=<%=price%>;
		let deleivery=<%=deleivery %>
		function setcharge(e){
			let ps=document.getElementsByClassName("pmodule")
			for(let i=0;i<ps.length;i++){
				ps[i].className="pmodule"				
				document.getElementsByClassName("pdata")[i].children[1].innerHTML="&#8377"				
			}
			ps[e].className="pmodule selected"							
			if(e>0){
				document.getElementsByClassName("pdata")[0].children[1].innerText=(ccharge*e*12)+" "+document.getElementsByClassName("pdata")[0].children[1].innerText			
				document.getElementsByClassName("pdata")[1].children[1].innerText=(ccharge*e*12)*0.1+" "+document.getElementsByClassName("pdata")[1].children[1].innerText			
				document.getElementsByClassName("pdata")[2].children[1].innerText=deleivery+" "+document.getElementsByClassName("pdata")[2].children[1].innerText			
				document.getElementsByClassName("pdata")[3].children[1].innerText=deleivery+(ccharge*e*12)+((ccharge*e*12)*0.1)+" "+document.getElementsByClassName("pdata")[3].children[1].innerText										
			}else if(e==0){
				document.getElementsByClassName("pdata")[0].children[1].innerText=(ccharge)+" "+document.getElementsByClassName("pdata")[0].children[1].innerText			
				document.getElementsByClassName("pdata")[1].children[1].innerText=(ccharge)*0.1+" "+document.getElementsByClassName("pdata")[1].children[1].innerText			
				document.getElementsByClassName("pdata")[2].children[1].innerText=deleivery+" "+document.getElementsByClassName("pdata")[2].children[1].innerText			
				document.getElementsByClassName("pdata")[3].children[1].innerText=deleivery+(ccharge)+(ccharge*0.1)+" "+document.getElementsByClassName("pdata")[3].children[1].innerText														
			}
		}
	</script>
</body>
</html>