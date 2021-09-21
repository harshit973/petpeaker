<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<meta charset="ISO-8859-1">
<title>Pet Keeper</title>
<style type="text/css">
	.displaypanel{
		width: 65%;
	    background-color: white;
	    margin-left: 2.5%;
	    margin-right: 2.5%;
	    box-shadow: 0 1px 5px 1px #d0d0d0;
	    position: relative;
	    padding: 15px 0px;
	}
	*{
		font-family:sans-serif;		
	}
	html,body{
		height:100%
	}
	body{
		padding-top:70px;
		box-sizing:border-box;
		position:relative;
		background-color:#f1f3f6;
	}
	.purchase{
		background-color:blue;font-size:16px;margin-left:3px;margin-right:3px;color: white;background: transparent;border: 0;background-color: blue;padding: 10px;padding-left: 15px;padding-right: 15px;border-radius: 0.3em;width:100%
	}		
	.panelhead{
		font-size:13px;overflow:auto;display:flex;align-items:center;margin:0px 20px
	}	
</style>
</head>
<body style="margin:0">
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
<% DecimalFormat df=new DecimalFormat("#"); 
	df.setMaximumFractionDigits(2);
%>
<% if(request.getAttribute("cart")!=null){ %>
<div style="height:100%;display:flex;padding:10px;box-sizing:border-box;align-items:baseline">
<div style="height:100%;box-sizing:border-box" class="displaypanel">
		<div class="panelhead">
			<h2 style="margin:5px 0px">My Cart</h2>
		</div>				
		<div style="overflow:auto;height:90%">
			<% 	double sum=0;double gst=0;double delivery=10;
			if(request.getAttribute("cart")!=null){ %>
			<% ArrayList<HashMap<String,String>> cartdata=(ArrayList<HashMap<String,String>>)request.getAttribute("cart"); 
				for(int i=0;i<cartdata.size();i++){
					sum+=Double.parseDouble(String.valueOf(cartdata.get(i).get("price")));
					gst=0.1d*sum;
			%>
			<div style="padding :20px 10px;border-bottom:1px solid #c1c1c1">			
				<div style="display:flex;margin:15px 0px">
					<div style="width:20%;">
						<img style="width:100%" src="<%=cartdata.get(i).get("thumbnail") %>" />					
						<div style="display:flex;justify-content:space-evenly">
							<button style="outline:none;border: 1px solid gray;border-radius: 50%;font-size: 19px;width: 26px;font-weight: 100;" onclick="event.target.parentElement.children[1].value=parseInt(event.target.parentElement.children[1].value)+1">+</button>	
		    				<input  style="text-align:center;border: 1px solid;outline:none;width: 50px;border-radius: 0.2em;padding: 5px;" type="number" value="1" />											
							<button style="outline:none;border: 1px solid gray;border-radius: 50%;font-size: 19px;width: 26px;font-weight: 100;" onclick="if(parseInt(event.target.parentElement.children[1].value)>1){event.target.parentElement.children[1].value=parseInt(event.target.parentElement.children[1].value)-1}">-</button>			    				
	    				</div>
					</div>					
					<div style="padding:0px 20px;position:relative;width: 75%;display: flex;flex-direction: column;">
						<p style="text-transform:capitalize;margin: 5px 0px;font-size:18px;line-height: 30px;"><%=cartdata.get(i).get("name") %></p>
						<% if(cartdata.get(i).containsKey("color")){ %>						
						<p style="margin:15px 0px;font-size:14px;">Color: <%=cartdata.get(i).get("color") %></p>
						<% } %>						
						<% if(cartdata.get(i).containsKey("flavor")){ %>						
						<p style="margin:15px 0px;font-size:14px">Flavor: <%=cartdata.get(i).get("flavor") %></p>
						<% } %>						
						<% if(cartdata.get(i).containsKey("size")){ %>						
						<p style="margin:15px 0px;font-size:14px">Size: <%=cartdata.get(i).get("size") %></p>
						<% } %>						
						<p style="margin:15px 0px;font-size:14px;color:green"><%=cartdata.get(i).get("price") %> &#8377</p>					
						<a href="/removecart?pid=<%=cartdata.get(i).get("id") %>"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="48" height="48" viewBox="0 0 50 50" style="fill:#000000;position: absolute;top: 0;right: 5px;width: 24px;"><path d="M 21 0 C 19.355469 0 18 1.355469 18 3 L 18 5 L 10.1875 5 C 10.0625 4.976563 9.9375 4.976563 9.8125 5 L 8 5 C 7.96875 5 7.9375 5 7.90625 5 C 7.355469 5.027344 6.925781 5.496094 6.953125 6.046875 C 6.980469 6.597656 7.449219 7.027344 8 7 L 9.09375 7 L 12.6875 47.5 C 12.8125 48.898438 14.003906 50 15.40625 50 L 34.59375 50 C 35.996094 50 37.1875 48.898438 37.3125 47.5 L 40.90625 7 L 42 7 C 42.359375 7.003906 42.695313 6.816406 42.878906 6.503906 C 43.058594 6.191406 43.058594 5.808594 42.878906 5.496094 C 42.695313 5.183594 42.359375 4.996094 42 5 L 32 5 L 32 3 C 32 1.355469 30.644531 0 29 0 Z M 21 2 L 29 2 C 29.5625 2 30 2.4375 30 3 L 30 5 L 20 5 L 20 3 C 20 2.4375 20.4375 2 21 2 Z M 11.09375 7 L 38.90625 7 L 35.3125 47.34375 C 35.28125 47.691406 34.910156 48 34.59375 48 L 15.40625 48 C 15.089844 48 14.71875 47.691406 14.6875 47.34375 Z M 18.90625 9.96875 C 18.863281 9.976563 18.820313 9.988281 18.78125 10 C 18.316406 10.105469 17.988281 10.523438 18 11 L 18 44 C 17.996094 44.359375 18.183594 44.695313 18.496094 44.878906 C 18.808594 45.058594 19.191406 45.058594 19.503906 44.878906 C 19.816406 44.695313 20.003906 44.359375 20 44 L 20 11 C 20.011719 10.710938 19.894531 10.433594 19.6875 10.238281 C 19.476563 10.039063 19.191406 9.941406 18.90625 9.96875 Z M 24.90625 9.96875 C 24.863281 9.976563 24.820313 9.988281 24.78125 10 C 24.316406 10.105469 23.988281 10.523438 24 11 L 24 44 C 23.996094 44.359375 24.183594 44.695313 24.496094 44.878906 C 24.808594 45.058594 25.191406 45.058594 25.503906 44.878906 C 25.816406 44.695313 26.003906 44.359375 26 44 L 26 11 C 26.011719 10.710938 25.894531 10.433594 25.6875 10.238281 C 25.476563 10.039063 25.191406 9.941406 24.90625 9.96875 Z M 30.90625 9.96875 C 30.863281 9.976563 30.820313 9.988281 30.78125 10 C 30.316406 10.105469 29.988281 10.523438 30 11 L 30 44 C 29.996094 44.359375 30.183594 44.695313 30.496094 44.878906 C 30.808594 45.058594 31.191406 45.058594 31.503906 44.878906 C 31.816406 44.695313 32.003906 44.359375 32 44 L 32 11 C 32.011719 10.710938 31.894531 10.433594 31.6875 10.238281 C 31.476563 10.039063 31.191406 9.941406 30.90625 9.96875 Z"></path></svg></a>												
					</div>
				</div>
				</div>
			<% } %>
		</div>		
		<div style="position: absolute;bottom: 0;text-align:right;left: 0;right: 0;box-shadow:0 -2px 10px 0 rgb(0 0 0 / 10%);background-color:white;">
			<button class="purchase">Place Order</button>
		</div>				
	</div>
</div>
	<div style="width:30%;position: fixed;top: 8%;right: 1%;margin: 0;" class="displaypanel">
		<div class="panelhead" style="border-bottom:1px solid #c1c1c1">
			<h2 style="margin:5px 0px">Price details</h2>
		</div>					
		<div style="padding:10px 20px">
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">Price</p>
				<p style="font-size:15px"><%=df.format(sum) %> 	&#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">GST</p>
				<p style="font-size:15px"><%=df.format(gst) %> 	&#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">Delivery charges</p>
				<p style="font-size:15px"><%=df.format(delivery) %> &#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center;border-top:1px dotted #a5a5a5">
				<p style="font-size:18px">Total Amount</p>
				<p style="font-size:15px"><%=df.format(sum+delivery+gst) %>  &#8377</p>				
			</div>				
		</div>
	</div>
<% } %>
<%  }else{  %>
<div style="height:100%;width: 100%;margin: 0px;background-color: white;display: flex;justify-content: center;align-items: center;">
	<div style="text-align:center">
		<img src="data:image/png;base64,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"/>	
		<h2>Your cart is empty</h2>
		<a style="text-decoration:none;color:blue" href="/shop">Return to shopping</a>
	</div>
</div>

<% } %>
<script src="javascript/navbar.js"></script>
</body>
</html>