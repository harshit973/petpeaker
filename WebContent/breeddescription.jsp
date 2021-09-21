<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet peaker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/description.css" />
<style>
	.colorthmg{
		border:1px solid #cccccc;padding:2px;cursor:pointer;width: 100px;
	}
	.purchase{
		background-color:blue;font-size:16px;margin-left:3px;margin-right:3px;color: white;background: transparent;border: 0;background-color: blue;padding: 10px;padding-left: 15px;padding-right: 15px;border-radius: 0.3em;width:100%
	}
	.purchase:disabled{
		background-color:#0000ff94;
	}
	.popupback{
		position:fixed;
		top:0;
		width:100%;
		height:100%;
		background-color:#000000b3;
		z-index:666;
		display:flex;
		align-items:center;
		display:none;
	}
	.popupback .popup{
		margin:auto;
		width:40%;
		background-color:white;
		padding:20px;
		border-radius:10px;
		position:relative
	}
</style>
</head>
<body onload="setsummary()">
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
<% HashMap<String,String> pdata=null; %>
<div class="popupback">
	<div class="popup">
		<div class="panelhead" style="border-bottom:1px solid #c1c1c1">
			<h2 style="margin:5px 0px">Order summary</h2>
		</div>					
		<p style="cursor:pointer;font-size:19px;position:absolute;top:10px;margin:0;right:10px" onclick="document.getElementsByClassName('popupback')[0].style.display='none'">X</p>
		<div id="pricedata" style="padding:10px">
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">Price</p>
				<p style="font-size:15px"> 	&#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">GST</p>
				<p style="font-size:15px"> 	&#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center">
				<p style="font-size:18px">Delivery charges</p>
				<p style="font-size:15px"> &#8377</p>				
			</div>	
			<div style="display:flex;justify-content:space-between;align-items:center;border-top:1px dotted #a5a5a5">
				<p style="font-size:18px">Total Amount</p>
				<p style="font-size:15px">  &#8377</p>				
			</div>				
			<div>
			<button class="purchase">Proceed to pay</button>
			</div>
		</div>	
	</div>
</div>
<div style="height: 100%;box-sizing: border-box;">
    	<div style="width:100%;background-color:white;overflow:auto;box-sizing:border-box;height:100%;display:flex">
			<%if(request.getAttribute("bdata")!=null){ 
				pdata=(HashMap<String,String>)request.getAttribute("bdata");
				if(!pdata.isEmpty()){
			%>    	
    		<div style="width:40%;padding:10px 20px;display: flex;align-items: center;">
    			<div style="position:relative;width:100%">
		    		 <img class="thumbnail" style="width:100%" src="<%=pdata.get("thumbnail") %>" />    			
		    		 <div style="width:100%;display:flex;justify-content:center;margin: 10px 0;">
		    		 	<% if(String.valueOf(pdata.get("qty")).equals("0")){ %>
			    		 	<button style="cursor:pointer" class="purchase" onclick="notifier()">Notify me</button>			    		 			    		 			    		 	
		    		 	<% }else{ %>
			    		 	<button onclick="showsummary()" style="cursor:pointer" class="purchase" <% if(String.valueOf(pdata.get("qty")).equals("0")){ %> disabled<% } %> >Buy Now</button>		    		 	
		    		 	<% } %>
		    		 </div>
    			</div>
    		</div>
    		<form style="display:none" method="POST" action="/addbreedcart">
    			<input type="text" name="color" />    		
    			<input type="text" name="breed" value=<%=request.getParameter("bid") %> />    		
    		</form>
    		<div style="width:60%;padding:20px;overflow:auto">
    			<div style="max-width: 85%;line-height:40px;padding-top: 10px;padding-bottom: 10px;">
	    			<h2 style="text-transform:capitalize;line-height:35px;margin:5px 0;font-size:28px;font-weight:100"><%=pdata.get("breed") %></h2>
	    			<% if(String.valueOf(pdata.get("qty")).equals("0")){ %>
		    			<p style="margin:0;font-size:17px;color:red">This breed is out of stock</p>
	    			<% }else if(Integer.valueOf(String.valueOf(pdata.get("qty")))<21){ %>
		    			<p style="margin:0;font-size:17px;color:red">Hurry ! only <%=pdata.get("qty") %> items are left </p>	    			
	    			<% } %>
	    			<p style="margin:0;font-size:22px;color:green;font-weight:600"><%=pdata.get("price") %> &#8377</p>
    			</div>
    			<% if(!String.valueOf(pdata.get("qty")).equals("0")){ %>    			
    			<div style="overflow:auto">
    				<p style="font-size: 17px;font-weight: 600;margin: 10px 0;">Quantity</p>
    				<input oninput="checkquantity(event)" style="border: 1px solid;outline:none;width: 50px;border-radius: 0.2em;padding: 5px;margin:8px 0" type="number" value="1" />
    			</div>
    			<% } %>
   				<% ArrayList<String> highlights=(ArrayList<String>)request.getAttribute("highlights"); 
   				if(!highlights.isEmpty()){%>    			
    			<div style="overflow:auto;width:50%">
    				<p  style="font-size: 17px;font-weight: 600;">Highlights</p>
    				<ul style="padding-left: 20px;line-height: 30px">
    				<% for(String i:highlights){ %>    					
    					<li><%=i%></li>
    				<% } %>    					
    				</ul>
    			</div>
    			<% } %>
    			<% ArrayList<String[]> color=(ArrayList<String[]>)request.getAttribute("colors"); 
    				if(!color.isEmpty()){
    			%>
    			<div style="margin-top:10px;margin-bottom:10px">
    				<p  style="font-size: 17px;font-weight: 600;">Color</p>
    				<div class="fbuttongroup">
	    				<% for(String[] i:color){ %>    					
	    					<img onclick="selectcolor(event.target)" onmouseover="changethumbnail(event)" onmouseout="restorethumbnail()" class="colorthmg" name="<%=i[0] %>" src="<%=i[1] %>" />
	    				<% } %>    					
					</div>    				
    			</div>    			
    			<% } %>    			    			    			
    		</div>
    <% } } %>    		
    	</div>				
