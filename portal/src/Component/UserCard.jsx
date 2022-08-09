import React from 'react'

function UserCard(props) {
  return (
    <div className="my-2 w-96 h-36 p-5 " style={{boxShadow:'1px 1px 2px 1px gray'}}>
        <p> <span className="font-bold"> Username :</span> {props.username}</p>
        <p><span className="font-bold"> Email : </span>{props.email}</p>
        <p><span className="font-bold">Phone No. :</span> {props.phone}</p>

        <p className=" text-red-500 text-left pt-4 uppercase">Remove</p>
    </div>
  )
}

export default UserCard