<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/splashscreen.css" />
<link rel="stylesheet" href="css/index.css" />
<title>Pet Peaker</title>
</head>
<body  onload="loadservice()">
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
			<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1") ) { %>         	    
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
<% HashMap<String,String[]> h=(HashMap<String,String[]>)request.getSession().getAttribute("services"); %>
<div class="background">

</div> 
<div class="content">
<div style="max-width: 580px;margin: auto;">
    <h1 style="padding: 10px;">Best pet care services in chandigarh</h1>
</div>
</div>
<div style="text-align:center;margin:40px 15px">
<h1>Our services</h1>
<div class="cblock-container">
</div>
</div>
    <div style="margin-top: 70px;margin-bottom: 70px;background-color: black;color: white;text-align: center;overflow-y: auto;padding-top: 25px;padding-bottom: 25px;">
        <h1 style="margin-top: 20px;margin-bottom: 20px;">How it works</h1>
        <div style="display: flex;justify-content: space-around;align-items: baseline;flex-wrap: wrap;">
            <div style="margin: 10px;">
                <div style="background-color: green;border-radius: 50%;color: white;padding: 15px;width: 70px;font-size: 40px;margin: auto;">
                    <p>1</p>
                </div>
                <p style="font-size: 22px;">Register to our website</p>
                <div style="margin: auto;margin-top: 15px;margin-bottom: 15px;line-height: 30px;max-width: 200px;">
                    <p>You have to register on our website so that you will be eligible for further processes</p>
                </div>
            </div>
            <div style="margin: 10px;">
                <div style="background-color: green;border-radius: 50%;color: white;padding: 15px;width: 70px;font-size: 40px;margin: auto;">
                    <p>2</p>
                </div>
                <p style="font-size: 22px;">Select your service/product</p>
                <div style="margin: auto;margin-top: 15px;margin-bottom: 15px;line-height: 30px;max-width: 170px;">
                    <p>You can book any service or products with us</p>
                </div>                
            </div>
            <div style="margin: 10px;">
                <div style="background-color: green;border-radius: 50%;color: white;padding: 15px;width: 70px;font-size: 40px;margin: auto;">
                    <p>3</p>
                </div>
                <p style="font-size: 22px;">Meet our executive</p>
                <div style="margin: auto;margin-top: 15px;margin-bottom: 15px;line-height: 30px;max-width: 210px;">
                    <p>Our executive or delivery partner will be at your doorstep and pick up your pet for providing it care and support </p>
                </div>
            </div>

        </div>
    </div>
<img style="display: none;" src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/dog2.jpg?alt=media&token=81341c42-6b72-4962-afa9-822162809182" alt="" srcset="">
<img style="display: none;" src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/dog3.jpg?alt=media&token=7425edcc-ebaa-41df-bb57-f90b47f75b3d" alt="" srcset="">
<img style="display: none;" src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/dog4.jpg?alt=media&token=bccf3d24-aa91-46dc-a51f-fc3380cef4de" alt="" srcset="">    
<div style="margin:10px;margin-top: 70px;margin-bottom: 70px;display: flex;justify-content: space-around;flex-wrap: wrap;">
    <div style="text-align: justify;line-height: 35px;width: 400px;">
        <div style="text-align:center;">
            <h2>About Us</h2>        
        </div>
        <p>Pet Peaker Provides pet care and many pet-related services to the customer. we connect pets to pet lovers because we provide a pet lover, not a cage. our executives are always available to serve you. Your Pets is secured with us because we have a community of pet lover. we always want to maintain efficiency for our customers. You can connect with us very easily by login/signup. Then, You can get a proper service with us. Thank you.</p>
    </div>
    <div style="background-image: url('https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/about.jpg?alt=media&token=ce9c8bcb-e219-4770-b932-47376c7681fe');background-size: cover;background-position-x: center;width: 275px;min-height: 275px;border-radius: 0.3em;box-shadow: 0 1px 10px 0px black;margin: 20px;">
    
    </div>
