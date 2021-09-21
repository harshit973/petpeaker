<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Peaker</title>
    <link rel="stylesheet" href="css/joinus-mobile.css" />    
	<link rel="stylesheet" href="css/splashscreen.css" />    
    <link rel="stylesheet" href="css/navbar-mobile.css" />        
</head>
<body onload="initializer()">
	<nav>
	    <div class="brand">
	        <h1>Pet Peaker</h1>
	    </div>
	    <div onclick="opennavbar()" class="navbar-mobile">
	        <div></div>
	        <div></div>
	        <div></div>
	    </div>
	</nav>   
<div class="sidenavbar-container" style="display: none;" onclick="closure(event)" >
</div>
<div class="sidenavbar" style="width: 0%;">
    <div class="sidenavbar-header">
        <img src="https://firebasestorage.googleapis.com/v0/b/dealhostage.appspot.com/o/avatar.png?alt=media&token=041bbb3f-5047-4b88-a2bd-a656348b2117" style="width: 70px;border-radius: 50%;" alt="">
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
        <div style="line-height:15px">
	        <a><%= ((HashMap)request.getSession().getAttribute("userdata")).get("firstname")%> <%= ((HashMap)request.getSession().getAttribute("userdata")).get("lastname")%></a>
	        <a style="font-size:14px"><%= ((HashMap)request.getSession().getAttribute("userdata")).get("email")%></a>        
		</div>        
        <% }else{ %>
        <a href="/login">Login or Register</a>
        <%} %>        
    </div>
    <div class="sidenavbar-body" style="margin: 15px;">
    	<a href="/">Home</a>
        <a onclick="serviceopen()">Services</a>
        <a href="/shop">Shop</a>
        <a href="/ownapet">Own a pet</a>        
		<% if(request.getSession().getAttribute("userdata")!=null && String.valueOf(((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode")).equals("1")) { %>         
        <a href="/joinus">Join us</a>
        <% } %>                
		<% if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) && Integer.valueOf((String)((HashMap<String,Object>)request.getSession().getAttribute("userdata")).get("mode"))<100 ){ %>        
        <a href="/mycart" >My Cart</a>               	
        <a href="/account">Account</a>		
        <a href="/logout">Logout</a>        
        <% } %>
    </div>
</div>
	<% HashMap h2=(HashMap)request.getSession().getAttribute("services");
	HashMap h=(HashMap)request.getSession().getAttribute("services");

       if(h2!=null && !h2.isEmpty()){ %>    
    <div class="services">
        <div style="margin:15px">
        <h2 style="border-bottom:1px solid #00000066">Services</h2>
        <div class="services-body">        
	<% 	for(int i=0;i<h2.size();i++){ %>
            <a href="/pricing?sid=<%= h2.keySet().toArray()[i] %>"><%= ((String[])h2.get(h.keySet().toArray()[i]))[0] %></a>
        <% } %>
        </div>
    </div>    
	</div>
	<% } %>	
    <div id="spinner"><div class="lds-hourglass"></div></div>    
    <div class="formouterbox">
        <div class="forminner">
			<img onclick="backhandler()" style="width:35px;position:absolute;top:0;left:0" src="https://img.icons8.com/fluent/48/000000/back.png"/>                    
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
                    <div class="inputs" >
                        <div class="ielement">
	                        <p>Your GST Number</p>                        
                            <input type="number" placeholder="Your GST Number">
                        </div>
                        <div class="ielement">
	                        <p>Your Business type</p>
	                        <select>
	                            <option value="1">State Owned Business</option>
	                            <option value="2">Publicaly Listed Business</option>
	                            <option value="3">Privately Owned Business</option>
	                            <option value="4">No I'am an indivisual</option>
	                        </select>	                        
                        </div>
                        <div class="ielement">
	                        <p>Your State Name</p>
	                        <select onchange="getcities()" id="states">
	                        </select>	                        
                        </div>
                        <div class="ielement">
	                        <p>Your City Name</p>
	                        <select id="cities">
	                        </select>	                        
                        </div>
                        <div class="ielement">
	                        <p>Your pincode</p>                                                                                                
                            <input  type="number" placeholder="Your pincode">
                        </div>
                        <div class="ielement">
                            <button onclick="form1handler()" >Proceed</button>
                        </div>
                    </div>
                </form>    
                <form onsubmit="return false">
                    <div class="inputs" >
                    	<div class="ielement">
	                        <p>Select a preference</p>                    
	                        <select>
	                            <option value="1">I have a bank account</option>
	                            <option value="2">I have Applied for bank account in my register business</option>
	                        </select>
						</div>                        
                        <div class="ielement">
	                        <p>Enter Full Name</p>                        
                            <input type="text" placeholder="Your full name">
                        </div>
                        <div class="ielement">
	                        <p>Enter Your Account Number</p>                        
                            <input type="number" placeholder="Your account number">
                        </div>
                        <div class="ielement">
	                        <p>Enter a IFSC code</p>                        
                            <input type="text" placeholder="Your ifsc number">
                        </div>
                        <div class="ielement">
	                        <p>Enter Name of Bank</p>                        
	                        <select>
	                        </select>                        
                        </div>
                        <div class="ielement">
                            <button onclick="form2handler()">Proceed</button>
                        </div>
                    </div>
                </form>    
                <form onsubmit="return false">
                    <div class="inputs" >
                    	<div class="ielement">
	                        <p>Select a proof</p>                    	
	                        <select>
	                            <option value="1">Aadhar card</option>
	                            <option value="2">PAN Card</option>
	                            <option value="3">Driving license</option>
	                        </select>	                        
                    	</div>
                        <div class="ielement">
	                        <p>Enter card number</p>                        
                            <input type="text" placeholder="Your card number">
                        </div>
                        <div class="ielement">
	                        <p>Enter expiry</p>                        
                            <input type="date" />
                        </div>
                        <div class="ielement">
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
                    getcities();
                    for(let i=0;i<states.length;i++){
                      document.getElementsByTagName("form")[0][2].innerHTML+="<option value='"+states[i]+"'>"+titlecase(states[i])+"</option>  ";
                    }
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