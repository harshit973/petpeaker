<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/account.css">
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<meta charset="ISO-8859-1">
<title>Pet Keeper</title>
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
	    					<img style="width:250px" src="" />
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
<div style="display:flex;padding:10px;box-sizing:border-box;">
<section style="width:20%;background-color:white;box-shadow:0 1px 5px 1px #d0d0d0;padding-top:10px;height:100%">
	<div class="menuitem head">
		<div><img style="width:55px" src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/avatar.png?alt=media&token=041bbb3f-5047-4b88-a2bd-a656348b2117" alt="" /></div>
		<div style="line-height:25px;padding:0 10px">
			<small>Welcome</small>
			<p style="font-size:20px;margin:0;font-weight:600"><%=((HashMap)request.getSession().getAttribute("userdata")).get("firstname")%> <%=((HashMap)request.getSession().getAttribute("userdata")).get("lastname")%> </p>
		</div>
	</div>
	<div  class="menuitem aloneitem">
		<div style="margin:10px"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDI0IDE4Ij48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC04LjY5NCAtMTEpIj48ZWxsaXBzZSBjeD0iMjAuNTU3IiBjeT0iMjAiIHJ4PSIyMC41NTciIHJ5PSIyMCIvPjxwYXRoIGZpbGw9IiMyODc0RjEiIGQ9Ik05IDExdjE3LjEwOGMwIC40OTMuNDEuODkyLjkxOC44OTJoNC45M3YtNS4yNTdoLTMuMDMzbDQuOTEyLTQuNzcgNC45NzIgNC44M2gtMy4wMzVWMjloMTIuNDE3Yy41MDcgMCAuOTE4LS40LjkxOC0uODkyVjExSDl6Ii8+PC9nPjwvc3ZnPg==" /></div>
		<div><p>My Orders</p></div>
	</div>	
	<div class="menuitem">
		<div style="display:flex;justify-content:start;align-items:center">
<svg style="margin-left:5px;margin-right:5px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" width="25" height="25" x="0" y="0" viewBox="0 0 45.532 45.532" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g>
<g xmlns="http://www.w3.org/2000/svg">
	<path d="M22.766,0.001C10.194,0.001,0,10.193,0,22.766s10.193,22.765,22.766,22.765c12.574,0,22.766-10.192,22.766-22.765   S35.34,0.001,22.766,0.001z M22.766,6.808c4.16,0,7.531,3.372,7.531,7.53c0,4.159-3.371,7.53-7.531,7.53   c-4.158,0-7.529-3.371-7.529-7.53C15.237,10.18,18.608,6.808,22.766,6.808z M22.761,39.579c-4.149,0-7.949-1.511-10.88-4.012   c-0.714-0.609-1.126-1.502-1.126-2.439c0-4.217,3.413-7.592,7.631-7.592h8.762c4.219,0,7.619,3.375,7.619,7.592   c0,0.938-0.41,1.829-1.125,2.438C30.712,38.068,26.911,39.579,22.761,39.579z" fill="#1781c1" data-original="#000000" style="" class=""/>
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
</g></svg>			
<p style="display:inline-block;margin:0;">Account Settings</p>
		</div>
		<div class="submenu">
			<ul>
				<% if(request.getParameterMap().isEmpty()){ %>
					<li style="color:blue">View Profile</li>
				<% }else{ %>
					<li><a style="text-decoration:none;color:black" href="/account">View Profile</a></li>				
				<% } %>
				<li>Edit Profile</li>
				<li>Manage Addresses</li>				
			</ul>
		</div>		
	</div>		
	<div class="menuitem">
		<div style="display:flex;justify-content:start;align-items:center">
			<img style="display:inline-block;margin-left:10px;margin-right:10px" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMyIgaGVpZ2h0PSIxOSIgdmlld0JveD0iMCAwIDIzIDE5Ij48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGZpbGw9IiMyODc0RjAiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTIwLjUgMi43NWgtOUw5LjI1LjVIMi41QTIuMjQ3IDIuMjQ3IDAgMCAwIC4yNiAyLjc1bC0uMDEgMTMuNUEyLjI1NyAyLjI1NyAwIDAgMCAyLjUgMTguNWgxOGEyLjI1NyAyLjI1NyAwIDAgMCAyLjI1LTIuMjVWNWEyLjI1NyAyLjI1NyAwIDAgMC0yLjI1LTIuMjV6bS01LjYyNSAzLjM3NWEyLjI1NyAyLjI1NyAwIDAgMSAyLjI1IDIuMjUgMi4yNTcgMi4yNTcgMCAwIDEtMi4yNSAyLjI1IDIuMjU3IDIuMjU3IDAgMCAxLTIuMjUtMi4yNSAyLjI1NyAyLjI1NyAwIDAgMSAyLjI1LTIuMjV6bTQuNSA5aC05VjE0YzAtMS40OTYgMy4wMDQtMi4yNSA0LjUtMi4yNXM0LjUuNzU0IDQuNSAyLjI1djEuMTI1eiIvPjxwYXRoIGQ9Ik0tMi00aDI3djI3SC0yeiIvPjwvZz48L3N2Zz4=" />
			<p style="display:inline-block;margin:0;">My stuff</p>
		</div>
		<div class="submenu">
			<ul>
				<li>My coupons</li>
				<% if(request.getParameter("wishlist")!=null && request.getParameter("wishlist").equals("1")){ %>				
					<li style="color:blue">My wishlist</li>				
				<% }else{ %>
					<li><a href="/account?wishlist=1" style="text-decoration:none;color:black">My wishlist</a></li>				
				<% } %>
				<li>My reviews & ratings</li>				
			</ul>
		</div>		
	</div>
	<div onclick="location.href='/logout'" class="menuitem aloneitem">
		<div style="margin:10px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" width="25" height="25" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g>
