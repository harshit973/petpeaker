import { doc, getDoc} from 'firebase/firestore'
import React, { Component } from 'react'
import { db } from '../firebase'
import {Tooltip} from "@mui/material"
export default class Description extends Component {
  constructor(props){
        super(props)
        this.state={

        }
        getDoc(doc(db, "products",props.match.params.id)).then((res)=>{
            this.setState({...res.data()})
        })        
  }
  
  render() {
    return (
        <>
            <div className='d-flex justify-content-around pt-4 pb-4'>
              <div style={{maxWidth:"500px"}} className='d-block text-center  d-block'>
                <img className='w-100 mb-2 mt-2' src={this.state.thumbnail} alt='' />
                <Tooltip title="purchase service currently not available" arrow>
                  <button className='btn btn-primary'>Proceed to purchase</button>
                </Tooltip>                
              </div>
              <div style={{maxWidth:"600px"}}>
                <p className='display-6'>{this.state.name}</p>
                <span className="badge bg-success p-2 fs-6">⛤ {this.state.rating}</span>
                <p className='fs-4 text-success m-0'>{this.state.price} ₹</p>
                <p style={{paddingTop:" 0.5rem",paddingBottom:' 0.5rem',color:" #6c757d",textAlign:"left"}}>{"Description"}</p>
                <p className='fs-6 m-0'>{this.state.description}</p>
                <div className='mt-3 '>
                  <p style={{paddingTop:" 0.5rem",paddingBottom:' 0.5rem',color:" #6c757d",textAlign:"left"}}>{"Highlights"}</p>
                  <ul>
                    {
                      (()=>{
                        let eles=[]
                        for(let i in this.state.highlights){
                          eles.push(
                            <li key={i}>{this.state.highlights[i]}</li>
                          )
                        }
                        return eles
                      })()
                    }
                  </ul>
                </div>
              </div>
            </div>            
        </>
    )
  }
}
