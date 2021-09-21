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
form p{
    width: 15%;
    display: inline-block;
    margin: 0;
}
input,select{
	margin:0 10%;
	width:25%;
	padding:5px;
	border:1px solid #c5c5c5;
	border-radius:0.3em;	
}
form .submit{
	padding:10px 30px;overflow:auto;background:#f7f7f7;border-radius:0.3em
}
button{
	background-color:#4378a9;
	padding:10px;
	color:white;
	border:0;
	cursor:pointer;
	border-radius:0.2em;
	float:right
}
form div{
	margin:30px 0
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
<% ArrayList<HashMap> data=(ArrayList<HashMap>)request.getAttribute("data"); %>
<div style="margin:20px 30px">
	<div style="overflow:auto;">
		<p style="font-size:20px">Change <%=request.getAttribute("modal") %></p>
	</div>
	<div style="overflow:auto;">
	<form method="POST" onsubmit="return validate()" action="">
		<input required="true"  name="eid" type="hidden" value="<%=request.getParameter("eid") %>" />
		<% for(HashMap i:data){ %>
		<div>
			<p><%=i.get("key") %></p>
			<% if(i.get("mode").toString().equals("0")){ %>
				<input required=<%=(i.containsKey("null"))?"false":"true" %> autocomplete="off" name="<%=i.get("name") %>" value="<%=i.get("value") %>" type="<%=i.get("type") %>" />			
			<% }else if(i.get("mode").toString().equals("1")){ %>
				<select name="<%=i.get("name") %>">
					<% for(String[] j:(ArrayList<String[]>)i.get("options")){ %>						
						<% if(j[2]=="1"){ %>
							<option selected value="<%=j[0]%>"><%=j[1] %></option>
						<% }else{ %>
							<option value="<%=j[0]%>"><%=j[1] %></option>						
						<% } %>
					<% } %>
				</select>
			<% } %>
		</div>
		<% } %>
		<div class="submit">
			<button type="submit">Save Changes</button>
		</div>
	</form>
	</div>
</div>
<script>
function validate(){
	let f=document.getElementsByTagName("form")[0]
	f.action=location.href
	let validated=true
	for(let i=0;i<f.length;i++){
		if(f[i].getAttribute("required")=="true" && f[i].value==""){
			f[i].parentElement.children[1].style.display="block"
			validated=false
		}
	}
	return validated
}
</script>
</body>
</html>