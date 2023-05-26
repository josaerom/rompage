import { createSlice } from "@reduxjs/toolkit";

let paginationStore = createSlice({
  name: 'paginationStore',
  initialState: {
    currentPage: 1,
  },
  reducers: {
    setCurrentPage(state, action) {
      state.currentPage = action.payload;
    }
  }
})

export let {setCurrentPage} = paginationStore.actions;

export default paginationStore;