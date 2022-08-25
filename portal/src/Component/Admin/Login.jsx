import React from 'react'
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import { Button } from '@mui/material';


function Login() {
  return (
    <>
    <h1 className='text-center font-semibold text-4xl'>Login</h1>
     <form className='  m-5  grid justify-items-center'  >
        <div className='grid justify-items-center shadow-2xl shadow-slate-200 p-20'>
     <Box
      component="form"
      sx={{
        '& > :not(style)': { m: 1, width: '25ch' },
      }}
      noValidate
      autoComplete="off"
    >
    
      <TextField id="outlined-basic" label="Email" variant="outlined" required/>
      <br />
      <TextField id="outlined-basic" label="Password" variant="outlined" required/>
      <br />
      <Button variant="contained">Submit</Button>
    </Box>
    </div>


    </form>       

    </>
  )
}

export default Login