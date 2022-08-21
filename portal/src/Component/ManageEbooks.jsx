import React,{useState} from 'react'
import {Box,FormControl,TextField,Select,MenuItem, NativeSelect,InputLabel} from "@mui/material";
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import axios from "axios";

const link = 'http://localhost:4000/api/ebooks';

function ManageEbooks() {
  
  const [postdata,setpostdata] = useState({year:'',title:'',url:''});

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
  
  const handleYearChange = (e)=>{
    const newData = {
      ...postdata,year:e.target.value
    }
    setpostdata(newData);
  }
  const handleTitleChange = (e)=>{
    const newData = {
      ...postdata,title:e.target.value
    }
    setpostdata(newData);
  }
  const handleUrlChange = (e)=>{
    const newData = {
      ...postdata,url:e.target.value
    }
    setpostdata(newData);
  }


  return (
    <form method="POST" onSubmit={PostData}>  
        <FormControl sx={{ m: 1, minWidth: 120,width:300}} >
        <InputLabel htmlFor="grouped-native-select">Year</InputLabel>
        <Select native defaultValue="" id="grouped-native-select" label="Year" value={postdata.year} onChange={handleYearChange}>
          
          <option></option>
            <option>2022</option>
            <option>2021</option>
            <option>2020</option>
            <option>2019</option>
            <option >2018</option>
            <option >2017</option>
        </Select>
      </FormControl>

{/* title */}
      <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Title" variant="outlined" value={postdata.title} onChange={handleTitleChange}/>
    </Box>
{/* url */}
    <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Url" variant="outlined" value={postdata.url} onChange={handleUrlChange}/>
    </Box>

      <Stack spacing={2} direction="row" sx={{px:10}}>
      <Button variant="contained" type="submit" sx={{px:5}}>Submit</Button>
    </Stack>
    </form>
  )
}

export default ManageEbooks