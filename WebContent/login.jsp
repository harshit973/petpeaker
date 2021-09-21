<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/login.css">
		<link rel="stylesheet" href="css/splashscreen.css" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <title>Pet Peaker</title>
    </head>
    <body onload="initfirebase()">
        <div class="loginbox">
            <div class="loginbox-container">
            <img src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/avatar.png?alt=media&token=041bbb3f-5047-4b88-a2bd-a656348b2117" alt="" />
            <h2>Login</h2>
            <form onsubmit="return validator()" action="/login" method="POST">
                <div class="username">
                <label>Username</label>
                <input name="email" type="text" placeholder="Enter your email" />
                <% if(request.getMethod().equals("POST") && ((HashMap)request.getAttribute("user")).get("user")==null){ %>
                <span style="color: red;font-size: 10pt">Email does not exists</span>
                <% } %>                
                </div>
                <div class="password">
                <label>Password</label>
                <input name="password" type="password" placeholder="Enter your password" />                
                <% if(request.getMethod().equals("POST") && ((HashMap)request.getAttribute("user")).get("user")!=null && ((HashMap)request.getAttribute("user")).get("user").equals(false)){ %>
                <span style="color: red;font-size: 10pt">Invalid password</span>
                <% } %>
                </div>
                <div>
                    <button type="submit">Login</button>
					<div style="text-align: right;margin-top: 15px;margin-bottom: 15px;font-size: 14px;color: blue;">
					<a href="/register" style="margin: 0;text-decoration:none;color:white">Register yourself</a>
					</div>                    
                </div>
            </form>
                <div >
                	<div style="text-align:center;margin:15px"><small>Or continue with</small></div>
                	<div style="display:flex;justify-content:space-around">
	                	<img onclick="sossignin(0)" style="width:40px;cursor:pointer" src="https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/googlelogo.png?alt=media&token=33a26d45-f354-44c8-a7d3-24ead302e67e" />
	                	<img onclick="sossignin(1)" style="width:40px;cursor:pointer" src="https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/facebooklogo.png?alt=media&token=785a0901-5260-4fc4-b55b-70639da5361f" />
	                	<img style="width:40px;cursor:pointer" src="https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/microsoftlogo.png?alt=media&token=05c7cf3e-7aae-421c-90ea-aef699136669" />                	                	
                	</div>
                </div>            
            </div>
        </div>        
    <script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-auth.js"></script>    
    <script>
        function closemessagebox(){
            document.getElementById("spinner").remove()
        }    
        function initfirebase(){
	            let firebaseConfig = {
	                apiKey: "AIzaSyD6H_2oF2Vc6ZHP2iUOUWK1ABP7MZDcMgA",
	                authDomain: "petpeaker-4a4fa.firebaseapp.com",
	                projectId: "petpeaker-4a4fa",
	                storageBucket: "petpeaker-4a4fa.appspot.com",
	                messagingSenderId: "222110159365",
	                appId: "1:222110159365:web:b20d7206a78f6f5336826c",
	                measurementId: "G-G8NCMCVNJH"
	            };
	            firebase.initializeApp(firebaseConfig);
        }
        function petpeakerlogin(email){
        	try{
        		document.getElementsByTagName("body")[0].innerHTML+=`<div id="spinner"><div class="lds-hourglass"></div></div>`
				let xhr = new XMLHttpRequest();
				xhr.open("GET","/sossignin?email="+email+"", true);
				xhr.onreadystatechange = function (){
				    if (this.readyState == 4 && this.status == 200) {				    
			            document.getElementById("spinner").innerHTML="";	        				    	
			            if(this.responseText=="1"){
			            	window.location.href="/"
			            }else{
			            	document.getElementById("spinner").innerHTML=`
			<div style="background-color: white;padding: 10px;margin: 5px;max-width: 300px;line-height: 27px;position: relative;text-align: center;border-radius: 5px;">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="70" height="70" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="black"><path d="M48.16,13.76c-18.95899,0 -34.4,15.44101 -34.4,34.4v75.68c0,18.95899 15.44101,34.4 34.4,34.4h75.68c18.95899,0 34.4,-15.44101 34.4,-34.4v-75.68c0,-18.95899 -15.44101,-34.4 -34.4,-34.4zM44.72,55.04h82.56c0.6192,0 1.2032,0.06987 1.7536,0.24187l-33.81547,33.78188c-5.0912,5.0912 -13.37865,5.0912 -18.46985,0l-33.78188,-33.78188c0.5504,-0.172 1.1344,-0.24187 1.7536,-0.24187zM38.08187,60.1664l25.86719,25.8336l-25.86719,25.8336c-0.172,-0.5504 -0.24187,-1.1344 -0.24187,-1.7536v-48.16c0,-0.6192 0.06987,-1.2032 0.24187,-1.7536zM133.91813,60.1664c0.172,0.5504 0.24187,1.1344 0.24187,1.7536v48.16c0,0.6192 -0.06988,1.2032 -0.24187,1.7536l-25.90078,-25.8336zM68.8,90.85094l3.06375,3.09735c3.8872,3.8872 9.01145,5.81172 14.10265,5.81172c5.1256,0 10.21546,-1.92452 14.10266,-5.81172l3.09734,-3.09735l25.86719,25.86719c-0.5504,0.172 -1.1344,0.24187 -1.7536,0.24187h-82.56c-0.6192,0 -1.2032,-0.06988 -1.7536,-0.24187z"></path></g></g></svg>        
                <p>Unable to authenticate user. Email address is not registered with petpeaker</p>
                <p onclick="closemessagebox()" style="position: absolute;top: 0;right: 0;margin:5px;cursor: pointer;">X</p>
            </div>`
			            }
				    }
				};				
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.send();            
	        }catch(err){
	            document.getElementById("spinner").remove();	        
	    		alert("Unable to connect to server.Check your internet and try again");	            	        
	        }
        
        }
        function facebook_signin(){
			let provider = new firebase.auth.FacebookAuthProvider();			
			firebase.auth().signInWithPopup(provider).then((result) => {
			    let email = result.user.email;
			    if(result.user.emailVerified){
					petpeakerlogin(email);			    
			    }else{
			    	alert("Unverified emails are not alowed for sign in");
			    }
			  })
			  .catch((error) => {
			    var errorMessage = error.message;
			    alert(errorMessage)			    
			  });		
  }                
        function google_signin(){
       		let provider = new firebase.auth.GoogleAuthProvider();
			firebase.auth().signInWithPopup(provider).then((result) => {
			    let email = result.user.email;
			    if(result.user.emailVerified){
					petpeakerlogin(email);			    
				}else{
			    	alert("Unverified emails are not alowed for sign in");
			    }			    
			  }).catch((error) => {
				  if(error.code!="auth/popup-closed-by-user"){
					    var errorMessage = error.message;
					    alert(errorMessage)					  
				  }
			  });        
		}        
        function sossignin(option){
        	if(option=="0"){
				google_signin();
        	}else if(option=="1"){
				facebook_signin();        	
        	}else if(option=="2"){
        	
        	}
        }
        function validator(){
        	let e1=document.getElementsByTagName("input")[0];
        	let e2=document.getElementsByTagName("input")[1];        	
        	if(e1.value=="" || e2.value=="" ){
        	if(e1.value==""){
        		document.getElementsByClassName("username")[0].innerHTML+="<span style='color: red;font-size: 10pt'>This field is required</span>"
        	}
        	if(e2.value==""){
        		document.getElementsByClassName("password")[0].innerHTML+="<span style='color: red;font-size: 10pt'>This field is required</span>"
        	} 
        		return false;        	
        	}
        }        
    </script>	        
    </body>
</html>
