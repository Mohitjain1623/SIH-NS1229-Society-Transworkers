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
                        <Link to='/' className=''><img src=" https://cdn-icons-png.flaticon.com/512/7542/7542296.png" alt="admin"  className='w-8 mx-2 my-2'/></Link>
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


            {/* gallery photos */}
                <tr>
                    <td>
                        <Link to='/photos' className=''><img src="https://cdn-icons-png.flaticon.com/512/833/833281.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/photos'><span className="self-center">  Photos</span></Link></td>
                </tr>

                {/*gallery ebooklets  */}

                <tr>
                    <td>
                        <Link to='/ebooklets' className=''><img src="https://cdn-icons-png.flaticon.com/512/1945/1945891.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/ebooklets'><span className="self-center">  Ebooklets</span></Link></td>
                </tr>

                {/* Infographics */}
                
                <tr>
                    <td>
                        <Link to='/infographic' className=''><img src="https://cdn-icons-png.flaticon.com/512/944/944053.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/infographic'><span className="self-center">  Infographics</span></Link></td>
                </tr>



                {/* Videos */}
                <tr>
                    <td>
                        <Link to='/videos' className=''><img src="https://cdn-icons-png.flaticon.com/512/2991/2991195.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/videos'><span className="self-center">  Videos</span></Link></td>
                </tr>


                {/* webcast  */}

                <tr>
                    <td>
                        <Link to='/webcast' className=''><img src="https://cdn-icons-png.flaticon.com/512/2177/2177994.png" alt="users"  className='w-8 my-2 mx-2'/></Link>
                    </td>

                    <td> <Link to='/webcast'><span className="self-center">  Webcast</span></Link></td>
                </tr>
            </table>
           


            
                
               
        </div>
    </div>
  )
}

export default Sidebar