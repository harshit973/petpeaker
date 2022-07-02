import { Slider } from '@mui/material'
import React, { Component } from 'react'
import {db} from '../firebase'
import {  collection, getDocs } from "firebase/firestore";

class Shop extends Component {
    constructor(){
        super()
        this.state={
            products:{prev:[],curr:[]},
            brands:[],
            category:[],
            min:0,
            max:1000,
            ml:0,
            val:[200,600],
            mr:1000
        }
        getDocs(collection(db, "products")).then((res)=>{
            res.forEach((doc) => {
                this.setState({products:{prev:[],curr:[...this.state.products.curr,{id:doc.id,...doc.data()}]  }})
            });
        })    
    }
    getdata(form){
        let filtereddata=[]
        for(let i in this.state.products.curr){
            let product=this.state.products.curr[i]
            if(product.category===form[1].value && product.brand===form[0].value && product.price>=this.state.val[0] && product.price<=this.state.val[1]){
                filtereddata.push(product)
            }
        }
        this.setState({products:{prev:{...this.state.products.curr},curr:filtereddata}})
    }
    clearall(){
        if(this.state.products.prev.length===0) return        
        this.setState({products:{curr:{...this.state.products.prev},prev:[]}})
    }
  render() {
    return (
      <>
        <div className='d-flex p-3' style={{minHeight:"62vh"}}>
            <div className='desktop' style={{width:"360px"}}>
            <section className='border-end p-3 h-100'>
                <div className='d-flex justify-content-between align-items-center'>
                    <h1 className="fw-bold fs-4">Filter By</h1>                   
                    <p onClick={()=>this.clearall()} style={{cursor:"pointer"}} className="fs-6 text-decoration-none m-0 text-primary">Clear All</p>                   
                </div>
                <div className='mt-4'>
                <form onSubmit={(event)=>{event.preventDefault();this.getdata(event.target)}} method='POST' noValidate>
                    <div className="mb-3">
                        <label htmlFor="exampleInputEmail1" className="form-label">Brand</label>
                        <select className="form-select" aria-label="Default select example">
                            {
                                (()=>{
                                    let ele=[]
                                    let s=new Set()
                                    for(let i in this.state.products.curr){
                                        let brand=this.state.products.curr[i].brand.id
                                        if(s.has(brand)) continue
                                        s.add(brand)
                                        ele.push(
                                            <option key={i} value={brand}>{brand}</option>
                                        )
                                    }
                                    return ele
                                })()
                            }
                        </select>                    
                    </div>
                    <div className="mb-3">
                        <label htmlFor="exampleInputEmail1" className="form-label">Category</label>
                        <select className="form-select" aria-label="Default select example">
                        {
                                (()=>{
                                    let ele=[]
                                    let s=new Set()                                    
                                    for(let i in this.state.products.curr){
                                        let category=this.state.products.curr[i].category
                                        if(s.has(category)) continue
                                        s.add(category)                                        
                                        ele.push(
                                            <option key={i} value={category}>{category}</option>
                                        )
                                    }
                                    return ele
                                })()
                        }
                        </select>                    
                    </div>
                    <div className="mb-3">
                        <label htmlFor="exampleInputPassword1" className="form-label">Price</label>
                        <Slider
                            getAriaLabel={() => 'Temperature range'}
                            value={[...this.state.val]}
                            onChange={(e,data)=>{this.setState({val:[...data]})}}
                            valueLabelDisplay="auto"
                            min={this.state.min}
                            max={this.state.max}
                            step={1}
                            disableSwap
                        />                   
                    </div>
                    <button disabled={this.state.products.curr.length===0} type="submit" className="btn btn-primary w-100">Filter</button>
                </form>                    
                </div>
            </section>
            </div>
            <div className='w-100 pt-3 ps-2 pe-2 pb-3 overflow-auto'>
                {
                    (()=>{
                        if(this.state.products.curr.length===0){
                            return (<div className='w-100 h-100 d-flex justify-content-center align-items-center'><div style={{width:"10rem",height:"10rem"}} className="spinner-border spinner-border text-primary" role="status">
                            <span className="visually-hidden">Loading...</span>
                          </div></div>)
                        }
                    })()
                }
                <div>
                    {
                        (()=>{
                            let eles=[]
                            for(let i in this.state.products.curr){
                                let product=this.state.products.curr[i]
                                eles.push(
                                    <div key={i} className="d-flex w-100 m-auto border-bottom pb-3 pt-3">
                                        <div className="d-flex align-items-center justify-content-center">
                                            <img style={{width:"200px"}} src={product.thumbnail} alt='' />
                                        </div>
                                        <div className='desktop w-100'>
                                        <div className="w-100 d-flex justify-content-between ps-3 pe-3 w-100">
                                            <div>
                                                <span style={{cursor:"pointer"}} onClick={()=>{this.props.history.push("/description/"+product.id)}} className='fs-4 m-0'>{product.name}</span>
                                                <p>{product.brand.id}</p>
                                                <span className="badge bg-success p-2 fs-6">⛤ {product.rating}</span>
                                            </div>
                                            <div style={{minWidth:"60px"}}>
                                                <p className='fs-4 text-success m-0'>{product.price} ₹</p>
                                            </div>
                                        </div>
                                        </div>
                                        <div className="mobile ps-3 pe-3 w-100">
                                                <span style={{cursor:"pointer"}} onClick={()=>{this.props.history.push("/description/"+product.id)}} className='fs-4 m-0'>{product.name}</span>
                                                <p className='m-0'>{product.brand.id}</p>
                                                <p className='fs-4 text-success mt-2 mb-2'>{product.price} ₹</p>
                                                <span className="badge bg-success p-2 fs-6 ">⛤ {product.rating}</span>
                                        </div>
                                    </div>                                
                                )
                            }
                            return eles
                        })()
                    }
                </div>
            </div>
        </div>
      </>
    )
  }
}
export default Shop