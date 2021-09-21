<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	font-family: sans-serif;
}
html,body{
	width: 100%;
	height: 100%;
	margin: 0;            
}
nav{
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 15px;
    background-color: #417690;
    color: white;
    overflow-y: auto;
    position: fixed;
    top: 0;
    width: 100%;
    box-sizing: border-box;
}
ul{
	list-style:none;display:flex
}
ul li{
	padding: 0 5px;text-transform:capitalize
}
a{
	text-decoration:none;color:black
}
ul a{
	color:white;
}
</style>
<meta charset="ISO-8859-1">
<title>Pet peaker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
</head>
<body style="padding-top:70px;box-sizing:border-box">
<nav>
<div>
	<h2 style="text-transform:capitalize">Pet peaker dashboard</h2>
</div>
<div>
	<ul>
		<li>Welcome <%=((HashMap)request.getSession().getAttribute("staffdata")).get("firstname") %></li>
		<li><a href="/">View Site</a></li>
		<li><a href="/logout">Logout</a></li>		
	</ul>
</div>
</nav>
<div style="margin:20px;margin-top:40px;width:50%">
	<p style="font-size:20px">Site administration</p>
	<% HashMap<String,ArrayList<String[]>> data=(HashMap<String,ArrayList<String[]>>)request.getAttribute("data"); %>
	<% for(String i:data.keySet()){ %>
		<% ArrayList<String[]> d=data.get(i); %>
		<div style="width:100%;margin:20px 0">
			<div style="overflow:auto;width:100%;color:white;background-color:#417690;padding:0 20px;box-sizing:border-box">
				<h3 style="text-transform:capitalize;margin:10px 0;font-weight:100"><%=Character.toString(i.charAt(0)).toUpperCase().concat(i.substring(1)) %></h3>
			</div>	
			<div style="padding-left:15px;font-size:15px">
				<% for(String[] j:d){ %>			
				<div style="overflow:auto;border-bottom:1px solid #dcdcdc">
					<p><a href="<%=j[1]%>"><%=Character.toString(j[0].charAt(0)).toUpperCase().concat(j[0].substring(1)) %></a></p>
				</div>
				<% } %>
			</div>
		</div>	
	<% } %>	
</div>
</body>
</html>