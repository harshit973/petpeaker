<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Peaker</title>
    <link rel="stylesheet" href="css/joinus.css" />
    <link rel="stylesheet" href="css/splashscreen.css" />
    <link rel="stylesheet" href="css/navbar.css" />    
</head>
<body onload="initializer()">
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
			<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1")) { %>         	    
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
    <div id="spinner"><div class="lds-hourglass"></div></div>    
    <div class="sideimg"></div>
    <div class="formouterbox">
        <div class="forminner">
			<img onclick="backhandler()" style="position:absolute;top:0;left:0" src="https://img.icons8.com/fluent/48/000000/back.png"/>            
            <div style="text-align: center;">
                <h2 style="font-size: 30px;">Join us</h2>
            </div>
            <div class="timeline" >
                <div class="step"><small>1</small></div>
                <div class="step"><small>2</small></div>
                <div class="step"><small>3</small></div>
                <div class="pbar" >
                    <div id="progress"></div>
                </div>
            </div>
            <div class="timeline">
                <p>Seller details</p>
                <p>Bank details</p>
                <p>ID Verification</p>
            </div>
            <div class="formouter">
                <form onsubmit="return false">
                    <div class="labels" >
                        <p>Your GST Number</p>
                        <p>Your Business type</p>
                        <p>Your State Name</p>
                        <p>Your City Name</p>
                        <p>Your pincode</p>
                    </div>
                    <div class="inputs" >
                        <div>
                            <input type="number" placeholder="Your GST Number">
                        </div>
                        <select>
                            <option value="1">State Owned Business</option>
                            <option value="2">Publicaly Listed Business</option>
                            <option value="3">Privately Owned Business</option>
                            <option value="4">No I'am an indivisual</option>
                        </select>
                        <select onchange="getcities()" id="states">
                        </select>
                        <select id="cities">
                        </select>
                        <div>
                            <input  type="number" placeholder="Your pincode">
                        </div>
                        <div style="text-align: right;margin-top: 30px;margin-bottom: 30px;">
                            <button onclick="form1handler()" >Proceed</button>
                        </div>
                    </div>
                </form>    
                <form onsubmit="return false">
                    <div class="labels" >
                        <p>Select a preference</p>
                        <p>Enter Full Name</p>
                        <p>Enter Your Account Number</p>
                        <p>Enter a IFSC code</p>
                        <p>Enter Name of Bank</p>
                    </div>
                    <div class="inputs" >
                        <select>
                            <option value="1">I have a bank account</option>
                            <option value="2">I have Applied for bank account in my register business</option>
                        </select>
                        <div>
                            <input type="text" placeholder="Your full name">
                        </div>
                        <div>
                            <input type="number" placeholder="Your account number">
                        </div>
                        <div>
                            <input type="text" placeholder="Your ifsc number">
                        </div>
                        <select>
                        </select>
                        <div style="text-align: right;margin-top: 30px;margin-bottom: 30px;">
                            <button onclick="form2handler()">Proceed</button>
                        </div>
                    </div>
                </form>    
                <form onsubmit="return false">
                    <div class="labels" >
                        <p>Select a proof</p>
                        <p>Enter card number</p>
                        <p>Enter expiry</p>
                    </div>
                    <div class="inputs" >
                        <select>
                            <option value="1">Aadhar card</option>
                            <option value="2">PAN Card</option>
                            <option value="3">Driving license</option>
                        </select>
                        <div>
                            <input type="text" placeholder="Your card number">
                        </div>
                        <div>
                            <input type="date" />
                        </div>
                        <div style="text-align: right;margin-top: 30px;margin-bottom: 30px;">
                            <button onclick="form3handler()" >Proceed</button>
                        </div>
                    </div>
                </form>    
            </div>
        </div>
    </div>
    <script src="javascript/navbar.js"></script>
    <script defer>
        var stage=<%=request.getAttribute("stage") %>
        var states=[];
        var cites={}
        var banks=[]
        let temp=[];
        <% HashMap<String,ArrayList<String>> geodata=(HashMap<String,ArrayList<String>>)request.getAttribute("geodata");
        Object[] states=geodata.keySet().toArray(); 
        for(Object i:states){
        %>
        temp=[]
        <% for(String j:geodata.get(i)){%>
			temp.push("<%=j%>");			        
        <% } %>
        if(temp.length>0){
        cites["<%=i%>"]=temp;
        }
        states.push("<%=i%>");
        <% } %>
        <% Object[] banks=(Object[])request.getAttribute("banks"); 
           Object[] bids=(Object[])request.getAttribute("bankid");
           for(int i=0;i<banks.length;i++){
        %>
        banks.push({id:"<%=bids[i] %>",bank:"<%=banks[i]%>"});
        <% } %>
        function backhandler(){
	        if(stage>1){
                document.getElementById("spinner").style.visibility="visible"                
                let httphandle=new XMLHttpRequest()
                httphandle.onreadystatechange=function(){
                    if(this.readyState==4 && this.status==200){
                        document.getElementById("spinner").style.visibility="collapse"                        
			        	stage-=1;
			            progress_handler()	        	
                    }
                }
                httphandle.open("GET","/joinus?b1=1",true)
                httphandle.send()	        
	        }
        }
        function form1handler(){
            let form1=document.getElementsByTagName("form")
            let eles=document.getElementsByClassName("error")
            if(eles){
                for(let i=0;i<eles.length;i++){
                    eles[i].innerHTML=""
                }
            }
            if(form1[0][0].value=="" || form1[0][4].value=="" || form1[0][0].value.length!=15 || form1[0][4].value.length!=6 ){
                if(form1[0][0].value==""){
                    form1[0][0].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }else if(form1[0][0].value.length!=15){
                    form1[0][0].parentElement.innerHTML+=`<div class="error"><span>Invalid GST Number</span></div>`
                }
                if(form1[0][4].value==""){
                    form1[0][4].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }else if(form1[0][4].value.length!=6){
                    form1[0][4].parentElement.innerHTML+=`<div class="error"><span>Invalid Pincode</span></div>`
                }
            }else{
                document.getElementById("spinner").style.visibility="visible"                
                let httphandle=new XMLHttpRequest()
                httphandle.onreadystatechange=function(){
                    if(this.readyState==4 && this.status==200){
                        document.getElementById("spinner").style.visibility="collapse"                        
                        stage=2;
                        progress_handler()
                    }
                }
                httphandle.open("GET","/joinusp1?gst="+form1[0][0].value.replace("&","and")+"&btype="+form1[0][1].value+"&state="+form1[0][2].value+"&city="+form1[0][3].value+"&pincode="+form1[0][4].value,true)
                httphandle.send()
            }
        }
        function form2handler(){
            let eles=document.getElementsByClassName("error")
            if(eles){
                for(let i=0;i<eles.length;i++){
                    eles[i].innerHTML=""
                }
            }
            let f2=document.getElementsByTagName("form")[1]
            if(f2[1].value=="" || f2[2].value=="" || f2[3].value=="" || f2[3].value.length!=6){
                if(f2[1].value==""){
                    f2[1].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }
                if(f2[2].value==""){
                    f2[2].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }
                if(f2[3].value==""){
                    f2[3].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }else if(f2[3].value.length!=6){
                    f2[3].parentElement.innerHTML+=`<div class="error"><span>Invalid ifsc code</span></div>`
                }
            }else{
                document.getElementById("spinner").style.visibility="visible"                
                let httphandle=new XMLHttpRequest()
                httphandle.onreadystatechange=function(){
                    if(this.readyState==4 && this.status==200){
                        document.getElementById("spinner").style.visibility="collapse"                        
                        stage=3
                        progress_handler()
                    }
                }
                httphandle.open("GET","/joinusp2?pref="+f2[0].value+"&name="+f2[1].value.replace("&","and")+"&acc="+f2[2].value+"&ifsc="+f2[3].value+"&bank="+f2[4].value,true)
                httphandle.send()
            }
        }
        function form3handler(){
            let f2=document.getElementsByTagName("form")[2]
            if(f2[1].value=="" || f2[2].value=="" ){
                if(f2[1].value==""){
                    f2[1].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }
                if(f2[2].value==""){
                    f2[2].parentElement.innerHTML+=`<div class="error"><span>This field is required</span></div>`
                }
            }            
            stage=1;
        }
        function progress_handler(){
            switch(stage){
                case 1:
                    for(let i=0;i<states.length;i++){
                      document.getElementsByTagName("form")[0][2].innerHTML+="<option value='"+states[i]+"'>"+titlecase(states[i])+"</option>  ";
                    }
                    getcities();                    
                    document.getElementsByTagName("form")[0].style.display="flex"                    
                    document.getElementsByTagName("form")[1].style.display="none"
                    document.getElementsByTagName("form")[2].style.display="none"                    
                    document.getElementById("progress").style.width="20%"
                    break;
                case 2:
                    document.getElementsByTagName("form")[0].style.display="none"
                    document.getElementsByTagName("form")[1].style.display="flex"
                    document.getElementsByTagName("form")[2].style.display="none"
                    for(let i=0;i<banks.length;i++){
                        document.getElementsByTagName("form")[1][4].innerHTML+="<option value='"+banks[i]["id"]+"'>"+titlecase(banks[i]["bank"])+"</option>  ";
                    }
                    document.getElementById("progress").style.width="50%"
                    break;
                case 3:
                    document.getElementsByTagName("form")[0].style.display="none"
                    document.getElementsByTagName("form")[1].style.display="none"
                    document.getElementsByTagName("form")[2].style.display="flex"
                    document.getElementById("progress").style.width="100%"
                    break;                
            }
        }
        function display_button(){
            document.getElementsByTagName("form")[0][5].disabled=(document.getElementsByTagName("form")[0][4].value=="" || document.getElementsByTagName("form")[0][0].value=="")
        }
        function titlecase(text){
            return text.charAt(0).toUpperCase().concat(text.substr(1,text.length))
        }
        function initializer(){
            document.getElementById("spinner").style.visibility="collapse"
            progress_handler()
        }
        function getcities(){
            let c=document.getElementById("states").value
            document.getElementById("cities").innerHTML=""                
            if(cites[c]){
	            for(let i=0;i<cites[c].length;i++){
	               document.getElementById("cities").innerHTML+="<option value='"+cites[c][i]+"'>"+titlecase(cites[c][i])+"</option>"                        
	            }                  
            }else{
                document.getElementById("cities").innerHTML="<option value='null'>No city is registered</option>"                          
            }
        }
    </script>
</body>
</html>