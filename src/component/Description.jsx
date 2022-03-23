import { doc, getDoc} from 'firebase/firestore'
import React, { Component } from 'react'
import { db } from '../firebase'

export default class Description extends Component {
  constructor(props){
        super(props)
        getDoc(doc(db, "products",props.match.params.id)).then((res)=>{
            this.setState({...res.data()})
        })        
  }
  render() {
    return (
        <>
                        
        </>
    )
  }
}
