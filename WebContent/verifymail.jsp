<%@page import="java.util.HashMap" import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
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
    </style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="css/splashscreen.css" />    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet peaker</title>
</head>
<%Map<String,String[]> data=(Map<String,String[]>)request.getSession().getAttribute("rdata"); %>
<body onload="initfirebase()">
    <div style="padding: 10px;background-color: rgba(0, 0, 0, 0.603);color: white;border-radius: 10px;max-width: 350px;text-align: center;line-height: 26px;margin: 7px;">
        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="70" height="70" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M48.16,13.76c-18.95899,0 -34.4,15.44101 -34.4,34.4v75.68c0,18.95899 15.44101,34.4 34.4,34.4h75.68c18.95899,0 34.4,-15.44101 34.4,-34.4v-75.68c0,-18.95899 -15.44101,-34.4 -34.4,-34.4zM44.72,55.04h82.56c0.6192,0 1.2032,0.06987 1.7536,0.24187l-33.81547,33.78188c-5.0912,5.0912 -13.37865,5.0912 -18.46985,0l-33.78188,-33.78188c0.5504,-0.172 1.1344,-0.24187 1.7536,-0.24187zM38.08187,60.1664l25.86719,25.8336l-25.86719,25.8336c-0.172,-0.5504 -0.24187,-1.1344 -0.24187,-1.7536v-48.16c0,-0.6192 0.06987,-1.2032 0.24187,-1.7536zM133.91813,60.1664c0.172,0.5504 0.24187,1.1344 0.24187,1.7536v48.16c0,0.6192 -0.06988,1.2032 -0.24187,1.7536l-25.90078,-25.8336zM68.8,90.85094l3.06375,3.09735c3.8872,3.8872 9.01145,5.81172 14.10265,5.81172c5.1256,0 10.21546,-1.92452 14.10266,-5.81172l3.09734,-3.09735l25.86719,25.86719c-0.5504,0.172 -1.1344,0.24187 -1.7536,0.24187h-82.56c-0.6192,0 -1.2032,-0.06988 -1.7536,-0.24187z"></path></g></g></svg>        
        <p id="message" style="margin: 10px;">Your registration request has been processed successfuly. A verification link is sent to </p>
    </div>    
    <script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-auth.js"></script>    
    <script>
        let email="<%=data.get("email")[0] %>";
        let returnurl='http://localhost:8080/verifyinfo';
        var actionCodeSettings = {
            url: returnurl,
            handleCodeInApp: true,
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
            document.getElementById("message").innerHTML+=email
            firebase.auth().sendSignInLinkToEmail(email, actionCodeSettings)
            .catch((error) => {
                var errorCode = error.code;
                var errorMessage = error.message;
                alert(errorMessage)
            });        
        }
    </script>
</body>
</html>