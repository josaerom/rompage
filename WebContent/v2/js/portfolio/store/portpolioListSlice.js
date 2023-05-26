import { createSlice } from "@reduxjs/toolkit";

const list = createSlice({
  name : 'list',
  initialState : [],
  reducers : {
    setList(state, action ){
      console.log(state)
      console.log(action.payload)
      action.payload.map((item)=>{
        console.log(item)
        state.push(item)
      })
    }
  }
})

export let { setList } = list.actions;

export default list;