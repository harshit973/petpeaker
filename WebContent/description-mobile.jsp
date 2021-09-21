<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet peaker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<link rel="stylesheet" href="css/navbar-mobile.css" />
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/description-mobile.css" />
</head>
<body onload="loaders()">
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

	<%if(request.getAttribute("pdata")!=null){ 
		HashMap<String,Object> pdata=(HashMap<String,Object>)request.getAttribute("pdata");
		if(!pdata.isEmpty()){
	%>    	
	 <% ArrayList<HashMap<String,String>> rarr=(ArrayList<HashMap<String,String>>)pdata.get("ratings");%>
    		 <div style="width:100%;display:flex;justify-content:center;position: fixed;bottom: 0;background-color: white;box-sizing: border-box;box-shadow: 0 0px 5px 0px #1b1b1b;">
    		 	<button class="purchase" <%if(String.valueOf(pdata.get("qty")).equals("0")){ %> disabled<% } %> >Buy Now</button>
    		 	<button class="purchase" <% if(String.valueOf(pdata.get("qty")).equals("0")){ %> disabled<% }else{ %> onclick="submitform()"  <% } %> >Add to cart</button>		    		 	
    		 </div>    		    	
	 
<div style="height: 100%;padding: 10px;box-sizing: border-box;">
    	<div style="width:100%;padding:10px;overflow:auto;box-sizing:border-box;height:100%;display:flex;flex-wrap:wrap;">
    		<div style="padding:10px;display: flex;align-items: center;width:100%">
    			<div style="position:relative;width:100%;text-align:center">
		    		 <img style="max-width:300px" src="<%=pdata.get("thumbnail") %>" />    			
				<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
		    		 <div onclick="wishhandler()" style="position:absolute;top:0;right:0;z-index:1;cursor:pointer">
			    		 <svg  class="wish" xmlns="http://www.w3.org/2000/svg" viewBox="0 -20 480 480" style="height: 35px;width: 35px;"><path d="m348 8c-44.773438.003906-86.066406 24.164062-108 63.199219-21.933594-39.035157-63.226562-63.195313-108-63.199219-68.480469 0-124 63.519531-124 132 0 172 232 292 232 292s232-120 232-292c0-68.480469-55.519531-132-124-132zm0 0" style="fill: aqua;"/><path d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0" fill="#3d9ae2"/></svg>
		    		 </div>
    			<% } %>        		    		 
    			</div>
    		</div>
    		<div style="overflow:auto">
    			<div style="line-height:35px;padding-top: 10px;padding-bottom: 10px;">
	    			<h2 style="line-height:35px;margin:0;font-size:22px;font-weight:100"><%=pdata.get("name") %></h2>
	    			<% if(String.valueOf(pdata.get("qty")).equals("0")){ %>
	    			<p style="margin:0;font-size:17px;color:red">This product is out of stock</p>
	    			<% } %>
	    			<p style="margin:0;font-size:17px"><%=pdata.get("brand") %></p>
	    			<p style="margin:0;font-size:15px;color:green;font-weight:600"><%=pdata.get("price") %> &#8377</p>
	    			<div style="margin-top:10px;margin-bottom:10px;width:45px;background-color:green;text-align: center;color: white;border-radius: 0.5em;padding-left: 10px;padding-right: 10px;">
		    			<p style="margin:0;font-size:15px">&#9956; <%=pdata.get("rating") %></p>	    				    			
	    			</div>
    			</div>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p style="font-size: 17px;font-weight: 600;">Quantity</p>
    				<input style="border: 1px solid;outline:none;width: 50px;border-radius: 0.2em;padding: 5px;" type="number" value="1" />
    			</div>
   				<% ArrayList<String> highlights=(ArrayList<String>)pdata.get("highlights"); 
   				if(!highlights.isEmpty()){%>    			
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Highlights</p>
    				<ul style="padding-left: 15px;line-height: 25px;font-size: 14px;">
    				<% for(String i:highlights){ %>    					
    					<li><%=i%></li>
    				<% } %>    					
    				</ul>
    			</div>
    			<% } %>
    			<form method="GET" action="/addcart">
	    			<input type="hidden" name="pid" value="<%=request.getParameter("pid") %>" />
	    			<% if(!((ArrayList<HashMap<String,String>>)pdata.get("flavor")).isEmpty()){ %>
		    			<input type="hidden" name="flavor" value="<%= ((ArrayList<HashMap<String,String>>)pdata.get("flavor")).get(0).get("id") %>" />	    			
	    			<% } %>
	    			<% if(!((ArrayList<String>)pdata.get("size")).isEmpty()){ %>
		    			<input type="hidden" name="size" value="<%=((ArrayList<HashMap<String,String>>)pdata.get("size")).get(0).get("id") %>" />	    			
	    			<% } %>
	    			<% if(!((ArrayList<String>)pdata.get("color")).isEmpty()){ %>
		    			<input type="hidden" name="color" value="<%=((ArrayList<HashMap<String,String>>)pdata.get("color")).get(0).get("id") %>" />	    			
	    			<% } %>	    			
    			</form>     			
    			<% ArrayList<HashMap<String,String>> flavor=(ArrayList<HashMap<String,String>>)pdata.get("flavor"); 
    				if(!flavor.isEmpty()){
    			%>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Flavors</p>
    				<div class="fbuttongroup">
	    				<% for(HashMap<String,String> i:flavor){ %>    					
	    					<button class="fbutton"><%=i.get("name") %></button>
	    				<% } %>    					
					</div>    				
    			</div>    			
    			<% } %>    			
    			<% ArrayList<HashMap<String,String>> size=(ArrayList<HashMap<String,String>>)pdata.get("size"); 
    				if(!size.isEmpty()){
    			%>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Size</p>
    				<div class="fbuttongroup">
	    				<% for(HashMap<String,String> i:size){ %>    					
	    					<button class="fbutton"><%=i.get("name") %></button>
	    				<% } %>    					
					</div>    				
    			</div>    			
    			<% } %>    			    			
    			<% ArrayList<HashMap<String,String>> color=(ArrayList<HashMap<String,String>>)pdata.get("color"); 
    				if(!color.isEmpty()){
    			%>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Color</p>
    				<div class="fbuttongroup">
	    				<% for(HashMap<String,String> i:color){ %>    					
	    					<button class="fbutton"><%=i.get("name") %></button>
	    				<% } %>    					
					</div>    				
    			</div>    			
    			<% } %>    			    			    			
    			<% String note=String.valueOf(pdata.get("note")); 
    				if(!note.isEmpty()){
    			%>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Important note</p>
    				<p  style="font-size: 15px;line-height:30px"><%= note%> </p>
    			</div>    			
    			
    			<% 
    				if(!rarr.isEmpty()){
    			%>
    			<div style="margin-top:50px;margin-bottom:50px">    			
    				<p  style="font-size: 17px;font-weight: 600;">Ratings & Reviews</p>
    				<div>
	    				<% for(HashMap<String,String> i:rarr){ %>    					
	    					<p style="text-transform:capitalize;font-size: 15px;font-weight: 700;"><%=i.get("fname") %> <%=i.get("lname") %></p>
			    			<div style="width:30px;background-color:green;text-align: center;color: white;border-radius: 0.5em;">
				    			<p style="margin-top:10px;margin-bottom:10px;width:30px;background-color:green;text-align: center;color: white;border-radius: 0.5em;padding-left: 10px;padding-right: 10px;padding: 5px;">&#9956; <%=pdata.get("rating") %></p>	    				    			
			    			</div>	    					
	    					<p style="font-size: 14px;"><%=i.get("review") %></p>	    					
	    				<% } %>    					
					</div>    				
    			</div>    			
    			<% } %>    			    			    			    			<% } %>    			    			
    		</div>
    	</div>				    	
</div>
    <% } } %>    		
