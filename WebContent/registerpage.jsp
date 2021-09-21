<%@page import="java.util.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="css/registerpage.css">
		<link rel="stylesheet" href="css/splashscreen.css" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <title>Pet Peaker</title>
    </head>
    <body>
    <% if(String.valueOf(request.getAttribute("exists")).equals("1") ){ %>
        <div id="popup" style="position: fixed;top: 0;width: 100%;height: 100%;background-color: #000000a1;display: flex;justify-content: center;align-items: center;z-index: 1;">
            <div style="background-color: white;padding: 10px;margin: 5px;max-width: 300px;line-height: 27px;position: relative;text-align: center;border-radius: 5px;">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="70" height="70" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="black"><path d="M48.16,13.76c-18.95899,0 -34.4,15.44101 -34.4,34.4v75.68c0,18.95899 15.44101,34.4 34.4,34.4h75.68c18.95899,0 34.4,-15.44101 34.4,-34.4v-75.68c0,-18.95899 -15.44101,-34.4 -34.4,-34.4zM44.72,55.04h82.56c0.6192,0 1.2032,0.06987 1.7536,0.24187l-33.81547,33.78188c-5.0912,5.0912 -13.37865,5.0912 -18.46985,0l-33.78188,-33.78188c0.5504,-0.172 1.1344,-0.24187 1.7536,-0.24187zM38.08187,60.1664l25.86719,25.8336l-25.86719,25.8336c-0.172,-0.5504 -0.24187,-1.1344 -0.24187,-1.7536v-48.16c0,-0.6192 0.06987,-1.2032 0.24187,-1.7536zM133.91813,60.1664c0.172,0.5504 0.24187,1.1344 0.24187,1.7536v48.16c0,0.6192 -0.06988,1.2032 -0.24187,1.7536l-25.90078,-25.8336zM68.8,90.85094l3.06375,3.09735c3.8872,3.8872 9.01145,5.81172 14.10265,5.81172c5.1256,0 10.21546,-1.92452 14.10266,-5.81172l3.09734,-3.09735l25.86719,25.86719c-0.5504,0.172 -1.1344,0.24187 -1.7536,0.24187h-82.56c-0.6192,0 -1.2032,-0.06988 -1.7536,-0.24187z"></path></g></g></svg>        
                <p>Unable to process your registration request as your email address is already registered</p>
                <p onclick="closemessagebox()" style="position: absolute;top: 0;right: 0;margin:5px;cursor: pointer;">X</p>
            </div>
        </div>
        <% } %>
        <div class="loginbox">
            <div class="loginbox-container">
            <img src="https://firebasestorage.googleapis.com/v0/b/petpeaker.appspot.com/o/service-05-300x300.jpg?alt=media&token=7533db50-06af-4c0d-83b6-daf9c7d2504b"  alt="" />
            <h2>Register</h2>
            <form onsubmit="return validator()" id="joinform" action="/register" method="POST">
                <div class="ele">
	                <label>First Name</label>
	                <input name="firstname" type="text" placeholder="Enter your first name" />                
	                <div id="firstname"></div>
                </div>                                            
                <div class="ele">
	                <label>Last Name</label>
	                <input name="lastname" type="text" placeholder="Enter your last name" />                
	                <div id="lastname"></div>	                
                </div>                                                            
                <div class="ele">
	                <label>Address</label>
	                <input name="address" type="text" placeholder="Enter your address" />                
	                <div id="address"></div>	                
                </div>                                                                            
                <div class="ele">
	                <label>Email</label>
	                <input name="email" placeholder="Enter your email" />                
	                <div id="email"></div>	                
                </div>                                                            
                <div class="ele">
	                <label>Gender</label>
	                <select name="gender">
	                <option style="color:black" value="0">Male</option>
	                <option style="color:black" value="1">Female</option>	                
	                </select>
                </div>                                
                <div class="ele">
	                <label>Password</label>
	                <input name="password" type="password" placeholder="Enter your Password" />                
	                <div id="password"></div>	                
                </div>                                                                            
                <div class="ele">
	                <label>Retype Password</label>
	                <input name="rpassword" type="password" placeholder="Retype your Password" />                
	                <div id="rpassword"></div>	                	                
                </div>                                                                                            
                <div>
	                <ul style="padding-left:17px;line-height:25px">
	                	<li><small>Password should be of at least 6 characters</small></li>
	                	<li><small>Password must contain a uppercase alphabet</small></li>	                	
	                	<li><small>Password must contain a special character</small></li>	                		                	
	                </ul>
                </div>
                <div>
                    <button style="cursor:pointer" type="submit">Proceed</button>
                </div>
            </form>
            </div>
        </div>
        <script>
            function closemessagebox(){
                document.getElementById("popup").remove()
            }
		function emailvalidation(mail) {
			if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(mail)){
				return true
			}
			return false
		}        
		function passwordvalidation(inputtxt){ 
			var passw=/^[A-Za-z0-9@!#$%^&*]{6,}$/;
			return passw.test(inputtxt); 
		}		
		function validator(){
	        let e1=document.getElementById("firstname");
	        e1.innerHTML=""
	        let e11=document.getElementById("lastname");	        
	        e11.innerHTML=""	        
	        let e2=document.getElementById("address");
	        e2.innerHTML=""	        	        
	        let e3=document.getElementById("email");
	        e3.innerHTML=""	        
	        let e4=document.getElementById("password");
	        e4.innerHTML=""	        
	        let e5=document.getElementById("rpassword");        
	        e5.innerHTML=""	        
	        let form=document.getElementById("joinform");
	        if(form[0].value=="" || form[1].value=="" || form[2].value=="" || !emailvalidation(form[3].value) || !passwordvalidation(form[5].value) || form[5].value!=form[6].value){
	        	if(form[0].value==""){
	        		e1.innerHTML="<span class='error'>This field is required</span>"        		
	        	}	
	        	if(form[1].value==""){
	        		e11.innerHTML="<span class='error'>This field is required</span>"        		
	        	}		        	
	        	if(form[2].value==""){
	        		e2.innerHTML="<span class='error'>This field is required</span>"        		
	        	}		        		        	
	        	if(form[3].value==""){
	        		e3.innerHTML="<span class='error'>This field is required</span>"        		
	        	}else{
		        	if(!emailvalidation(form[3].value)){
		        		e3.innerHTML="<span class='error'>Invalid Email</span>"        			        		
		        	}	        	
	        	}	
	        	if(form[5].value==""){
	        		e4.innerHTML="<span class='error'>This field is required</span>"        		
	        	}else{
		        	if(!passwordvalidation(form[5].value)){
		        		e4.innerHTML="<span class='error'>Password doesnot match the requirements</span>"        			        		
		        	}	        		        	
	        	}	
	        	if(form[6].value==""){
	        		e5.innerHTML="<span class='error'>This field is required</span>"        		
	        	}else{
	        		if(form[5].value!=form[6].value){
		        		e5.innerHTML="<span class='error'>Passwords doesnot match</span>"        			        			
	        		}
	        	}	        		        		        	
	        	return false;
	        }
        }
        </script>        
    </body>
</html>