</div>
<div class="toaster2" style="position:fixed;bottom:-50px;width:100%;padding:10px;box-sizing:border-box;display:flex;justify-content:center;transition:0.5s ease-in-out">
	<div style="border-radius:0.2em;background-color:black;padding:10px;box-sizing:border-box;color:white"><small>Required quantity is not available in stock</small></div>
</div>
<script src="javascript/navbar.js"></script>
<script>
var thumbbuffer=null
var quantity=<%=pdata.get("qty")%>

function showsummary(){
	document.getElementsByClassName("popupback")[0].style.display="flex"
}
function changethumbnail(e){
	let ele=document.getElementsByClassName("thumbnail")[0]
	thumbbuffer=ele.src;
	ele.src=event.target.src;	
}
function selectcolor(ele){
	let elements=document.getElementsByClassName("fbuttongroup")[0].children
	for(let i=0;i<elements.length;i++){
		elements[i].style.border="1px solid #cccccc"
	}
	ele.style.border="2px solid blue"
	document.getElementsByTagName("form")[0][0]=ele.name
}
function checkquantity(e){
	if(event.target.value!=""){
		if(event.target.value<=0){
			event.target.value=1
		}else if(parseInt(quantity)<parseInt(event.target.value)){
			document.getElementsByClassName("toaster2")[1].style.bottom="30px"				
			setTimeout(()=>{document.getElementsByClassName("toaster2")[1].style.bottom="-50px"},3000)		
			event.target.value=1		
		}
	}
}
function setsummary(){
	let pdata=document.getElementById("pricedata").children
	let price=parseInt(<%=pdata.get("price") %>)
	let gst=0.18*price
	let delivery=50
	let total=price+gst+delivery
	pdata[0].children[1].innerText=price+pdata[0].children[1].innerText
	pdata[1].children[1].innerText=gst+pdata[1].children[1].innerText
	pdata[2].children[1].innerText=50+pdata[2].children[1].innerText
	pdata[3].children[1].innerText=total+pdata[3].children[1].innerText	
	
}
function restorethumbnail(e){
	let ele=document.getElementsByClassName("thumbnail")[0]
	ele.src=thumbbuffer;	
}
</script>
</body>
</html>