</div>    
<div class="footer">
<div style="margin-top: 20px;margin-bottom: 20px;">
<h2>Follow Us </h2>
<div style="margin-top: 15px;margin-bottom: 15px;line-height: 24px;font-size: 15px;">
<p>Twitter</p>
<p><a target="__blank" style="color:white;text-decoration:none" href="https://www.facebook.com/petpeakerindia/">Facebook</a></p>
<p>Instagram</p>
<p>Youtube</p>
</div>
</div>
<div style="margin-top: 20px;margin-bottom: 20px;">
<h2>Contact Us</h2>
<div style="margin-top: 15px;margin-bottom: 15px;line-height: 24px;font-size: 15px;">
    <p>+91 7986111378</p>
    <p>harshitahuja2091@gmail.com</p>
    <p>g-185 h.m.t pinjore</p>
</div>    
</div>
<div style="margin-top: 20px;margin-bottom: 20px;">
    <h2>Working Hours</h2>
    <div style="margin-top: 15px;margin-bottom: 15px;line-height: 24px;font-size: 15px;">
        <p>Monday to Sunday</p>
        <p>Opens from 9 AM to 5 PM</p>
    </div>        
</div>
</div>
<script src="javascript/navbar.js"></script>
<script type="text/javascript">
var services=[]

