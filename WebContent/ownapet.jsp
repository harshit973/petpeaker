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
<style>
	*{
		font-family: sans-serif;
	}
	html,body{
		height:100%;
	    margin:0		
	}
	ul{
		list-style: none;
	    line-height: 60px;
	    padding: 0;
   	}
   	li {
		display: flex;
	    width: 100%;
	    margin: 30px 0;
	    align-items:flex-start
   	}  
   	ul a{
   		color:black;
   		text-decoration:none;
   	}
   	ul li img{
		width: 60px;
	    border-radius: 50%;
	    object-fit: cover;
	    object-position: center;
   	} 	
   	ul li .head{
   		border-bottom:1px solid #b5b5b5;
   		width: 100%;
   		padding:0 15px;
   		position:relative;
   		box-sizing:border-box
   	}
   	.head img{
	    position: absolute;
	    right: 10px;
	    bottom: 25px;
	    width: 20px;
   	}
   	.subelements{
		line-height: 30px;
	    overflow-y: hidden;
	    height:0  
   	}
   	.subelements p{
   		margin:20px 0;
   		border-bottom:1px solid #c1c1c1;
   	}
	body{
		background-color: #00000024;
	    padding-top: 70px;
	    box-sizing: border-box;
	}
	.pet-list{
		height: 100%;
	    box-sizing: border-box;
	    overflow: auto;
	    padding: 5px 10px;
	    background-color:white;
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
		width:80%;
		background-color:white;
		padding:20px;
		border-radius:10px;
		position:relative
	}
</style>
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
        <a href="/logout">Logout</a>        
        <% } %>
    </div>
</div>

<div class="pet-list">
	<ul>
	</ul>
</div>

<script src="javascript/navbar.js"></script>
<script>
	function getCookie(cname) {
	  var name = cname + "=";
	  var decodedCookie = decodeURIComponent(document.cookie);
	  var ca = decodedCookie.split(';');
	  for(var i = 0; i <ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return null;
	}
	function pet(){
		let parent=document.getElementsByTagName("ul")[0]
		let data=JSON.parse(getCookie("pdata"))
		let k=0;
		for(let i in data){
			let link=document.createElement("a")
			let expand=document.createElement("img")
			let node=document.createElement("li")
			let list=document.createElement("div")			
			let label=document.createElement("div")
			let sub=document.createElement("div")			
			let thumb=document.createElement("img")			
			expand.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAAy0lEQVRIie3TPWoCURSG4QcSELuElLOCWNgGxC3YuYDpXIBFtpAV2MU+nVuIjQtwBRZWYjpBUJw0x4TIhKhzSTUvnGbud17O/RlqalIyRJbAk4XrBzkKLNCqIG+FowjnF3d4j4UPdK+QP2EVjhkeTgMNvEVgi/4F8h420TtB87fgDUYR3GNwhjzHLnpecXvORM84RNNLgtyfk41PJrtmp6WUnW2Vuyqlg3UIp1FFfOtUlR959P2+CyzRTiU/kmEeleKPL+U+qqbmH/kEO341nt7A5z4AAAAASUVORK5CYII="
			label.className="head"
			link.innerText=data[i]["name"]
			thumb.src=data[i]["pic"]
			link.href="/breeds?pid="+i
			for(let j=0;j<data[i]["breeds"].length;j++){
				let node=document.createElement("p")
				node.innerHTML="<a href='breeddescription?bid="+data[i]["breeds"][j]["bid"]+"'>"+data[i]["breeds"][j]["bname"]+"</a>"
				sub.appendChild(node);
			}
			expand.addEventListener("click",function(){expandsub(k)})												
			list.style.width="85%"
			sub.className="subelements"
			list.appendChild(label)
			list.appendChild(sub)						
			label.appendChild(expand)
			label.appendChild(link)
			node.appendChild(thumb)
			node.appendChild(list)	
			parent.appendChild(node)
			k++
		}
	}
	function expandsub(k){
		let ele=event.target
		ele.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAAxUlEQVRIie3TMWoCURCH8R9ECOmUlHuCWNgK4hXS5QDbeQALr5ATpNPezito4wE8gYVVSLpAwKA2I9kVG92n1X4wzfsPH2/eY6ipuTetqJuQYRWVpZa/YI191AadVPIevkK8iNrHWa+q/BU/IZzhCY+Yxtkv3q6V59iGaIJGIXvAR2R/GFwqH2EXgvcEfZVuVpx0rDxpiSpve+6vSjQxj4Zv9C+QH+niMxxLPBfDPII12lfIj7T970t+Gg6l2dAsXDU1iTgA18k1npTLtdEAAAAASUVORK5CYII="				
		ele.addEventListener("click",function(){colapsesub(k)})														
		ele.parentElement.parentElement.children[1].style.height="auto"
	}
	function colapsesub(k){
		let ele=event.target
		ele.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAAy0lEQVRIie3TPWoCURSG4QcSELuElLOCWNgGxC3YuYDpXIBFtpAV2MU+nVuIjQtwBRZWYjpBUJw0x4TIhKhzSTUvnGbud17O/RlqalIyRJbAk4XrBzkKLNCqIG+FowjnF3d4j4UPdK+QP2EVjhkeTgMNvEVgi/4F8h420TtB87fgDUYR3GNwhjzHLnpecXvORM84RNNLgtyfk41PJrtmp6WUnW2Vuyqlg3UIp1FFfOtUlR959P2+CyzRTiU/kmEeleKPL+U+qqbmH/kEO341nt7A5z4AAAAASUVORK5CYII="				
		ele.addEventListener("click",function(){expandsub(k)})														
		ele.parentElement.parentElement.children[1].style.height="0"
	}	
	pet()	
</script>
</body>
</html>