<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="css/splashscreen.css" />    
    <style>
    .slider{
    	position:relative;
    	top:0;
    	height:10px;
    	z-index:1;
    }
    .slider > .track{
		position: absolute;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    border-radius: 5px;
	    background-color: white;
	    border: 1px solid gray;    
    }
    .slider > .range{
    	position:absolute;
    	top:0;
    	left:0%;
    	right:0%;
    	bottom:0;
    	background-color:blue;
    	border-radius:5px;
    	z-index:2
    }
    input[type="range"]{
    	position:absolute;
    	height:100%;
    	opacity:0;
    	z-index:2;
    	pointer-events:none;
    	width:100%;
    }
    input[type="range"]::-webkit-slider-thumb{
	    appearance:none;
    	pointer-events:all;	    
    }
    .multi-range-slider{
    	position:relative
    }
    .pricelabel{
	    display:flex;justify-content:space-between;padding:5px 0px
    }
    .card{
		margin: 20px 10px;
	    width: 23%;
	    height: 210px;
	    border-radius: 5px;
	    position: relative;
	    border: 1px solid #d2d2d2;
    }
    .card:hover{
    	box-shadow:0 0 10px 0 #969696;
    }
    .card div{
		position: absolute;
	    bottom: 0px;
	    left: 0;
	    right: 0;
	    height: 43%;
	    padding: 0 10px;
	    line-height: 24px;
	    transition: 0.3s ease-in-out;
	    background-color: white;
	    text-transform: capitalize;
	    border-top: 1px solid #d2d2d2;
	    border-bottom-left-radius: 5px;
	    border-bottom-right-radius: 5px;
    }
    .card:hover div{
    	height:50%
    }
    .slider .thumb{
	    position:absolute;
    	width:15px;
    	height:15px;
    	border-radius:50%;
    	background-color:blue;
    	top:-2px;
    }
    .slider > .thumb.left{
	    left:0;
    }
    .slider > .thumb.right{
	    right:0;
    }    
    </style>
    <link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/navbar.css">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet peaker</title>
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
<% 	
ArrayList<HashMap<String,String>> pdata=(ArrayList<HashMap<String,String>>)request.getAttribute("bdata"); 
if(!pdata.isEmpty()){
	ArrayList<String> gender=(ArrayList<String>)request.getAttribute("filtergender");
	int max=(Integer)request.getAttribute("max");
	int min=(Integer)request.getAttribute("min");
%>
    <div style="display:flex;height:100%;box-sizing:border-box">
    	<div style="width: 20%;background-color:white;padding: 15px;box-sizing: border-box;padding-left: 15px;padding-right: 15px;border-right: 1px solid #e2e2e2;">
    		<div style="font-size: 20px;overflow: auto;font-weight: 600;margin-top:10px;margin-bottom:10px;display:flex;justify-content:space-between;align-items:center">
	    		<p style="margin:0">Filter by</p>    		
	    		<a style="color:blue;text-decoration:none;font-size:12px" href="/breeds?pid=<%=request.getParameter("pid")%>">Clear All</a>    			    		
    		</div>
    		<form onsubmit="return setvalue()" method="GET" action="/breeds?pid=<%=request.getParameter("pid") %>">
    			<div class="felement">
	    			<p style="font-weight:600">Gender</p>
	    			<select name="gender">
	    			<% for(String i:gender){ %>
	    				<option  value="<%=i %>"><%=(i.equals("0"))?"Male":"Female" %></option>
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
    	<div style="width: 80%;background-color:white;padding:10px;overflow:auto;box-sizing:border-box;">
    	<div style="margin:10px 0px;border-bottom:1px solid #d2d2d2;padding:10px 0;display:flex">
    		<p style="margin:0;font-weight:600;font-size:15px">Sort By</p>
    		<ul  style="display:flex;list-style:none;margin:0;font-size:14px;padding-left: 10px;">
    			<%if(request.getParameter("plh")!=null){ %> 
	    			<li style="padding:0 10px"><a style="text-decoration:none;color:black;border-bottom: 2px solid blue;padding-bottom: 10px;" >Price -- Low to High</a></li>
    			<% }else{ %>
    				<% if(request.getParameter("phl")!=null){ %>
		    			<li style="padding:0 10px"><a style="text-decoration:none;color:black;padding-bottom: 10px;" href="/breeds?pid=<%=request.getParameter("pid") %>&plh=1">Price -- Low to High</a></li>    			
	    			<% }else{ %>
		    			<li style="padding:0 10px"><a style="text-decoration:none;color:black;border-bottom: 2px solid blue;padding-bottom: 10px;" >Price -- Low to High</a></li>	    			
	    			<% } %>
    			<% } %>
    			<%if(request.getParameter("phl")!=null){  %>
	    			<li style="padding:0 10px"><a style="text-decoration:none;color:black;border-bottom: 2px solid blue;padding-bottom: 10px;" href="#">Price -- High to Low</a></li>    			
				<% }else{ %>
	    			<li style="padding:0 10px"><a style="text-decoration:none;color:black;padding-bottom: 10px;" href="/breeds?pid=<%=request.getParameter("pid") %>&phl=1">Price -- High to Low</a></li>    							
				<% } %>    			
    		</ul>
    	</div>
    	<div style="display:flex;flex-wrap:wrap;margin:30px 0">
	    	<% for(HashMap i:pdata){%>
	    		<div class="card"><a style="text-decoration:none;color:black" href="/breeddescription?bid=<%=i.get("id") %>">
		    		<img style="width:100%;max-height:100%;object-fit:cover;object-position:top;border-radius: 5px;" src="<%=i.get("thumbnail") %>" />
		    		<div>
		    			<p style="margin: 5px 0px;font-size: 15px;font-weight:600"><%=i.get("breed") %></p>
		    			<small><%=(i.get("gender").equals("0"))?"Male":"Female" %></small>
		    			<p style="margin: 9px 0;font-size: 17px;color: green;font-weight: 600;"><%=i.get("price") %> &#8377</p>
					</div>		    		
	    		</a></div>
	    	<% } %>    		
		</div>    	
    	</div>
    </div>
    
	<script src="javascript/navbar.js"></script>
	<script>
		var l1=0;
		var r1=100;		
		var min=parseInt(<%=min %>)
		var max=parseInt(<%=max %>)		
		function setvalue(){
			let g=document.getElementsByTagName("form")[0][0].value
			let m1=document.getElementsByClassName("pricelabel")[0].children[0].innerText
			let m2=document.getElementsByClassName("pricelabel")[0].children[1].innerText
			location.href=`/breeds?pid=<%=request.getParameter("pid")%>&gender=`+g+`&pr1=`+m1+`&pr2=`+m2
			return false;
		}
		function crange1(n){
			l1=n										
			if(parseInt(l1)<parseInt(r1)){			
				document.getElementsByClassName("thumb")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.right=100-r1+"%"							
				let ele1=document.getElementsByClassName("pricelabel")[0].children[0]
				ele1.innerText=min+(parseInt(n)/100*(max-min))
			}
		}
		function crange2(n){
			r1=n										
			if(parseInt(r1)>parseInt(l1)){
				document.getElementsByClassName("thumb")[1].style.right=100-r1+"%"
				document.getElementsByClassName("range")[0].style.left=l1+"%"
				document.getElementsByClassName("range")[0].style.right=100-r1+"%"											
				let ele2=document.getElementsByClassName("pricelabel")[0].children[1]
				ele2.innerText=min+(parseInt(n)/100*(max-min))
			}
		}		
	</script>
	<% }else{ %>
    	<div style="width:100%;background-color:white;padding:10px;overflow:auto;box-sizing:border-box;height:100%;margin:auto;display:flex;justify-content:center;align-items:center;text-align:center;font-size:30px">
    		<div>
    			<img src="data:image/png;base64,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"/>
    			<h3 style="margin:10px">No results found</h3>
    			<a href="/breeds?pid=<%=request.getParameter("pid") %>" style="color:blue;text-decoration:none;font-size:20px">Reload</a>
    		</div>
    	</div>				
   	<% } %>		
</body>
</html>