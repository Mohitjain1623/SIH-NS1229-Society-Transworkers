import React from 'react'
import { Link } from 'react-router-dom'

function Sidebar() {
  return (
    <div className='text-3xl'>
        <div className='p-3 flex shadow-md h-24'>
            <img src="https://iconape.com/wp-content/png_logo_vector/ashok-stambh-logo.png" alt="pib"  className='w-16'/>
            <span>
                <p className='font-bold text-2xl'>Press Information Bureu</p>
                <p className='font-lighter text-2xl'>Government of India</p>
            </span>
        </div>
        <div className='p-3 text-2xl font-bold '>
            <table>
                <tr>
                    <td>
                        <Link to='/' className=''><img src="https://cdn-icons.flaticon.com/png/512/4871/premium/4871351.png?token=exp=1660060605~hmac=fa1fa0209175b0a91468d3d525b38256" alt="admin"  className='w-8 mx-2 my-2'/></Link>
                    </td>

                    <td> <Link to='/'><span className="self-center">  Admin Profile</span></Link></td>
                </tr>
                <tr>
                    <td>
                        <Link to='/allreleases' className=''><img src="https://cdn-icons-png.flaticon.com/512/3208/3208799.png" alt="press_releases"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/allreleases'><span className="self-center">  All Release</span></Link></td>
                </tr>

                <tr>
                    <td>
                        <Link to='/users' className=''><img src="https://cdn-icons-png.flaticon.com/512/1946/1946429.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/users'><span className="self-center">  Users</span></Link></td>
                </tr>
            </table>
           


            
                
               
        </div>
    </div>
  )
}

export default Sidebar