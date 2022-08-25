import React from 'react';  
import './App.css';
import axio from "axios";

import Sidebar from './Component/Sidebar';
import {BrowserRouter,Routes,Route} from "react-router-dom";
import AdminProfile from "./Component/Admin_Profile";
import AllReleases from "./Component/All_Releases";
import Users from "./Component/User";
import Photos from "./Component/ManagePhotos";
import Ebooks from "./Component/ManageEbooks";
import Infographic from "./Component/ManageInfographic";
import Videos from "./Component/ManageVideos";
import Webcast from "./Component/ManageWebcast";


function App() {
  return (
    <div >
     
        {/* show the output */}
      

      <BrowserRouter>
      {/* <AdminProfile/> */}
      <div className='flex '> 
      <Sidebar className="w-1/3"/>
      <div className='w-2/3'>
        <div className="bg-blue-700 py-5 h-24 shadow-md text-white font-bold text-3xl pl-10 self-center">Admin</div>
        <Routes>
          <Route path="/" element={<AdminProfile/>}/>
          <Route path="/allreleases" element={<AllReleases/>}/>
          <Route path="/users" element={<Users/>}/>
          <Route path="/photos" element={<Photos/> }/>
          <Route path="/ebooklets" element={<Ebooks/>}/>
          <Route path="/infographic" element={<Infographic/> }/>
          <Route path="/videos" element={<Videos/> }/>
          <Route path="/webcast" element={<Webcast/> }/>
        </Routes>
        </div>  
        </div>
      </BrowserRouter>
    </div>
  );
}

export default App;
