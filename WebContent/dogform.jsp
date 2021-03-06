<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dcs</title>
    <link rel="stylesheet" href="/static/spinner.css">
    <style>
        *{
            font-family: sans-serif;
        }
        html,body{
            width: 100%;
            height: 100%;
            margin: 0;
        }
        .popup{
            background-color: white;text-align: center;padding: 10px;max-width: 400px;font-size: 24px;border-radius: 0.2em;margin: 15px;
        }
        .popupback{
            background-color: #000000b8;
            position: fixed;
            top: 0;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 4;
        }
        .popup img{
            width: 60px;
        }
        .popup h1{
            font-size: 23px;
        }
        .popup p{
            font-size: 17px;
            line-height: 30px;
        }
        body{
            overflow: auto;
            box-sizing: border-box;
        }
        form .element{
            margin: 30px 0px;
        }
        form{
            overflow: auto;
        }
        form h2{
            font-size: 30px;
        }
        form input{
            width: 100%;
            box-sizing: border-box;
            border: 0;
            border-bottom: 1px solid;
            outline: none;
            font-size: 16px;
            padding: 5px;
        }
        button{
            border: 0;
            cursor: pointer;
            color: white;
            background-color: blue;
            padding: 10px;
            background-color: blue;
            border-radius: 0.5em;
            width: 100%;
            font-size: 15px;
            outline: none;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div style="display: none" class="popupback">
        <div class="lds-hourglass"></div>
    </div>
<div style="background: url('/static/images/login.jpg');width: 40%;height: 100%;position: fixed;right: 0;"></div>
<div style="display: flex;align-items: center;width: 60%;height: 100%">
    <div style="width: 70%;margin:auto;text-align: center;overflow: auto;padding: 15px;box-sizing: border-box">
        <div>
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA0CAYAAADFeBvrAAAABmJLR0QA/wD/AP+gvaeTAAACf0lEQVRoge2aT2vUQBiHn9XWS3WFXlyxFr3Yuj3op1DoSW2rfgDFiwj6ObQqPQmCeu3NQ8GuH0DvKqinUkvvbnrbbeNhsrBOZmaT+ZOMmAdeWDKZd36/zGQ2eUmLMMwDN4Bl4AIwlx3fA3aALeA9sBtofG/MAa+AIZBOiENgE7hYi9ICrAAHTDYiRwLcrEGvkSfAEeXNjOIIeFy5ag0rqM18Ah4AC8BMFgvZsc+K8w+JYKbOk19mfeB2gb53snPl5XcuiNKCvJEE/QaulOh/lbyp1541Fmae/G5WZGZk7ko5hoiZr5xH5O8ZG1rk76mHtqKO2XZE/GmO89YyTwq8m5C7En7w91W95JBrUcr13VmdBYkkYsYh10nyu50VLQcRqcdc3vK53ENR0hiKncZQ7DSGYqeMoSXgOfAV8cogY/tyNwqZg2ysdaBbQudETgAbFKsThIoh8BKY9mHmY41G5Oi5mtqIwIQcL2zNLFHvMtPFALisE23aFO4Dx0tcgKqYAu7ZdPxG/bOhiy860aZH9ATxnhIjCdBWNZgMpWG0eEOp/b9+UrBhD1hDLI82cAv4GXhMLa437i9gVpF3NmtzzV+5oVVD7rVQhkJuCm301Zs2omzsQuWbwpRlmxMhDV0ztF0POK4W1zW+A5xR5O1kbf/cppAC+4q8+55yK6niSUEeI1ReoHlSiJ/GkAWdsd9nKxhPi4+dKEV8LdJBmNn0mFeJaZfrA6dKXIAq6QOnVQ2mJRfzh0VabSZDvQBCfPHBplOXeMtYizaGQJRf6zYgx7qtGRBl114EJkaxjYf69jSi/Dqo0cgAMTPOZsbpAs8QRT75G4UQkWRjPcVQ+pX5A/3xrmHyotFVAAAAAElFTkSuQmCC"/>
            <h2 style="font-size: 30px">Login</h2>
        </div>
        <form method="POST" onsubmit="return validator()" action="/login">
            <div class="element">
                <input type="text" name="username" placeholder="Enter your username">
                <div style="text-align: left;color: red;display: none">
                    <small>This field is required</small>
                </div>
            </div>
            <div class="element">
                <input type="password" name="password" placeholder="Enter your password" >
                <div style="text-align: left;color: red;display: none">
                    <small>This field is required</small>
                </div>
                {% ifequal invalid 1  %}
                    <div style="text-align: left;color: red;">
                        <small>Invalid password</small>
                    </div>
                {% endifequal %}
            </div>
            {% csrf_token %}
            <div class="element">
                <button type="submit">Authenticate</button>
            </div>
        </form>
        <small style="font-size: 15px">Or continue with</small>
        <div style="margin: 20px 0px">
            <div onclick="gsignin()" style="width: 85%;margin:auto;background-color: white;border-radius: 1em;overflow: auto;box-sizing: border-box;box-shadow: 0 0px 5px 0px #424242;position: relative;cursor: pointer">
                <img style="position: absolute;left: 0;width: 35px" src="data:image/png;base64,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"/>
                <p style="margin: 10px 0px">Login with Google</p>
            </div>
        </div>
    </div>
</div>
  <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-auth.js"></script>
<script>
  var firebaseConfig = {
    apiKey: "AIzaSyBGFaAmVDuy5QXbtR-0jvoaFp1cUqrwvPM",
    authDomain: "cyber-91401.firebaseapp.com",
    projectId: "cyber-91401",
    storageBucket: "cyber-91401.appspot.com",
    messagingSenderId: "568795343748",
    appId: "1:568795343748:web:efeb11ba06d54b80c30bd1",
    measurementId: "G-SCNFJ0NZHY"
  };
  firebase.initializeApp(firebaseConfig);
        function generatepopup(message){
            outer=document.createElement("div")
            popup=document.createElement("div")
            image=document.createElement("img")
            head=document.createElement("h1")
            body=document.createElement("p")
            head.innerText="Unhandled Exception"
            body.innerHTML=message
            outer.className="popupback"
            popup.className="popup"
            image.setAttribute("src","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABmJLR0QA/wD/AP+gvaeTAAACL0lEQVRoge3ZzWrUUBjG8V/9KIhFdGEV9AZ05060G9Hu1U3BGxDxA6+ie10JgogLFyJ1IUoFV4Jb8QJURHSwLYg4IqK1cZEzOGWazJyZJBPb/OElQ86b5HlyPnLOGRo2N5O4iS/4gLmusvN4g6+4h32Vq4vgLpKuWJMauxF+d5e9xI7xyMznuPVCB4lrY1HahwfijbzFtnGIzWIav8UbSTBbhICi3sZZw7f3uf4p1fHUcLWR4CMmqpe8np04hZ+GN5LgAnZVrB0cw218ixDbL37gPmaqMDCFW3q/CUXHAg6WaeROyQa641WMsNhR61dk/iisxiRvj7z5E7zGd+lbm8Buo486CZbxDs+lU5rr+DPifaOYt75tv0BbdpNph5yFrnPzVQrO4qh/nf9iODeJq3pNXAllcCmcW8ORCvXm8lgq6j3O4DSe6TWyGMpmpdP8JFzbsKU4h5bqvhv9oiWdnEZTJxOd+JQlNm/8T+J8V8aGmmu1OhuFxkjdaIzUjcZI3WiM1I0yjJyQTuWzmMHJEp6byTBzoXa4dionZyrk5K0i82JDiq6RpXA8kJMzHY7LRT64aCMdcdM5Of+FkU6NDGJkKScnmnHUSKfZ1bpGNk3TWgnH/Tk5nbKVnJxotkQfaQ1xv85bLquPZK7Z84xcFm+mzD7SCpoq5bPsL3OhTapM9kr/Esgysoo9Y1M3IIfxSP/50kMcGpPGXDbasB40FosQUNTwO8pmXl03AhtG4i/1boL+GLKbiQAAAABJRU5ErkJggg==")
            popup.appendChild(image)
            popup.appendChild(head)
            popup.appendChild(body)
            outer.appendChild(popup)
            document.getElementsByTagName("body")[0].appendChild(outer)
        }
    function gsignin(){
        var provider = new firebase.auth.GoogleAuthProvider();
        provider.addScope('profile');
        provider.addScope('email');
        firebase.auth().signInWithPopup(provider).then(function(result) {
         var token = result.credential.accessToken;
         var user = result.user;
         var xhttp = new XMLHttpRequest();
         document.getElementsByClassName("popupback")[0].style.display="flex"
         xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementsByClassName("popupback")[0].style.display="none"
                let data=JSON.parse(this.responseText)
                console.log(data)
                if(data.code==0){
                    generatepopup("We are unable to authenticate your email address as you are not registered with this account")
                }else if(data.code==1){
                    location.href="/"
                }
            }
         };
        firebase.auth().currentUser.getIdToken(true).then(function(id) {
            xhttp.open("GET", "/sos?&utoken="+id, true);
            xhttp.send();
        }).catch(function(error) {
            alert(error)
        });
        });
    }
    function validator(){
        let form=document.getElementsByTagName("form")[0]
        if(form[0].value==""){
            form[0].parentElement.children[1].style.display="block"
        }
        if(form[1].value==""){
            form[1].parentElement.children[1].style.display="block"
        }
        return !(form[0].value=="" || form[1].value=="")
    }
</script>
</body>
</html>