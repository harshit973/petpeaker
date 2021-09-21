var petdata=[]

function switchpet(x){
	document.getElementsByClassName("mega-links")[0].innerHTML=""	
	for(let i=0;i<petdata[x]["breeds"].length;i++){
		document.getElementsByClassName("mega-links")[0].innerHTML+=`<li><a href="/breeddescription?bid=`+petdata[x]["breeds"][i]["bid"]+`">`+petdata[x]["breeds"][i]["bname"]+`</a></li>`				
	}			
	document.getElementsByClassName("row")[0].children[0].src=petdata[x]["pic"]
}
function serviceopen(){
	document.getElementsByClassName("sidenavbar")[0].style.width="0"
	document.getElementsByClassName("services")[0].style.height=document.getElementsByClassName("services")[0].children[0].clientHeight+25+"px"
}
function setCookie(cname, cvalue) {
  var d = new Date();
  d.setTime(d.getTime() + (20*60*1000));
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function appearsplashscreen(){
	let splashback=document.createElement("div")
	let splashouter=document.createElement("div")
	splashouter.className="preloader"
	let loading=['l','o','a','d','i','n','g']
	for(let text in loading){
		splashouter.innerHTML+=`<div class="preloader__wheel-wrapper">
	    <div class="preloader__wheel"><span class="preloader__content">`+loading[text].toUpperCase()+`</span>
	      <div class="preloader__inner-wheel"></div>
	      <div class="preloader__second-inner-whell"></div>
	    </div>
	  </div>`
	}
	splashback.className="splashback"
	splashback.appendChild(splashouter)
	document.getElementsByTagName("body")[0].appendChild(splashback)
}
function removespashscreen(){
	document.getElementsByClassName("splashback")[0].style.opacity="0"
	setTimeout(()=>{document.getElementsByClassName("splashback")[0].remove()},1000)
}
function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return null;
}
function import_petdata(){
	if(!getCookie("pdata")){
	  	var xhttp = new XMLHttpRequest();
		appearsplashscreen();
	  	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
			setTimeout(()=>{removespashscreen()},6000)
			petdata=JSON.parse(this.responseText)
			setCookie("pdata",this.responseText)		
			if(!navigator.appVersion.toLowerCase().includes("android") && !navigator.appVersion.toLowerCase().includes("ios") && !navigator.appVersion.toLowerCase().includes("iphone") ){
				document.getElementsByClassName("mega-links")[1].innerHTML=""						
			}	
			for(let x in petdata){
				document.getElementsByClassName("mega-links")[1].innerHTML+=`<li onmouseover='switchpet(`+x+`)'><a href="/breeds?pid=`+petdata[x]["name"]+`">`+petdata[x]["name"]+`</a></li>`
			}
			for(let x in petdata){		
				switchpet(x);
				break;
			}
		  }
	    };
		xhttp.open("GET", "/getpetdata", true);
		xhttp.send();
	}else if( !navigator.appVersion.toLowerCase().includes("android") && !navigator.appVersion.toLowerCase().includes("ios") && !navigator.appVersion.toLowerCase().includes("iphone")  ){
		petdata=JSON.parse(getCookie("pdata"))					
		document.getElementsByClassName("mega-links")[1].innerHTML=""						
		for(let x in petdata){
			document.getElementsByClassName("mega-links")[1].innerHTML+=`<li onmouseover='switchpet(`+x+`)'><a href="/breeds?pid=`+x+`">`+petdata[x]["name"]+`</a></li>`
		}
		for(let x in petdata){		
			switchpet(x);
			break;
		}	
	}
}
	import_petdata();
function opennavbar(){
	document.getElementsByClassName("sidenavbar-container")[0].style.display="block"
	document.getElementsByClassName("sidenavbar")[0].style.width="80%"	
}
function closenav(){
		document.getElementsByClassName("sidenavbar")[0].style.width="0"
		document.getElementsByClassName("services")[0].style.height="0"		
		setTimeout(()=>{document.getElementsByClassName("sidenavbar-container")[0].style.display="none"},500)				
}
function closure(e){
	if(e.target==document.getElementsByClassName("sidenavbar-container")[0]){
		closenav()
	}
}