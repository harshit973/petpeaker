import { Component } from 'react'
import { Redirect } from 'react-router-dom';
import { auth } from '../firebase'

export default class Logout extends Component {
    constructor(){
        super();
        auth.signOut()    
    }
    render(){
        return(
            <Redirect to={"/login"} path='/login' />
        )
    }
}