<div class="toaster" style="position:fixed;bottom:-50px;width:100%;padding:10px;box-sizing:border-box;display:flex;justify-content:center;transition:0.5s ease-in-out">
	<div style="border-radius:0.2em;background-color:black;padding:10px;box-sizing:border-box;color:white"><small>Added to wishlist</small></div>
</div>
<div class="toaster2" style="position:fixed;bottom:-50px;width:100%;padding:10px;box-sizing:border-box;display:flex;justify-content:center;transition:0.5s ease-in-out">
	<div style="border-radius:0.2em;background-color:black;padding:10px;box-sizing:border-box;color:white"><small>Removed from wishlist</small></div>
</div>
<script src="javascript/navbar.js"></script>
<script>
var pid="<%=request.getParameter("pid")%>"
var processing=0;
var pendingstack=[]
<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ){ %>
<% if(((ArrayList<HashMap>)request.getAttribute("wishlist"))!=null && !((ArrayList<HashMap>)request.getAttribute("wishlist")).isEmpty()){%>
var iswish=1
<% }else{ %>
var iswish=0
<% } %>
<% }else{ %>
var iswish=0
<% } %>
function loaders(){
let e=document.getElementsByClassName("fbuttongroup")
for(let i=0;i<e.length;i++){
let ele=e[i].children;
if(ele.length==1){
ele[0].style.color="red"
}
}
if(iswish==1){
	document.getElementsByClassName("wish")[0].children[0].style.fill="red"		
}
}
function wishhandler(){
	if(iswish=="0"){
		addwish()
		iswish=1
	}else{
		removewish()
		iswish=0
	}
}
function addwish(){
	document.getElementsByClassName("toaster2")[0].style.bottom="-50px"
	document.getElementsByClassName("toaster")[0].style.bottom="30px"
	setTimeout(()=>{document.getElementsByClassName("toaster")[0].style.bottom="-50px"},3000)
	var xhr = new XMLHttpRequest();
	xhr.open("GET","/addwish?pid="+pid, true);
	xhr.onreadystatechange=function(){
		if(xhr.readyState === XMLHttpRequest.DONE && this.status==200) {
			if(pendingstack.length==0){
				processing=0;
			}else{
				req=pendingstack.pop()
				req.send()
			}
		}
	}
	xhr.setRequestHeader('Content-Type', 'application/json');
	if(processing==1){
		pendingstack.push(xhr)
	}else{
		xhr.send();            		
		processing=1
	}
	document.getElementsByClassName("wish")[0].children[0].style.fill="red"	
}
function removewish(){
	document.getElementsByClassName("toaster")[0].style.bottom="-50px"
	document.getElementsByClassName("toaster2")[0].style.bottom="30px"
	setTimeout(()=>{document.getElementsByClassName("toaster2")[0].style.bottom="-50px"},3000)
	var xhr = new XMLHttpRequest();
	xhr.open("GET","/removewish?pid="+pid, true);
	xhr.onreadystatechange=function(){
		if(xhr.readyState === XMLHttpRequest.DONE && this.status==200) {
			if(pendingstack.length==0){
				processing=0;
			}else{
				req=pendingstack.pop()
				processing=1				
				req.send()
			}
		}
	}	
	xhr.setRequestHeader('Content-Type', 'application/json');
	if(processing==1){
		pendingstack.push(xhr)
	}else{
		xhr.send();            		
	}
	document.getElementsByClassName("wish")[0].children[0].style.fill="aqua"	
}
function submitform(){
	document.getElementsByTagName("form")[0].submit()
}
</script>
</body>
</html>