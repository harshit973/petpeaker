import { onAuthStateChanged } from 'firebase/auth'
import React, { Component } from 'react'
import { NavLink } from 'react-router-dom'
import { Link } from 'react-router-dom'
import {auth} from "../firebase"
export default class Navbar extends Component {
  constructor(){
    super()
    this.state={
      name:"Pet peaker",
      options:[
        {name:"Home",link:"/"},
        {name:"Shop",link:"/shop"},
        {name:"Own a pet",link:"/ownapet"},
      ],
      islogin:false
    }
    onAuthStateChanged(auth,(user)=>{
      if(user){
        this.setState({islogin:true})
      }else{
        this.setState({islogin:false})        
      }
    })
  }
  render() {
    return (
      <>
        <nav style={{Height:"200px",zIndex:222}} className="navbar navbar-expand-lg navbar-light bg-light w-100 position-fixed top-0 shadow">
          <div className="container-fluid">
            <Link className="navbar-brand text-capitalize fs-3" to={"/"}>{this.state.name}</Link>
            <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span className="navbar-toggler-icon"></span>
            </button>            
            <div id="navbarSupportedContent" className='collapse navbar-collapse justify-content-end'>
            <ul className="navbar-nav">
              {
                (()=>{
                  let ele=[]
                  for(let i in this.state.options){
                    ele.push(  
                      <li key={i} className='nav-item'>                    
                        <NavLink  className="nav-link text-capitalize fs-5 active" to={this.state.options[i].link}>{this.state.options[i].name}</NavLink>
                      </li>
                    )
                  }
                  return ele
                })()
              }
              {
                (()=>{
                  if(this.state.islogin){
                    return(<li key={this.state.options.length} className='nav-item dropdown'>
                      <span className='nav-link dropdown-toggle' id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" className="bi bi-person-circle " viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fillRule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                      </svg></span>
                      <ul  style={{minWidth:"6rem"}} className="dropdown-menu dropdown-menu-end text-end" aria-labelledby="navbarDropdownMenuLink">
                        <li><Link className="dropdown-item" to={"/profile"}>Profile</Link></li>
                        <li><Link className="dropdown-item" to={"/logout"}>Logout</Link></li>
                      </ul>
                    </li> )   
                  }else{
                    return (
                      <li key={this.state.options.length} className='nav-item'>                    
                        <NavLink className="nav-link text-capitalize fs-5 active" to={"/login"}>{"Login"}</NavLink>
                      </li>
                    )
                  }
                })()
              }
            </ul>
            </div>
          </div>
        </nav>      
      </>
    )
  }
}
