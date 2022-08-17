import React from 'react'
import {Box,FormControl,TextField,Select,MenuItem, NativeSelect,InputLabel} from "@mui/material";
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';

function ManageEbooks() {
  return (
    <form>  
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

{/* title */}
      <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '35ch' },
      }}
      noValidate
      autoComplete="off"
    >
      <TextField id="outlined-basic" label="Title" variant="outlined" />
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
      <TextField id="outlined-basic" label="Url" variant="outlined" />
    </Box>

      <Stack spacing={2} direction="row" sx={{px:10}}>
      <Button variant="contained" sx={{px:5}}>Submit</Button>
    </Stack>
    </form>
  )
}

export default ManageEbooks