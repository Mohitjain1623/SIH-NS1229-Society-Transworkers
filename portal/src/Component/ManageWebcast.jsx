import React from 'react'
import {Box,FormControl,TextField,Select,MenuItem, NativeSelect,InputLabel} from "@mui/material";
import Datepicker from "./Date_picker";
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';

function ManageWebcast() {
  return (
    <form>

        {/* month */}
      <FormControl sx={{ m: 1, minWidth: 120,width:300}} >
        <InputLabel htmlFor="grouped-native-select">Month</InputLabel>
        <Select native defaultValue="" id="grouped-native-select" label="Month">
          <option aria-label="None" value="" />
            <option>January</option>
            <option>February</option>
            <option>March</option>
            <option>April</option>
            <option >May</option>
            <option >Jun</option>
            <option>July</option>
            <option>August</option>
            <option>September</option>
            <option >October</option>
            <option >November</option>
            <option >December</option>
        </Select>
      </FormControl>
    <br />
        {/* years */}
      <FormControl sx={{ m: 1, minWidth: 120,width:300}} >
        <InputLabel htmlFor="grouped-native-select">Year</InputLabel>
        <Select native defaultValue="" id="grouped-native-select" label="Year">
          <option aria-label="None" value="" />
            <option>2022</option>
            <option>2021</option>
            <option>2020</option>
            <option>2019</option>
            <option >2018</option>
            <option >2017</option>
        </Select>
      </FormControl>

      
{/* url */}
<Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Url" variant="outlined" />
    </Box>

    <Stack spacing={2} direction="row" sx={{px:10}}>
      <Button variant="contained" sx={{px:5}}>Submit</Button>
    </Stack>
    </form>
  )
}

export default ManageWebcast