import { createSlice } from "@reduxjs/toolkit";

let imageStore = createSlice({
  name : "isLoad",
  initialState : { isLoad : false } ,
  reducers : {
    setIsLoad : function (state, action){
      console.log('siload!@!!!!');
      state.isLoad = true;
    }
  }
})

export let { setIsLoad } = imageStore.actions;

export default imageStore;