<%@ page language="java" import="java.util.*,java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/navbar-mobile.css">
<link rel="stylesheet" href="css/splashscreen.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<meta charset="ISO-8859-1">
<title>Pet Keeper</title>
<style type="text/css">
	.displaypanel{
	    background-color: white;
	    position: relative;
	    box-sizing: border-box;	
	    overflow:hidden;
	}
	.back{
	    width: 100%;
	    height: 100%;
	    background-color: #00000069;
	    position: fixed;
	    bottom: 0;
	    z-index: 2;
	    display:none;
	}
	.toaster{
		position:absolute;
		bottom:0;
		width:100%;
		z-index:2;
		overflow-y:hidden;
	    transition: .5s ease-in-out;		
		height:0;
	}
	*{
		font-family:sans-serif;		
	}
	html,body{
	    height: 100%;
	    overflow: auto;
    }    
	body{
		padding-top:60px;
		padding-bottom:35px;		
		box-sizing:border-box;
		position:relative;
		background-color:#f1f3f6;
	}
	.purchase{
		background-color:blue;font-size:16px;color: white;background: transparent;border: 0;background-color: blue;padding: 10px;padding-left: 15px;padding-right: 15px;width:100%
	}		
	.panelhead{
		font-size:13px;overflow:auto;display:flex;align-items:center;margin:10px 20px;justify-content:space-between
	}	
</style>
</head>
<body style="margin:0">
<nav>
    <div class="brand">
        <h1>Pet Peaker</h1>
    </div>
    <div onclick="opennavbar()" class="navbar-mobile">
        <div></div>
        <div></div>
        <div></div>
    </div>
</nav>   
<div class="sidenavbar-container" style="display: none;" onclick="closure(event)" >
</div>
<div class="sidenavbar" style="width: 0%;">
    <div class="sidenavbar-header">
        <img src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/avatar.png?alt=media&token=041bbb3f-5047-4b88-a2bd-a656348b2117" style="width: 70px;border-radius: 50%;" alt="">
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
        <div style="line-height:15px">
	        <a><%= ((HashMap)request.getSession().getAttribute("userdata")).get("firstname")%> <%= ((HashMap)request.getSession().getAttribute("userdata")).get("lastname")%></a>
	        <a style="font-size:14px"><%= ((HashMap)request.getSession().getAttribute("userdata")).get("email")%></a>        
		</div>        
        <% }else{ %>
        <a href="/login">Login or Register</a>
        <%} %>        
    </div>
    <div class="sidenavbar-body" style="margin: 15px;">
    	<a href="/">Home</a>
        <a onclick="serviceopen()">Services</a>
        <a href="/shop">Shop</a>
        <a href="/ownapet">Own a pet</a>        
		<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1")) { %>         
        <a href="/joinus">Join us</a>
        <% } %>                
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
        <a href="/mycart" >My Cart</a>               	
        <a href="/account">Account</a>		
        <a href="/logout">Logout</a>        
        <% } %>
    </div>
</div>
	<% HashMap h=(HashMap)request.getSession().getAttribute("services");
	HashMap h2=(HashMap)request.getSession().getAttribute("services");
       if(h2!=null && !h2.isEmpty()){ %>    
    <div class="services">
        <div style="margin:15px">
        <h2 style="border-bottom:1px solid #00000066">Services</h2>
        <div class="services-body">        
	<% 	for(int i=0;i<h2.size();i++){ %>
            <a href="/pricing?sid=<%= h2.keySet().toArray()[i] %>"><%= ((String[])h2.get(h.keySet().toArray()[i]))[0] %></a>
        <% } %>
        </div>
    </div>    
</div>
<% } %>
<% DecimalFormat df=new DecimalFormat("#"); 
	df.setMaximumFractionDigits(2);
%>
<% if(request.getAttribute("cart")!=null){ %>
<div style="box-sizing: border-box;align-items:baseline;">
<div class="displaypanel">
		<div class="panelhead">
			<h2 style="margin:5px 0px">My Cart</h2>
			<a onclick="opentoast()" style="text-decoration:none;color:blue">Price details</a>
		</div>				
		<div>
		<div>
			<% 	double sum=0;double gst=0;double delivery=10;
			if(request.getAttribute("cart")!=null){ %>
			<% ArrayList<HashMap<String,String>> cartdata=(ArrayList<HashMap<String,String>>)request.getAttribute("cart"); for(int i=0;i<cartdata.size();i++){sum+=Double.parseDouble(String.valueOf(cartdata.get(i).get("price")));gst=0.1d*sum;%>
				<div style="padding:15px 0px;text-align:center;border-bottom:1px solid #c1c1c1;">
					<img style="width:50%" src="<%=cartdata.get(i).get("thumbnail") %>" />
						<div style="display:flex;justify-content:center">
							<button style="border: 1px solid gray;border-radius: 50%;font-size: 19px;width: 26px;font-weight: 100;" onclick="document.getElementsByTagName('input')[0].value=parseInt(document.getElementsByTagName('input')[0].value)+1">+</button>	
		    				<input  style="text-align:center;border: 1px solid;outline:none;width: 50px;border-radius: 0.2em;padding: 5px;margin: 0px 10px;" type="number" value="1" />											
							<button style="border: 1px solid gray;border-radius: 50%;font-size: 19px;width: 26px;font-weight: 100;" onclick="if(parseInt(document.getElementsByTagName('input')[0].value)>1){document.getElementsByTagName('input')[0].value=parseInt(document.getElementsByTagName('input')[0].value)-1}">-</button>			    				
	    				</div>					
					<div style="padding:0px 20px;text-align:left">
						<p style="margin:15px 0px;font-size:18px;line-height:30px"><%=cartdata.get(i).get("name") %></p>
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
						<a href="/removecart?pid=<%=cartdata.get(i).get("id") %>" style="margin:15px 0px;font-size:14px;text-decoration:none">Remove</a>					
					</div>
				</div>
			<% } %>
		</div>
		</div>		
	</div>
</div>
	<div onclick="closetoast(event.target)" class="back">
	</div>
		<div class="displaypanel toaster">
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

		<div style="position: fixed;bottom: 0;text-align:right;left: 0;right: 0;box-shadow:0 -2px 10px 0 rgb(0 0 0 / 10%);background-color:white;">
			<button class="purchase">Place Order</button>
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
<script>
	function opentoast(){
		document.getElementsByClassName("back")[0].style.display="block"		
		document.getElementsByClassName("toaster")[0].style.height="310px"				
	}
	function closetoast(e){
		if(e.className="back"){
			document.getElementsByClassName("back")[0].style.display="none"		
			document.getElementsByClassName("toaster")[0].style.height="0"				
		}
	}	
</script>
</body>
</html>