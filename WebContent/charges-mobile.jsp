<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/navbar-mobile.css" />
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
	border:1px solid gray;border-radius:0.2em;width:75%;padding:10px;margin:20px 10px;
}

html,body{
	width: 100%;
	height: 100%;
}
.tab{
	margin: 0 15px;font-size:24px;line-height: 40px;cursor:pointer;color:black;text-decoration:none
}
.active{
	border-bottom: 2px solid blue;
}
</style>
<title>Pet Peaker</title>
</head>
<body>
<% HashMap h3=(HashMap)request.getSession().getAttribute("services"); %>
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

<% HashMap<String,Object> data=(HashMap<String,Object>)request.getAttribute("plans"); %>
<% if(data.size()>0){ %>
<div style="text-align:center;overflow:auto;margin:40px auto;width:90%">
	<p style="font-size:50px;margin: 20px 0;">Pricing</p>
	<p style="line-height:40px;font-size:20px;color:#464646">Get the power, control, and customization you need to manage your team's and organization's projects.</p>
</div>
<div style="text-align:center;display:flex;justify-content:center">
	<a href="/pricing?sid=<%=request.getParameter("sid") %>&yr=0" class="tab <%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"":"active" %>">Monthly</a>
	<a href="/pricing?sid=<%=request.getParameter("sid") %>&yr=1" class="tab <%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"active":"" %>">Annually</a>		
</div>
<div style="margin:20px 10px;display:flex;justify-content:center;padding:10px 0px;flex-wrap:wrap;">
<% for(String i:data.keySet()){ %>
	<div class="pcard">
		<div style="overflow:auto;">
			<p style="font-size:25px;text-transform:capitalize"><%=((HashMap)data.get(i)).get("plan") %></p>
			<p style="line-height: 30px;font-size: 16px;"><%=((HashMap)data.get(i)).get("about")%></p>			
			<%if(Integer.valueOf((String)((HashMap)data.get(i)).get("discount"))>0){ %>
				<p style="text-decoration:line-through;font-size: 15px;margin: 10px 0;"><%=((HashMap)data.get(i)).get("price") %>  &#8377/<%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"yr":"mo" %></p>			
				<p style="font-size: 23px;margin: 17px 0;"><%=((HashMap)data.get(i)).get("discount") %>  &#8377/<%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"yr":"mo" %></p>							
			<% }else{ %>
				<p style="font-size: 20px;margin:25px 0"><%=((HashMap)data.get(i)).get("price") %>  &#8377/<%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"yr":"mo" %></p>						
			<% } %>
			<div style="left:0;right:0;width:100%;">
				<a href="/servicecart?plid=<%=i%>&yr=<%=(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?"1":"0" %>"><button style="cursor:pointer;font-size: 17px;color: white;background: transparent;border: 0;background-color: blue;padding: 10px;padding-left: 15px;padding-right: 15px;border-radius: 0.3em;width: 100%;box-sizing: border-box;">Choose plan</button></a>
			</div>								
		</div>
		<div style="background-color:white;color:black;position:relative;">
			<ul style="line-height: 50px;padding:20px;font-size: 15px;text-transform:capitalize;list-style-image: url(https://img.icons8.com/material-sharp/20/000000/checkmark--v1.png);">
				<% ArrayList<String> d=(ArrayList<String>)((HashMap)data.get(i)).get("features"); %>
				<% for(String j:d){ %>
				<li ><%=j %></lij>
				<% } %>
			</ul>
		</div>
	</div>
<% } %>	
</div>
<% }else{ %>
<div style="text-align:center;overflow:auto;height:100%;display:flex;align-items:center;justify-content:center;box-sizing:border-box">
<div >
	<img style="width:70px" src="data:image/png;base64,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"/>
	<h1>No pricing is available for this service</h1>
</div>
</div>
<% } %>
<script type="text/javascript" src="javascript/navbar.js"></script>
</body>
</html>