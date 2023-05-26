import { createSlice } from "@reduxjs/toolkit";

const portpolioListStore = createSlice({
  name: 'portpolioListStore',
  initialState: {
    totalPosts: [],
    currentPosts: [],
    postsPrePage : 6, 
  },
  reducers: {
    setTotalPosts(state, action) {
      action.payload.map((item) => {
        state.totalPosts.push(item)
      })
    },
    setCurrentPosts(state, action) {
      let currentPage = action.payload;
      const indexOfLast = currentPage * state.postsPrePage;
		  const indexOfFirst = indexOfLast - state.postsPrePage;

      state.currentPosts = state.totalPosts.slice(indexOfFirst, indexOfLast);
    },
    setSort(state, action){
      state.totalPosts.sort((a,b)=>{
        
      })
    }
  }
})

export let { setTotalPosts, setCurrentPosts } = portpolioListStore.actions;

export default portpolioListStore;