<g xmlns="http://www.w3.org/2000/svg">
	<path style="" d="M505.665,243.74l-54.784-38.623c-9.926-6.997-23.645,0.128-23.645,12.26v23.622H164.197   c-8.285,0-15.001,6.716-15.001,15.001c0,8.285,6.716,15.001,15.001,15.001h263.039v23.621c0,12.213,13.792,19.204,23.644,12.26   l54.784-38.622C514.13,262.294,514.094,249.694,505.665,243.74z" fill="#1781c1" data-original="#59ffe6" class=""/>
	<path style="" d="M233.603,489.603C104.49,489.603,0,385.124,0,256C0,126.887,104.479,22.397,233.603,22.397   c86.181,0,161.843,46.78,202.341,116.788c4.148,7.171,1.697,16.347-5.474,20.496c-7.168,4.146-16.347,1.698-20.496-5.474   c-35.236-60.914-101.1-101.809-176.372-101.809C121.337,52.398,30.001,143.734,30.001,256s91.336,203.602,203.602,203.602   c75.316,0,141.158-40.932,176.373-101.811c4.15-7.172,13.327-9.621,20.496-5.474c7.171,4.149,9.621,13.325,5.474,20.496   C395.429,442.854,319.751,489.603,233.603,489.603z" fill="#1781c1" data-original="#59ffe6" class=""/>
</g>
<g xmlns="http://www.w3.org/2000/svg">
	<path style="" d="M149.197,256c0,8.284,6.716,15.001,15.001,15.001h263.039v23.621   c0,12.213,13.792,19.204,23.644,12.26l54.783-38.622c4.232-2.982,6.339-7.622,6.336-12.26H149.197z" fill="#1781c1" data-original="#19e9d7" class=""/>
	<path style="" d="M430.472,352.317c-7.169-4.147-16.346-1.698-20.496,5.474   c-35.215,60.879-101.057,101.811-176.373,101.811c-112.266,0-203.602-91.336-203.602-203.602H0   c0,129.124,104.49,233.603,233.603,233.603c86.147,0,161.826-46.75,202.342-116.79   C440.093,365.642,437.643,356.466,430.472,352.317z" fill="#1781c1" data-original="#19e9d7" class=""/>
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
</g></svg></div>		
		<div><p>Logout</p></div>
	</div>					
