<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Pet peaker</title>
<link rel="stylesheet" href="css/splashscreen.css" />
<style>
        *{
            font-family: sans-serif;
        }
        html{
            height: 100%;
        }
        body{
            width: 100%;height: 100%;position: relative;margin: 0; background: linear-gradient(to top, #009fff, #ec2f4b);
            display: flex;justify-content: center;align-items: center;
        }    
        .message{
			padding: 10px;background-color: rgba(0, 0, 0, 0.603);color: white;border-radius: 10px;max-width: 350px;text-align: center;line-height: 26px;margin: 7px;        
        }
        .message img{
        	margin:auto;
        	max-width:65px;
        	border-radius:50%;
        }
		.lds-hourglass {
		  display: inline-block;
		  position: relative;
		  width: 80px;
		  height: 80px;
		}
		.lds-hourglass:after {
		  content: " ";
		  display: block;
		  border-radius: 50%;
		  width: 0;
		  height: 0;
		  margin: 8px;
		  box-sizing: border-box;
		  border: 32px solid #fff;
		  border-color: #fff transparent #fff transparent;
		  animation: lds-hourglass 1.2s infinite;
		}
		@keyframes lds-hourglass {
		  0% {
		    transform: rotate(0);
		    animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
		  }
		  50% {
		    transform: rotate(900deg);
		    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
		  }
		  100% {
		    transform: rotate(1800deg);
		  }
		}
        
</style>
</head>
<body onload="initfirebase()">
    <div id="popup" style="position: fixed;top: 0;width: 100%;height: 100%;background-color: #000000a1;display: flex;justify-content: center;align-items: center;z-index: 1;">
	    <div style="padding: 10px;margin: 5px;max-width: 300px;text-align: center;">
			<div class="lds-hourglass"></div>	    
	    </div>
    </div>
    <div class="message">
        <img src="https://firebasestorage.googleapis.com/v0/b/petpeaker.appspot.com/o/service-05-300x300.jpg?alt=media&token=7533db50-06af-4c0d-83b6-daf9c7d2504b"  alt="" />
        <h2>Pet Peaker</h2>
        <p id="message" style="margin: 10px;"></p>
    </div>    
    <script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-auth.js"></script>    
    <script>
    	var errormessage="Your verification link is expired or invalid.check your verification link and try again";
    	var successmessage=`You are successfully registered with pet peaker.you can click <a href="/login">here</a> to login`;
        function initfirebase(){
        	try{
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
	            if(firebase.auth().isSignInWithEmailLink(window.location.href)){
					var xhr = new XMLHttpRequest();
					xhr.open("POST","/verifyinfo", true);
					xhr.onreadystatechange =function (){
					    if (this.readyState == 4 && this.status == 200) {
				            document.getElementById("popup").remove();					    
					    	if(this.responseText=="0"){
					    		document.getElementById("message").innerHTML=errormessage;
					    	}else{
					    		document.getElementById("message").innerHTML=successmessage;					    	
					    	}
					    }else{
						    if(this.status != 200){
					            document.getElementById("popup").remove();
					    		document.getElementById("message").innerHTML=errormessage;	            					    
				    		}
					    }
					};				
					xhr.setRequestHeader('Content-Type', 'application/json');
					xhr.send();            
	            }else{
		            document.getElementById("popup").remove();
		    		document.getElementById("message").innerHTML=errormessage;	            
	            }            
	        }catch(err){
	            document.getElementById("popup").remove();	        
	    		document.getElementById("message").innerHTML="Unable to connect to server.Check your internet and try again";	            	        
	        }
        }
    </script>	
</body>
</html>