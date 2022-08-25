// get users 

import React,{useState} from 'react'
import Card from "./UserCard";
import axios from 'axios';

const link = 'http://localhost:4000/api/user';





function Users() {
  
    const [postdata,setpostdata] = useState({username:'',email:'',phone:''});
  
    const Data = async(e)=>{
      e.preventDefault();
      console.log(postdata);
        const res = await axios.get(link);
        console.log(res);
    }

  return (
    <div>
        <Card/>
    </div>
  )
}

export default Users;
