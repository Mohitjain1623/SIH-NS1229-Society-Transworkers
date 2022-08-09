import React from 'react';
import {Link} from "react-router-dom";

function Admin_Profile(props) {
  return (
    <div className='m-5'>
        {/* <Link to="/">Home</Link>
        <Link to="/about">about</Link> */}
        <h1 className='font-semibold text-3xl text-center'>Admin Information</h1>
        <div className='grid justify-items-center'>  
        <p className='font-semibold text-xl text-left'>Name : Mohit Singh </p>
        <p className='font-semibold text-xl text-left'>Email : xyz@gmail.com</p>
        </div>
        
    </div>
  )
}

export default Admin_Profile