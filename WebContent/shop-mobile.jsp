<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Pet Peaker</title>
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/shop-mobile.css" />
<link rel="stylesheet" href="css/navbar-mobile.css" />
</head>
<body>
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
<%	if(request.getAttribute("product")!=null && request.getAttribute("max")!=null && request.getAttribute("min")!=null){
	ArrayList<String[]> pdata=(ArrayList<String[]>)request.getAttribute("product"); 
	ArrayList<String> brands=(ArrayList<String>)request.getAttribute("brands");
	int max=(Integer)request.getAttribute("max");
	int min=(Integer)request.getAttribute("min");		
	ArrayList<String> category=(ArrayList<String>)request.getAttribute("categories");
%>
<div class="filterdrop" >
	<div style="padding:10px;box-sizing:border-box">
			<div style="text-align:right">
			<p onclick="document.getElementsByClassName('filterdrop')[0].style.height='0'" style="margin:0">X</p>
			</div>
    		<div style="font-size: 20px;overflow: auto;font-weight: 600;margin-top:10px;margin-bottom:10px;display:flex;justify-content:space-between;align-items:center">
	    		<p style="margin:0">Filter by</p>    		
	    		<a style="color:blue;text-decoration:none;font-size:12px" href="/shop">Clear All</a>    			    		
    		</div>
    		<form onsubmit="return setvalue()" method="GET" action="/shop">
    			<div class="felement">
	    			<p style="font-weight:600">Brand</p>
	    			<select name="br">
	    			<% for(String i:brands){ %>
	    				<option  value="<%=i %>"><%=i %></option>
	    			<% } %>
	    			</select>
    			</div>
    			<div class="felement">
	    			<p style="font-weight:600">Category</p>
	    			<select name="cgy">
	    			<% for(Object i:category){ %>
	    				<option  value="<%=i %>"><%=i %></option>
	    			<% } %>
	    			</select>
    			</div>
    			<div class="felement">
	    			<p style="font-weight:600">Price</p>
	    			<div class="multi-range-slider">
	    				<input name="pr1" oninput="crange1(event.target.value)" value="0" type="range" min="0" max="100" id="range1" />
	    				<input name="pr2" oninput="crange2(event.target.value)" value="100" type="range" min="0" max="100" id="range2" />	    				
	    				<div class="slider">
		    				<div class="track"></div>
		    				<div class="range"></div>
		    				<div class="thumb left"></div>
		    				<div class="thumb right"></div>		    				
	    				</div>
	    			</div>
	    			<div class="pricelabel" >
		    			<small><%=min %></small>
		    			<small><%=max %></small>		    			
	    			</div>	    			
    			</div>    			    			    				    			
    			<div>
    				<button type="submit">Filter</button>
    			</div>
    		</form>
</div>
</div>	
	<script>
		var l1=0;
		var r1=100;		
		var min=parseInt(<%=min %>)
		var max=parseInt(<%=max %>)		
		function setvalue(){
			let g=document.getElementsByTagName("form")[0][0].value
			let cgy=document.getElementsByTagName("form")[0][1].value			
			let m1=document.getElementsByClassName("pricelabel")[0].children[0].innerText
			let m2=document.getElementsByClassName("pricelabel")[0].children[1].innerText			
			location.href=`/shop?br=`+g+`&p1=`+m1+`&p2=`+m2+`&cgy=`+cgy
			return false;											
		}
		function crange1(n){
			l1=n										
			if(parseInt(l1)<parseInt(r1)){			
				document.getElementsByClassName("thumb")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.right=100-r1+"%"							
				let ele1=document.getElementsByClassName("pricelabel")[0].children[0]
				ele1.innerText=parseInt(min+(parseInt(n)/100*(max-min)))
			}
		}
		function crange2(n){
			r1=n										
			if(parseInt(r1)>parseInt(l1)){
				document.getElementsByClassName("thumb")[1].style.right=100-r1+"%"
				document.getElementsByClassName("range")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.right=100-r1+"%"											
				let ele2=document.getElementsByClassName("pricelabel")[0].children[1]
				ele2.innerText=parseInt(min+(parseInt(n)/100*(max-min)))
			}
		}		
	</script>    	
    <div style="padding-top:5px;display:flex;height:100%;box-sizing:border-box">
		<% if(request.getAttribute("product")!=null){
		if(category.size()>0){
		%>
    	<div style="width:100%;background-color:white;padding:10px;padding-left:0;padding-right:0;overflow:auto;box-sizing:border-box;">
    		<div style="text-align:right;padding:0 10px;box-sizing:border-box"><img style="width:20px" onclick="document.getElementsByClassName('filterdrop')[0].style.height='100%'" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAABD0lEQVRoge2Xuw3CMBRFb2goqNmDhoY9mIWSllkYhiXoEBIToFDAlSwT4eDftaV3JDdx5JzzpBQeAIzomIVaIBULaIED3v+Bux4Atkopjw2AO749j3yh5YigPGkxYrY8aSnib3nSQkS0PFFGJMsTRUQ2eVIzIrs8qRFRTJ6UjCguT0pEVJMnOSOqy5McETJ5khIhlydTEbGrujzJESGTJykRcnkSE5FFfshxyIcxcHZoP4ru78QWoMYC1FiAGgtQYwFqLECNBcxkWergGgE7AJcK30nGv3GtAJwAPCf2/MtNE/iC14lnI4AbgL3I8Sdz7sFnAGuVYIhf4s1O3aXLqbt0OXWXLqfu0uXUXSRTfwGaRhqhf4DD1QAAAABJRU5ErkJggg=="/></div>
    		<div style="display:flex;flex-wrap:wrap;">
    			<% for(String[] j:pdata){ %>
    			<a style="color:black;width:100%" href="/description?pid=<%=j[0] %>"><div style="width:98%;margin:auto;text-decoration:none;color:black;padding-top: 25px;padding-bottom: 25px;border-bottom: 1px solid #a7a7a79e;display:flex;align-items:center;line-height:24px" >
    				<img style="width:150px" src="<%=j[3] %>" />
    				<div style="margin-left:10px;margin-right:10px;word-break:break-word">
    					<p style="margin:5px;margin-left:0;margin-right:0;font-size: 16px;margin:5px 0px;"><%=j[1] %></p>
    					<p style="font-weight:600;color:green;font-size: 16px;margin:5px 0px;"><%=j[4] %> &#8377</p>    	
		    			<div style="margin: 5px 0px;width:45px;background-color:green;text-align: center;color: white;border-radius: 0.5em;padding: 6px 10px;">
			    			<p style="margin:0;font-size:15px">&#9956; <%= j[5]%></p>	    				    			
		    			</div>	    					    					
					</div>    				    			    				
    			</div></a>
    			<% } %>    		
			</div>    			
    	</div>		
		<% }else{ %>
    	<div style="width:100%;background-color:white;padding:10px;padding-left:0;padding-right:0;overflow:auto;box-sizing:border-box;display: flex;justify-content: center;align-items: center;text-align: center;">
    		<div>
    			<img src="data:image/png;base64,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"/>
    			<h3 style="margin:10px">No products found</h3>
    			<a href="/shop" style="color:blue;text-decoration:none;font-size:18px">Reload</a>
    		</div>
    	</div>				
		<% }} %>    
		</div>
<% } %>	
	<% HashMap h2=(HashMap)request.getSession().getAttribute("services");
	HashMap h=(HashMap)request.getSession().getAttribute("services");

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
        <a href="/ownapet">Own a pet</a>        
        <a href="/shop">Shop</a>
		<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1")) { %>         
	        <a href="/joinus">Join us</a>
        <% } %>                        
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
        <a href="/account">Account</a>		
        <a href="/logout">Logout</a>        
        <% } %>
    </div>
</div>

<script src="javascript/navbar.js"></script>
</body>
</html>