<% for(String i:h.keySet()){ %>
services.push(["<%=i%>","<%=h.get(i)[0] %>","<%=h.get(i)[1] %>","<%=h.get(i)[2] %>"])
<% } %>
var current=0;
var cardwidth=350
let screenwidth=screen.width
let capacity=(((screenwidth-(screenwidth%cardwidth))/cardwidth)>3)?3:(screenwidth-(screenwidth%cardwidth))/cardwidth;
let remaining=services.length%capacity;
let blocks=((services.length-remaining)/capacity);
let coblock=(services.length-remaining)/services.length;		
let k=0	
function addcard(sblock,n){
	for(let j=0;j<n;j++){
		let scard=document.createElement("div")
		let scontent=document.createElement("div")
		let sthumb=document.createElement("div")	
		let head=document.createElement("h1")
		let rmore=document.createElement("button")
		let or=document.createElement("small")
		let book=document.createElement("button")
		let blink=document.createElement("a")
		let proceedouter=document.createElement("div")
		blink.href="/pricing?sid="+services[k][0];
		or.innerText="or"
		or.style.display="block"
		or.style.margin="5px 0px"
		or.style.textAlign="center"
		book.innerText="Book Now"
		book.className="readmore"
		rmore.className="readmore"
		rmore.innerText="Read More"
		blink.appendChild(book)
		proceedouter.className="proceedouter"
		proceedouter.appendChild(blink)		
		head.innerText=services[k][1]
		let body=document.createElement("p")
		body.innerText=services[k][3]			
		let thumb=document.createElement("img")					
		thumb.src=services[k][2]
		scard.className="scard"
		scard.style.width=cardwidth+"px"
		scontent.className="scontent"
		sthumb.className="sthumb"			
		scontent.appendChild(head)
		scontent.appendChild(body)	
		scontent.appendChild(proceedouter)			
		sthumb.appendChild(thumb)
		scard.appendChild(scontent)
		scard.appendChild(sthumb)			
		sblock.appendChild(scard)			
		k++;
	}
	
}
function loadservice(){
	let ele=document.querySelector(".cblock-container")	
	if(blocks>1){
		let nextc=document.createElement("div")
		let prevc=document.createElement("div")
		nextc.className="next-container"
		prevc.className="prev-container"
		nextc.innerHTML='<button onclick="increment(event)"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAEz0lEQVRoge2ZW2wUVRjHf2dmWxIBG4RGS0sUwXZtYgm0aPTJkvBASOWirhcaMUJtYmsMRfQBSJbE+Gq0aYFwSYgYdcM1td5IaInEB9IthBfYRRFLdxuN5aFUdMvufD5QIuzM7O6Z2fBC/4/fOef7fv89Z2fOnANTmtL9LVWMJBEi5vVg4GkwGsWSegwVRKgAZkx2GUdIgsQwjAFRqi9xYfBMmLDlt7YvA/sXHJtnBWgTaFZQqTl8WCkOWulMV8svLw57ZfBkYP/CSLkY0z4SJW8CpV6LT2oC1L4Sldm+/uLaUd3B2gb2Bo+9jtAJPKQ7No9GRWhria/+WmdQwQZ21+8uMccf7gY2aqNpSGBXoqLs3XB/Y7qQ/gUZ2F3f84A5bh0CWeEPr0ApejPTzVBrtOlGvq5Gvg63fvl7CA8grDT/zkTCz/cF8nXNa+DWsrmH8LclrKwaGfssX7ecS2hfzfF1ghwsHpW+FPLKhtiaiHu7iw4Ej8y+KcZFYI5OwUeXVzBr4UzO7YzrDMul0YyYwdZ4019Oja5rLG2ZH6NEC/6x5RU0ftKAETBQSnG2O6YL66TZASMTBtqdGh1nYM/Cw1XKNH9F4yV1J/xtRT+9UKyZSJWIuWB9vCmR3eD4J1am2Y7mG3b+isq74AHq33uSRW8/oZPGTdNukm5zarAZCBM2gHW6Ffq3RLnca/uBaOioZVFrtW46m0SpNyJEzOy4zcC8YN0zQJV2gYzQ/4GLiU3+Z0JB5Vh1SX123GEJGY1ei+Q00VFLXYs/E4Jalh2zGbCgwVeRHCaWbq6lbqN3E4Yi/wwoC98LNp+J2ubHPeW1oCY7Zl9CigpP2bMkGeHUh4P8fmIkOz/Pbn2K2nXztXMq7GxOj9EZDjFPstIWJzcNOJvYVufFxMzsQN7NnF9ZaYtrl8bsDQpmVT/oO7+TgXHfWe/QkvYgi9+xLV3ih4f4ecd53XTXswN2A8KILeZRS9qDLG53gD8yxOnt5xBLtPIJdjaHGZCi7MDc4C8du8rpbfrwAAouZsfsj1FDRbUzZ8kN/vK3CX7aetYT/KRsbPYXmTJOes0O7vC/fZfg1JYokvEMjyV2NpuBxIXBM8BVLwVc4b9P0v9+FMsHPDCUjA/mn4EwYUspvtDN7gr/Q5L+zQN+4RHhoNNRpON7wEpnuoAJnQLpVMYWu/Jjkv4O//BAqhSz26nBtr8G6LkWGXthzmtzgaWFVvhj8BqZlEXlc+UAXDkxQl+H72UDgAg734qvcvywdz93CaS2kZ72Ekh5oYXO77kEQHndLPo2DWClfR8+A4yWGtYOt8acxyp7q4+/ipIvdSsqQ/l5VN4lgZdbYqsPubXn3AttjK/6SmCXdtFiwQudueChgM1cWWyiXRRHi0KkISXqm8Tcso58/fIaCBHKWNPNZhS9xUErSD0zb6RChZxQF7Sdbo023Rh+pGw1qJ3+2XJLhM7hirK1oeHQP4X0177g2FdzNCSoLjSPHAsA+dOCtnxrPlvaHzQbYmsiBCZqlKILSOmOd9C/InSmSgNBXXjwecl3oLqn8ibpNpRqBuZpDh8CPleo7g2xVUmvDEW5Zg0TNqqqFzUIapmhqLegZvLW8v9rVhhWEBcYsMQ4mYwPRotxzTqlKd3v+g8ynsUJO26gFAAAAABJRU5ErkJggg=="/></button>'		
		prevc.innerHTML='<button disabled onclick="decrement(event)"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAEgElEQVRoge2ZTUxcVRiGn3PvAIn9wYC1IrCiZSYuaipVNy6kO9MQaI1jYxtrQglGcGG7tMYxMY0bN6VgsaWxaRN1rC0NdmGIlESNWmHqT7XMtNWWDpCoxIQiOjBzPxeg4tx7Z+bcGdiUdzfnO+f7nnfOmXvO3AMrWtGdLVWIJGHC5u2A7xEw6sWSOgwVQKgAVi90mUYYB4liGEOi1IWxK5GLIUJWvrXzMnC8prfa8tEmsFtBpebwuFKcspKpzpZrT8a9MngycHxDeJ0YJa+LkueAYq/FFzQLqqdIpV7ZM7JjUnewtoFjgd5nEDqAMt2xWTQpQltLrOl9nUE5G+iu6y4yp9d3AXu10TQkcGSsovTF0GB9Mpf+ORnoruu7y5y2ToM8kR9ejlKcT60yg63DDTPZuhrZOsx/88sIDyBsM/9IhUOPX/Bl65rVwPyyWUb4fyRsq5qYOpStW8Yl1OM/t0uQU4Wj0pdCnm6Obg+7x110InCmfE6MEeCeQoA81B7ALDH4+s0fdYdOpsQMtMYafnMKuq6xpGUeREnB4De3+//9rGmi3GekQkC7U9BxBo5u+LBKmeZ18t+kbPAA3x29qmsiUSRmzZ5Yw1h6wPFHrEyznSWCB0jNaR+BSuZItjkFbAZChAxgl26FdLnBX37nOpFDI9r5RKlnw4TN9HabgerApkeBKu0Ki+QG/8PJn/jqjcueciqonKotqktvd1hCRr2nCgtyg49+cJMvD36fT2oEtTW9zWbAgi1eC7jBx86M8vmr34J4zTwvQ5F9BpRFrZfkbvDXem/x2YFvECtPesACWwH7ElJU6CZ2g//543E+fflSQeDn0exsTo/R1Q5trnKDv9E/weC+IaxUYeAXtCa9IethLpOUqSjzr3WM/X51qtDwjnIyMJ3rYEkJAy8NcbN/whbb/IKfh/c/kA+bk26nN9gNCHaaDLKSlquJTS0bC2pCsLM5zIBEdRMvlwkFti3c/hg11LCX5MtkwsZm38iUMeA1+1KbsMTOZjMwdiVyEbjlucjSmRgdj0VsM2A73Q0yKI3rdt4LPOa1kljCjf4Jyjau5e6a/z+619eV4ysxGf/iV72cQuf+yec/SW933AesZKoTmNWqYMvhPhPJREo3XaIYs8sp4Ghg/l2l6tGtki4nE5HDI1w6rPegE+Ftp39jkGkn9iUOgNKbZwctNuEFHpgsNqzX3IIZX6scqz23EyXv6lZ0LGQoT4c6gadaok2n3eIZz0J7Y43vCRzRruoE4gVe6MgEDzkc5kqjs+2iOKtdPU8pUR+N3V+6L1u/rAaCBFPWKnM3ivOFQctJfWtmEsFc3lDndJxuHW6Yid9X2gTqrfzZMkuEjnhF6Y5gPPhnLv21Lzh6/GeDguqkQK8cF4H8YkFbtjWfLu0/NM3R7WF8s36l6AQSuuMd9JcIHYliX0AXHvK85DtR21c5R7INpXYD1ZrDR4GTCtXVHG0c98pQkGvWECGjqvbBLYLaaijqLPAv3Fr+d80KcQUxgSFLjIHxWGS4ENesK1rRna6/AfBPxFyraaOYAAAAAElFTkSuQmCC"/></button>'				
		ele.appendChild(nextc)		
		ele.appendChild(prevc)				
	}
	for(let i=0;i<=blocks;i++){
		var sblock=document.createElement("div")
		sblock.className="cblock"			
		sblock.style.left=100*i+"%"
		if(i==blocks){
			addcard(sblock,remaining)						
		}else{
			addcard(sblock,capacity)			
		}
		ele.appendChild(sblock)			
	}
}
function increment(e){
	if(current<blocks-1){
		document.getElementsByClassName("cblock")[current].style.left="-100%"		
		current++
		document.getElementsByClassName("cblock")[current].style.left="0%"
		console.log(e.target.parentElement.parentElement.parentElement.children[1].children[0])
		e.target.parentElement.parentElement.parentElement.children[1].children[0].removeAttribute("disabled")
	}else{
		document.getElementsByClassName("cblock")[current].style.left="-100%"		
		current++
		document.getElementsByClassName("cblock")[current].style.left="0%"		
		e.target.parentElement.disabled=true
	}
}
function decrement(e){
	if(current>1){
		document.getElementsByClassName("cblock")[current].style.left=current*100+"%"				
		current--
		document.getElementsByClassName("cblock")[current].style.left="0%"		
		e.target.parentElement.parentElement.parentElement.children[0].children[0].disabled=false
	}else{
		document.getElementsByClassName("cblock")[current].style.left=current*100+"%"				
		current--
		document.getElementsByClassName("cblock")[current].style.left="0%"		
		e.target.parentElement.disabled=true
	}
}
</script>
</body>
</html>