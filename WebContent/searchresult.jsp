<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="width=device-width, initial-scale=1.0">
<style>
*{
	font-family:sans-serif;
}
body{
	overflow:auto;
	padding-top:70px;
}
html,body{
	height:100%;
	margin:0;
}
</style>
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/splashscreen.css" />
<title>Pet Peaker</title>
</head>
<body>
<% HashMap h3=(HashMap)request.getSession().getAttribute("services"); %>
<nav>
	<div class="wrapper">
	    <div style="width:15%" class="brand">
	        <h1>Pet Peaker</h1>
	    </div>
		<div style="width:40%;position:relative">
			<form method="GET" action="/search">
				<input autocomplete="off" name="q" placeholder="Search for pet products and more" style="width:100%;box-sizing:border-box;padding:8px;font-size:15px;border-radius:5px;outline:none;padding-right:25px;border:0"  />
			</form>
			<img style="position:absolute;top: 2px;right: 2px;width: 25px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABmJLR0QA/wD/AP+gvaeTAAAE80lEQVR4nO2aa2gcVRTHf9sktc3G2hZimhqrFOzDYv3QVPwSrQ2i4gMrKljBt1gpVWy/KIgv/FCfX4JSxAciWqwIQRHSCm01iC0FrZpaUVtBrWJs08TEPKxJ/HB2mDOzM7uzM3PvRjI/GLi7c/b+z71775177hnIyMjIyMjIyMiYnuQs6dQAzUADUA/0AycLV1Ux1QENwNVAO3AxsAQ4LcDuONAD7AW6gP2G/LHGCuANYAiYjHF9BzwE5G07npSFwHZgnPDGDQE/A0eAP4BTJWx7gfuBGTYbEZc7gAGKG3EEeBa4ClgQ8Ls64HzgbmAHMBJQx+fAYrPux6cOeI1ip3cBa6l8fTkD2Az85qvvJNKJU4rZwEcU/+NXplB3Hhk5eor8A9yaQt2pUAt8iLfxO4A5Keu0AceUxr/AupQ1YvES3sY/h7nH6SLgsNIaAVYZ0orEjXgb/4IFzWbgqNL8kfRHWyTmI48nx5FOov3zFwKPI4tjD3AIuKRC7eXAoNLuqPD3qaCH/i9Ih5RiNdCNd8Q418sx9O/Eux6sjFFHbM4CRpUDN5WwzQFPUrwpOo50yHbiPdtzwB68C681tirhfSXscsCbynYCeAeJB9JYKFtV3eNY2iTVAL8q4RtK2D6l7P5EgqG0+VhpPGag/iLalGAvsgMMYjUyN53GLzXkzy3Kn28MaXh4Qgm+UsJut7K7wqA/eWAMd4o1GdQCYCduw9aH2KxQNp2mHcL7dEm0O4wSbi5T5S9DbOpxF6atSRyKyBeqnGiq1Za5XwO0FMoTSMATxAHgUiRosXGq84Mqn5ukonId0IA7SgaRBobRncSRCulT5UTb4nJTYJYqjyYRSplhVZ6dpKJyHfC3KteXsJsJbAFuTuJMBegzw+FQqxSYgQx7Z4GbFWLn7NMnSDgnI/IgKQVG5UbABPCTsj0vxO5owbYfOR80jV75wxbmSER5DB5W5dYQm08Qp5ZhJ9mh/egxLbYZd7i9ZVosAvNwt9yngNNNC67E7YB+Eq66KXAPrj97bYkeUqK32xINYZ/yZaMt0S1K9Fuql7FpV378Bcy1JTwH2X054htsCStqgYPKhxdtO/CIEu9Djqxt8rDSHwAaLeszE8neOk58RnDK2wRteDNFD1jSLeIi3MOISeBdJGI0yXLghNLcQ5WzxpuUM5PAe5gbCauQVLqjdQw309yO96zCKs/j7YT9pB8D3IYEY1qnF0mpdxQ+jwHXp6wbiRySwdXODSBzs9wZQznOQY7VdN162vk7ZQy4LqFmbDb6nHPS5BuQfH8lXABsC6jvIHL+v833vb8TrknWlPi0IgGJ36lh4AMkdF2DvEaTR0bPPGT+rkNG0lcBvx9HnvXO1rvDd78T+Fp9HqWKL1LUIbtFnTxNcu3Gmwa/y3f//YLmmXg7fwSzR/JlySPT4gCVN3oIeBtJo/l52merT56aKH6H4PJ0mxWPxcC9wOtIAPM77utzfUievwt4BnmnsFSUOR/vcPcvfM14N2nDmEnLVZVGijvhWnW/CQnUdCesteyjcRqRfGDY6t+CjCz9yLzMso/GWUDpOb8I7ys1g9g5qLVK0JzXw/1RvIvmlHvPMA0WAt/jHe5rgPuQE2rn+y6S706nLC1InlCPBN34XVT/DNM4/oXPuT7lf/jWeVzORmIQp/HdSGJ3WuFEka8yjf75jIyE/Af2RepNjgIBZwAAAABJRU5ErkJggg=="/>			
		</div>	    
	    <ul style="width:40%;padding:0;display:flex;justify-content:flex-end" class="nav-links">
	    	<li>
	    		<a href="#">Services</a>
			    <% if(!h3.isEmpty()){  %>	    		
		    		<ul class="drop-menu">
					<% for(int i=0;i<h3.size();i++){ %>                		    		
		    			<li><a href="/pricing?sid=<%=h3.keySet().toArray()[i] %>"><%= ((String[])h3.get(h3.keySet().toArray()[i]))[0] %></a></li>
		    		<% } %>
		    		</ul>		    		
		    	<% } %>
	    	</li>
	    	<li><a href="/services">Plans/Offers</a></li>	    	
	    	<li><a href="/shop">Shop</a></li>	    		    	
			<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("0")) { %>         	    
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
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ){ %>        
	    	<li><a href="/account">Account</a></li>	    	
	    	<li><a href="/mycart">My Cart</a></li>	    		    			
	    	<li><a href="/logout">Logout</a></li>	    		    				    	
		<% }else{ %>	    	
	    	<li><a href="/login">Login</a></li>	    		    				    			
		<% } %>
	    </ul>
	</div>
</nav>
<% HashMap<String,ArrayList<String>> searchdata=(HashMap<String,ArrayList<String>>)request.getAttribute("searchdata"); %>	
<% if(searchdata.isEmpty()){ %>
<div style="width: 100%;height: 100%;display: flex;align-items: center;justify-content: center;">
	<div style="text-align:center">
		<img src="data:image/png;base64,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"/>		
		<h1>Sorry, no results found</h1>
		<h3 style="color:#0000007a">Please check the spelling or try searching for something else</h3>
	</div>
</div>
<% }else{ %>
<div style="height: 100%;overflow:auto">
<% for(String i:searchdata.keySet()){ %>
<div style="display:flex">
	<div style="width:15%">
		<img style="width:100%" src="<%=searchdata.get(i).get(0) %>" />
	</div>
	<div style="position:relative;width:80%">
		<div style="max-width:55%;line-height:30px;overflow:auto;padding:5px 0">
			<h3 style="margin:0;font-weight:100"><%=searchdata.get(i).get(1) %></h3>
		</div>
		<div style="padding:5px 0;overflow:auto;line-height:30px">
			<p style="margin:0"><%=searchdata.get(i).get(2) %></p>
			<div>
				<p style="margin:0"><%=searchdata.get(i).get(4) %></p>			
			</div>
		</div>
	</div>
</div>
<% } %>
</div>
<% } %>
</body>
</html>