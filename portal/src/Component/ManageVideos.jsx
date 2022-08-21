import React,{useState} from 'react';
import {Box,FormControl,TextField,Select,MenuItem, NativeSelect,InputLabel} from "@mui/material";
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import Datepicker from "./Date_picker";
import axios from "axios";

const link = 'http://localhost:4000/api/videos';



function ManageVideos() {
  const [postdata,setpostdata] = useState({ministry:'',title:'',url:''});

  const PostData = async(e)=>{
    e.preventDefault();
    console.log(postdata);

    try{
      const res = await axios.post(link,postdata);
      console.log(res);
    }catch(error){
      console.log(error.response);
    }
  }

  const handleMinistryChange = (e)=>{
    const newData = {
      ...postdata,ministry:e.target.value
    }
    setpostdata(newData);
  }

  const handleTitleChange = (e)=>{
    const newData = {
      ...postdata,title:e.target.value
    }
    setpostdata(newData);
  }

  const handleLinkChange = (e)=>{
    const newData = {
      ...postdata,url:e.target.value
    }
    setpostdata(newData);
  }

  return (
    <div>
        <form method='POST' onSubmit={PostData}>
        <FormControl sx={{ m: 1, minWidth: 120,width:300}} >
        <InputLabel htmlFor="grouped-native-select">Ministry</InputLabel>
        <Select native defaultValue="" id="grouped-native-select" label="Grouping" value={postdata.ministry} onChange={handleMinistryChange} >
          <option aria-label="None" value="" />
            <option>All Ministry</option>
            <option>President's Secretariat</option>
            <option>Vice President's Secretariat</option>
            <option>Prime Minister's Office</option>

            <option>Cabinet </option>
            <option>Cabinet Committee Decisions </option>
            <option>Cabinet committee on Economic Affair(CCEA) </option>

            <option> Cabinet Secretariat</option>
            <option>Cabinet committee on Infrastructure</option>
            <option>Cabinet Committee on Price </option>


            <option>Cabinet Committee on Investment </option>
            <option>AYUSH </option>
            <option>Other Cabinet Committees </option>


            <option>Department of Space </option>
            <option> Department of Ocean Development</option>
            <option>Department of Atomic Energy</option>


            <option> Election Commission</option>
            <option>Finance Commission</option>
            <option> Ministry of Agriculture & Farmers Welfare</option>



            <option>Ministry of Agro & Rural Industries</option>
            <option>Ministry of Chemicals and Fertilizers</option>
            <option>Ministry of Civil Aviation</option>


            <option>Ministry of Coal</option>
            <option> Ministry of Commerce & Industry</option>
            <option> Ministry of communications</option>
            <option>Ministry of Company Affair </option>


            <option> Ministry of Consumer Affair, Food & public Distribution</option>
            <option>Ministry of Cooperation </option>
            <option> Ministry of Corporate Affairs</option>
            <option>Ministry of Consumer Affairs, Food & Public Distribution</option>


            <option> Ministry of Cooperation</option>
            <option>Ministry of Corporate Affairs </option>
            <option> Ministry of Culture</option>
            <option> Ministry of Defence</option>


            <option>Ministry of Development of North-East Region </option>
            <option>Ministry of Disinvestment </option>
            <option> Ministry of Drinking Water & Sanitation</option>
            <option>Ministry of Earth Science</option>

            <option>Ministry of Education </option>
            <option> Ministry of Electornics & IT</option>
            <option>Ministry of Environment, Forest and Climate Change </option>
            <option> Ministry of External Affairs</option>

            <option> Ministry of Finance</option>
            <option> Ministry of Fisheries, Animal Husbandry & Dairying</option>
            <option>Ministry of Food Processing Industries </option>
            <option> Ministry of Health and Family Welfare</option>

            <option>Ministry of Heavy Industries</option>
            <option> Ministry of Home Affairs</option>
            <option>Ministry of Housing & Urban Affairs </option>
            <option> Ministry of Information & Broadcasting</option>

            <option> Minstry of Jal Shakti </option>
            <option> Ministry of Labour & Employment </option>
            <option> Ministry of Law and Justice </option>
            <option> Ministry of Micro, Small & Medium Enterprises</option>

            <option> Ministry of Mines </option>
            <option> Ministry of Minority Affairs</option>
            <option>  Ministry of New and Renewable Energy</option>
            <option>  Ministry of Overseas Indian Affairs</option>

            <option>  Ministry of Panchayati Raj </option>
            <option> Ministry of Parliyamentary Affairs  </option>
            <option> Ministry of Personnel, Public Grievances & Pensions</option>
            <option> Ministry of Petroleum & Natural Gas </option>

            <option> Ministry of Planning</option>
            <option> Ministry of Power</option>
            <option> Ministry of Railways </option>
            <option> Ministry of Road Transport & Highways</option>


            <option> Ministry of Rural Development </option>
            <option> Ministry of Science & Technology</option>
            <option> Ministry of Ports, Shipping and Waterways</option>
            <option> Ministry of Skill Development and Entrepreneurship </option>



            <option> Ministry of Social Justice & Empowerment </option>
            <option> Ministry of Statistics & Programme Implementation </option>
            <option> Ministry of Steel  </option>
            <option> Ministry of Surface Transport</option>



            <option> Ministry of Textiles </option>
            <option> Ministry of Tourism</option>
            <option> Ministry of Tribal Affairs </option>
            <option> Ministry of Urban Development </option>



            <option> Ministry of  Water Resources, River Development and Ganga Rejuvenation </option>
            <option> Ministry of Women and Child Development</option>
            <option> Ministry of Youth Affairs and Sports </option>
            <option> NITI Aayog</option>


            <option> PM Speech </option>
            <option> EAC-PM </option>
            <option> UPSC </option>
            <option> Special Service and Features </option>


            <option> PIB Headquarters </option>
            <option> Office of Principal Scientific Advisor to GoI </option>
            <option> National Financial Reporting Authority </option>
            <option> Competition Commission of India </option>


            <option> IFSC Authority</option>
            <option> National Security Council Secretariat  </option>

        </Select>
      </FormControl>

      <div className="ml-2">
      <Datepicker/>
      </div>
      <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Title" variant="outlined" value={postdata.title} onChange={handleTitleChange} />
    </Box>
    <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Url" variant="outlined" value={postdata.url} onChange={handleLinkChange} />
    </Box>
      <Stack spacing={2} direction="row" sx={{px:10}}>
      <Button variant="contained" type="submit" sx={{px:5}}>Submit</Button>
    </Stack>
        </form>
    </div>
  )
}

export default ManageVideos