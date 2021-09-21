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
table{
	border-collapse:collapse
}
table tr:nth-child(odd){background-color: #f2f2f2;}
table td{
	border-bottom:1px solid #cccccc;
	padding:10px ;
	font-size:14px
}
table th{
	padding:15px 10px;
	background-color:#f9f9f9;
	font-size:14px;
	text-transform:capitalize;
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
<% HashMap<String,Object> data=(HashMap<String,Object>)request.getAttribute("data"); 
ArrayList<String[]> vals=(ArrayList<String[]>)data.get("vals");
String[] cols=(String[])data.get("cols");
%>
<div style="margin:20px;margin-top:40px;">
	<% if(data.get("selectable").toString().equals("1")){ %>	
	<div>
		<% if(data.get("url")!=null ){ %>		
			<p style="font-size:20px">Select <%=request.getAttribute("modal") %> to change</p>
		<% }else{ %>
			<p style="font-size:20px">View of <%=request.getAttribute("modal") %> </p>		
		<% } %>
	</div>
	<div style="display:flex;align-items:center;justify-content:space-between">
		<% if(data.get("delete")!=null){ %>			
		<div style="display:flex;align-items:center">
			<p style="margin:10px 5px">Actions</p>
			<div style="margin:10px 5px">
				<select>
					<option>-------</option>
					<option value="1">Delete selected options</option>
				</select>
			</div>	
			<button onclick="if(document.getElementsByTagName('select')[0].value=='1'){submitdelete()}">Go</button>	
		</div>
		<% }else{ %>
		<div></div>
		<% } %>					
		<% if(data.get("url2")!=null ){ %>
			<a style="color:white;text-decoration:none" href="<%=data.get("url2")%>">
				<div style="border-radius: 0.4em;display:flex;align-items:center;background-color:gray;justify-content: space-around;">
					<p style="margin:10px;font-size:15px">Add <%=request.getAttribute("modal") %></p>
					<img style="margin:0 5px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAAN0lEQVRIiWNgGFHgPxSQooeJVo4ZtWDUgiFkASOMQWoGImgwIyMjAwMdfEASGC0qRi0YtWCkAgDXKRQUa9rr/gAAAABJRU5ErkJggg=="/>
				</div>
			</a> 
		<% } %>
	</div>
	<% }else{ %>
		<div>
			<p style="font-size:20px">View of <%=request.getAttribute("modal") %></p>
		</div>	
	<% } %>		
	<div style="width:100%;margin:15px 0">
	<table style="width:100%;text-align:left">
		<thead>
			<tr>
			<% if(data.get("selectable").toString().equals("1") && data.get("delete")!=null){ %>			
				<th><input onclick="selall(event.target)" type="checkbox" /></th>			
			<% } %>
			<% for(String i:cols){ %>
				<th><%=i %></th>
			<% } %>			
			</tr>
		</thead>
		<tbody>
			<% if(data.get("selectable").toString().equals("1")){ %>			
				<% for(String[] i:vals){ %>
				<tr>				
					<% if(data.get("selectable").toString().equals("1") && data.get("delete")!=null){ %>							
						<td><input id="sel" onclick="adddelete(event.target)" name="<%=i[0] %>" type="checkbox" /></td>							
					<% } %>
					<% for(int j=1;j<i.length;j++){ %>
						<td><a href="<%=(i[0]==null || data.get("url")==null)?"":data.get("url")+"?eid="+i[0] %>"><%=(i[j]==null)?"---":i[j] %></a></td>
					<% } %>
				</tr>
				<% } %>
			<% }else{ %>

				<% for(String[] i:vals){ %>
				<tr>				
					<% for(int j=1;j<i.length;j++){ %>
						<td><%=(i[j]==null)?"---":i[j] %></td>
					<% } %>
				</tr>
				<% } %>			
			<% } %>
		</tbody>
	</table>
	</div>
</div>
<form method="POST" >
	<input type="hidden" name="data" />
</form>
<script>
	var data=[]
	function selall(ele){
		let r=document.querySelectorAll("#sel")
		for(let i=0;i<r.length;i++){
			r[i].click()
		}			
	}
	function adddelete(ele){
		if(ele.checked){
			data.push(ele.name)			
		}else{
			delete data.splice(data.indexOf(ele.name),data.indexOf(ele.name)+1)						
		}
	}
	function submitdelete(){
		document.getElementsByTagName("form")[0][0].value=data.join(",")
		document.getElementsByTagName("form")[0].action=location.href
		document.getElementsByTagName("form")[0].submit()
	}
</script>
</body>
</html>