import React, { Component } from 'react'
import {signInWithEmailAndPassword } from "firebase/auth";
import {auth} from "../firebase"
import { Link } from 'react-router-dom';

export default class Login extends Component {
  signinuser(email,password){
    document.getElementById("authfail").style.display="none"      
    signInWithEmailAndPassword(auth, email, password)
    .then((userCredential) => {
        this.props.history.push("/")
    })
    .catch((error) => {
        document.getElementById("authfail").style.display="block"
    });
  }
  componentDidMount(){
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms)
      .forEach((form)=>{
        form.addEventListener('submit',(event)=>{
          event.preventDefault()
          if (!form.checkValidity()) {
            event.stopPropagation()
          }else{
            form.classList.add('was-validated')
            this.signinuser(event.target[0].value,event.target[1].value)  
          }  
        }, false)
      })      
  }
  render() {
    return (
        <>
        <main style={{minHeight:"60vh"}} className="form-signin d-flex justify-content-center align-items-center">
        <form method='POST' className="needs-validation text-center w-100" noValidate>
            <svg  xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" className="bi bi-person-circle mb-4 mt-4" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fillRule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg>            
            <h1 className="h3 mb-3 fw-normal">Please sign in</h1>
            <div id='authfail' style={{display:"none"}} className="alert alert-danger" role="alert">
                Invalid email or password
            </div>            
            <div className="form-floating">
                <input pattern='^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$' type="email" className="form-control" id="floatingInput" placeholder="name@example.com" required />
                <label className='form-label' htmlFor="floatingInput">Email address</label>
                <div className="invalid-feedback text-start">Invalid email</div>                
            </div>
            <div className="form-floating">
                <input type="password" className="form-control" id="floatingPassword" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required />
                <label htmlFor="floatingPassword">Password</label>
                <div className="invalid-feedback text-start">Invalid password</div>                
            </div>
            <button className="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
            <div className='text-end'>
              <Link to={"/register"} className="text-decoration-none">Register</Link>
            </div>
        </form>
        </main>
        </>
    )
  }
}