</section>
<div class="displaypanel">
<% if(request.getParameterMap().isEmpty()){ %>
	<div>
	<div class="panelhead"><svg style="margin-left:5px;margin-right:5px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" width="25" height="25" x="0" y="0" viewBox="0 0 45.532 45.532" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g>
<g xmlns="http://www.w3.org/2000/svg">
	<path d="M22.766,0.001C10.194,0.001,0,10.193,0,22.766s10.193,22.765,22.766,22.765c12.574,0,22.766-10.192,22.766-22.765   S35.34,0.001,22.766,0.001z M22.766,6.808c4.16,0,7.531,3.372,7.531,7.53c0,4.159-3.371,7.53-7.531,7.53   c-4.158,0-7.529-3.371-7.529-7.53C15.237,10.18,18.608,6.808,22.766,6.808z M22.761,39.579c-4.149,0-7.949-1.511-10.88-4.012   c-0.714-0.609-1.126-1.502-1.126-2.439c0-4.217,3.413-7.592,7.631-7.592h8.762c4.219,0,7.619,3.375,7.619,7.592   c0,0.938-0.41,1.829-1.125,2.438C30.712,38.068,26.911,39.579,22.761,39.579z" fill="#1781c1" data-original="#000000" style="" class=""/>
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
<g xmlns="http://www.w3.org/2000/svg">
</g>
</g></svg><h2>View Profile</h2></div>
	<div style="border-bottom: 1px solid #c7c7c7;">
		<p style="font-size:18px">Firstname</p>
		<p style="font-size:15px"><%=((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("firstname") %></p>
	</div>
	<div style="border-bottom: 1px solid #c7c7c7;">
		<p style="font-size:18px">Lastname</p>
		<p style="font-size:15px"><%=((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("lastname") %></p>
	</div>
	<div style="border-bottom: 1px solid #c7c7c7;">
		<p style="font-size:18px">Email address</p>
		<p style="font-size:15px"><%=((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("email") %></p>
	</div>	
	<div style="border-bottom: 1px solid #c7c7c7;">
		<p style="font-size:18px">Gender</p>
		<p style="font-size:15px"><%=(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("gender").equals(false))?"Male":"Female" %></p>
	</div>		
	<div style="border-bottom: 1px solid #c7c7c7;">
		<p style="font-size:18px">Address</p>
		<% ArrayList<String> address=(ArrayList<String>)(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("address")); %>		
		<%for(String i:address){ %>
		<p style="font-size:15px"><%=i %></p>
		<% } %>
	</div>			
</div>
<% } %>
<% if(request.getParameter("wishlist")!=null && request.getParameter("wishlist").equals("1")){ %>
<div style="height:100%;box-sizing:border-box">
	<% if(request.getAttribute("wishlist")!=null && !((ArrayList)request.getAttribute("wishlist")).isEmpty()){ 
		ArrayList<HashMap<String,String>> data=(ArrayList<HashMap<String,String>>)request.getAttribute("wishlist");
	%>
	<div>
		<div class="panelhead">
			<img style="display:inline-block;margin-left:10px;margin-right:10px" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMyIgaGVpZ2h0PSIxOSIgdmlld0JveD0iMCAwIDIzIDE5Ij48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGZpbGw9IiMyODc0RjAiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTIwLjUgMi43NWgtOUw5LjI1LjVIMi41QTIuMjQ3IDIuMjQ3IDAgMCAwIC4yNiAyLjc1bC0uMDEgMTMuNUEyLjI1NyAyLjI1NyAwIDAgMCAyLjUgMTguNWgxOGEyLjI1NyAyLjI1NyAwIDAgMCAyLjI1LTIuMjVWNWEyLjI1NyAyLjI1NyAwIDAgMC0yLjI1LTIuMjV6bS01LjYyNSAzLjM3NWEyLjI1NyAyLjI1NyAwIDAgMSAyLjI1IDIuMjUgMi4yNTcgMi4yNTcgMCAwIDEtMi4yNSAyLjI1IDIuMjU3IDIuMjU3IDAgMCAxLTIuMjUtMi4yNSAyLjI1NyAyLjI1NyAwIDAgMSAyLjI1LTIuMjV6bTQuNSA5aC05VjE0YzAtMS40OTYgMy4wMDQtMi4yNSA0LjUtMi4yNXM0LjUuNzU0IDQuNSAyLjI1djEuMTI1eiIvPjxwYXRoIGQ9Ik0tMi00aDI3djI3SC0yeiIvPjwvZz48L3N2Zz4=">
			<h2 style="margin:5px 0px">Wishlist</h2>
		</div>				
		<% for(HashMap<String,String> i:data){ %>
		<div style="padding:5px 0px;border-bottom:1px solid #d1d1d1">
			<div style="margin:15px 0px;display:flex;align-items:flex-start;justify-content:space-between;max-width: 90%;">
				<div style="display:flex;max-width: 70%;align-items:center;">
					<div style="margin:0px 5px;max-width: 24%;">
						<img style="width:100%" src="<%=i.get("thumbnail") %>" />
					</div>
					<div class="w-item">
						<a href="/description?pid=<%=i.get("pid") %>" style="font-size: 17px;margin:5px 0px;line-height:26px;color:black;text-decoration:none;"><%=i.get("pname") %></a>
						<div style="margin-top:10px;margin-bottom:10px;width: 30px;background-color:green;text-align: center;color: white;border-radius: 0.5em;padding: 5px 7px;">
			    			<p style="margin:0;font-size: 15px;">&#9956; 4</p>	    				    			
		    			</div>		    			
		    			<a href="/rmwish?pid=<%=i.get("pid") %>" style="color:blue;text-decoration:none;font-size:15px">Remove</a>	    				    					    			
					</div>
				</div>				
				<div>
					<p style="font-size:19px;margin:5px 0px;color:green"><%=i.get("price") %> &#8377</p>				
				</div>
			</div>
			</div>
		<% } %>
	</div>
	<% }else{ %>
	<div style="display:flex;justify-content:center;align-items:center;text-align:center;height:100%">
		<div>
			<img style="width:70px" src="data:image/png;base64,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"/>
			<p style="font-size:24px" >Your wishlist is empty</p>
			<a style="font-size:18px;text-decoration:none;color:blue" href="/shop">Return to shopping</a>
		</div>	
	</div>
	<% } %>
</div>
<% }  %>
</div>
</div>
<script src="javascript/navbar.js"></script>
</body>
</html>