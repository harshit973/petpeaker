import React, { Component } from 'react'

export default class Home extends Component {
  constructor(){
    super()
    this.state={
      carousel:["/assets/dog1.jpg","/assets/dog2.jpg","/assets/dog3.jpg"],
      services:[
        {thumbnail:"/assets/s1.jpg",head:"Pet sitting",content:"We supervise or care your pets while you are away from home. Key responsibilities include providing food and water.",link:""},
        {thumbnail:"/assets/s2.jpg",head:"Pet doctor",content:"we provide a pet doctor for your pet. Customers can easily book it and they will serve at customer authorized location.",link:""},
        {thumbnail:"/assets/s3.jpg",head:"Pet training",content:"We provide proper training to your pets. we provide positive reinforcement, scientific training, clicker training, electronic training, mirror training, alpha dog or dominance training, relationship-based training",link:""}

      ]
    }
  }
  render() {
    return (
      <>
        <div style={{height:"94vh"}} id="carouselExampleFade" className="carousel slide carousel-fade position-relative" data-bs-ride="carousel">
          <div className="carousel-inner w-100 h-100">
            {
              (()=>{
                let ele=[]
                ele.push(
                  <div key={0} className="h-100 carousel-item active">
                    <img  style={{objectPosition:"center",objectFit:"cover",filter:"brightness(0.7)"}} src={this.state.carousel[0]} className="d-block w-100 h-100" alt="ss" />
                  </div>      
                )                  
                for(let i=1;i<this.state.carousel.length;i++){
                  ele.push(
                    <div key={i} className="h-100 carousel-item">
                      <img  style={{objectPosition:"center",objectFit:"cover",filter:"brightness(0.7)"}} src={this.state.carousel[i]} className="d-block w-100 h-100" alt="ss" />
                    </div>      
                  )                  
                }
                return ele
              })()
            }
          </div>
          <div style={{zIndex:"2"}} className='w-100 h-100 position-absolute top-0 d-flex justify-content-center align-items-center'>
            <p className='display-2 text-light text-center w-50 m-auto'>Best Pet Care Services In Chandigarh</p>                      
          </div>  
        </div>      
        <div className='mt-5 mb-5'>
          <h2 className='h1 text-center'>Services</h2>
          <div className='d-flex flex-wrap justify-content-evenly'>
          {
            (()=>{
              let ele=[]
              for(let i in this.state.services){
                ele.push(
                  <div key={i} className="card m-3" style={{maxWidth:"500px"}}>
                      <div>
                        <img src={this.state.services[i].thumbnail} style={{height:"400px",objectFit:"cover"}} className="img-fluid rounded-start w-100" alt="1" />
                      </div>
                      <div className="card-body">
                        <h5 className="fs-2 card-title">{this.state.services[i].head}</h5>
                        <p className="fs-5 card-text">{this.state.services[i].content}</p>
                      </div>
                  </div>                
                )
              }
              return ele
            })()
          }
          </div>
        </div>
        <div className='bg-dark text-center text-light overflow-auto mt-4 mb-4' >
        <h1 className='h1 mt-4'>How it works</h1>
        <div className='d-flex justify-content-around align-items-baseline flex-wrap  mt-4 mb-4' >
            <div style={{margin:"10px"}}>
                <div style={{width:"90px",height:"90px"}} className='bg-success rounded-circle text-light fs-2 m-auto d-flex align-items-center justify-content-center' >
                  <p>1</p>
                </div>
                <p className='fs-3'>Register to our website</p>
                <div className='m-auto mt-3 mb-3 lead' style={{maxWidth:"200px"}}>
                  <p>You have to register on our website so that you will be eligible for further processes</p>
                </div>
            </div>
            <div style={{margin:"10px"}}>
                <div style={{width:"90px",height:"90px"}} className='bg-success rounded-circle text-light fs-2 m-auto d-flex align-items-center justify-content-center' >
                    <p>2</p>
                </div>
                <p className='fs-3'>Register to our website</p>
                <div className='m-auto mt-3 mb-3 lead' style={{maxWidth:"200px"}}>
                    <p>You can book any service or products with us</p>
                </div>                
            </div>
            <div style={{margin:"10px"}}>
                <div style={{width:"90px",height:"90px"}} className='bg-success rounded-circle text-light fs-2 m-auto d-flex align-items-center justify-content-center' >
                    <p>3</p>
                </div>
                <p className='fs-3'>Register to our website</p>
                <div className='m-auto mt-3 mb-3 lead' style={{maxWidth:"200px"}}>
                    <p>Our executive or delivery partner will be at your doorstep and pick up your pet for providing it care and support </p>
                </div>
            </div>

        </div>
    </div>        
    <div style={{margin:"10px",marginTop:"70px"}} className='d-flex justify-content-around flex-wrap flex-wrap mt-4 mb-4' >
    <div style={{maxWidth:"600px"}} className='text-justify'>
      <div className="py-5">
        <h1 className="display-5 fw-bold text-center">About us</h1>
        <p style={{textAlign:"justify"}} className="fs-4">Pet Peaker Provides pet care and many pet-related services to the customer. we connect pets to pet lovers because we provide a pet lover, not a cage. our executives are always available to serve you. Your Pets is secured with us because we have a community of pet lover. we always want to maintain efficiency for our customers.</p>
      </div>      
    </div>
    <div style={{backgroundImage: `url('/assets/about.jpg')`,backgroundSize: "cover",backgroundPositionX: "center",width: "400px",minHeight: "275px",borderRadius: "0.3em",boxShadow: "0 1px 10px 0px black",margin: "20px"}}></div>
    </div>  
 
      </>
    )
  }
}
