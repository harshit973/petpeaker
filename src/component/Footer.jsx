import React, { Component } from 'react'
import { Link } from 'react-router-dom'

export default class Footer extends Component {
  render() {
    return (
        <>
            <div className='flex-grow-1'></div>
            <div className="footer bg-dark text-light overflow-auto d-flex flex-wrap justify-content-evenly">
            <div style={{marginTop: "20px",marginBottom: "20px"}}>
            <h2>Follow Us </h2>
            <div style={{marginTop: "15px",marginBottom: "15px",lineHeight: "24px",fontSize: "15px"}}>
            <p>Twitter</p>
            <p><Link  className='text-white text-decoration-none' to={"https://www.facebook.com/petpeakerindia/"}>Facebook</Link></p>
            <p>Instagram</p>
            <p>Youtube</p>
            </div>
            </div>
            <div style={{marginTop:"20px",marginBottom:"20px"}}>
            <h2>Contact Us</h2>
            <div style={{marginTop: "15px",marginBottom: "15px",lineHeight: "24px",fontSize: "15px"}}>
                <p>+91 7986111378</p>
                <p>harshitahuja2091@gmail.com</p>
                <p>g-185 h.m.t pinjore</p>
            </div>    
            </div>
            <div style={{marginTop: "20px",marginBottom: "20px"}}>
                <h2>Working Hours</h2>
                <div style={{marginTop:"15px",marginBottom: "15px",lineHeight: "24px",fontSize: "15px"}}>
                    <p>Monday to Sunday</p>
                    <p>Opens from 9 AM to 5 PM</p>
                </div>        
            </div>
            </div>        
        </>
    )
  }
}
