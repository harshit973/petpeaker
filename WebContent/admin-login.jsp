<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
input{
	padding:8px 0;width:100%;box-sizing:border-box;border:1px solid #c3c3c3;border-radius:0.3em
}
input[type="submit"]{
	background-color:#79aec8;
	padding:10px;
	color:white;
	border:0;
	cursor:pointer;
}
.err{
	color:red;display:none;text-align:right
}
</style>
<meta charset="ISO-8859-1">
<title>Pet peaker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">        
</head>
<body>
<div style="width:100%;height:100%;padding:10px;box-sizing:border-box;display:flex;align-items:center;justify-content:center;background-color:#f8f8f8">
	<div style="min-width:400px;border:1px solid #dcdcdc;border-radius:0.2em">
		<div style="width:100%;overflow:auto;background-color:#417690;padding:0 10px;color:white;box-sizing:border-box;text-align:center;text-transform:capitalize">
			<h3 style="font-weight:100">Pet peaker</h3>
		</div>
		<div style="padding:10px;background-color:white">
			<form onsubmit="return validate()">
				<div style="overflow:auto;margin:15px 0;">
					<p style="margin:5px 0;font-size:15px">Email</p>		
					<input name="email" type="email" />
					<div class="err" >
						<small>This field is required</small>
					</div>
				</div>
				<div style="overflow:auto;margin:15px 0;">
					<p style="margin:5px 0;font-size:15px">Password</p>		
					<input name="password" type="password" />
					<div class="err" >
						<small>This field is required</small>
					</div>				
					<div class="err" >
						<small>Invalid password</small>
					</div>									
				</div>
				<div style="overflow:auto;text-align:center">
					<input type="submit" value="Validate" />
				</div>			
			</form>
		</div>
	</div>	
</div>
<script>
function validate(){
	let fdata=document.getElementsByTagName("form")[0]
	let ferrors=document.getElementsByClassName("err")	
	if(fdata[0].value=="" || fdata[1].value==""){
		if(fdata[0].value==""){
			ferrors[0].style.display="block"
		}
		if(fdata[1].value==""){
			ferrors[1].style.display="block"
		}			
	}else{
		let formdata=new FormData(fdata)
		fdata[2].value="Validating....."
		let xhr = new XMLHttpRequest();
		xhr.open("POST","/admin", true);
		xhr.onreadystatechange = function (){
			if (this.readyState == 4 && this.status == 200) {				    				
				fdata[2].value="Validate"				
				let res=JSON.parse(this.responseText)
				console.log(res)
				if(res.code=="100"){
					ferrors[2].style.display="block"					
				}else{
					location.reload()
				}
			}
		}
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");		
		xhr.send("email="+fdata[0].value+"&password="+fdata[1].value);            		
	}
	return false	
}
</script>
</body>
</html>