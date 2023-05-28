import { createSlice } from "@reduxjs/toolkit";

const portfolioListStore = createSlice({
  name: 'portfolioListStore',
  initialState: {
    totalPosts: [],
    currentPosts: [],
    postsPrePage: 6,
    sortOrder : 'DESC'
  },
  reducers: {
    setTotalPosts(state, action) {
      state.totalPosts = action.payload
    },
    setCurrentPosts(state, action) {
      let currentPage = action.payload;
      const indexOfLast = currentPage * state.postsPrePage;
      const indexOfFirst = indexOfLast - state.postsPrePage;

      state.currentPosts = state.totalPosts.slice(indexOfFirst, indexOfLast);
    },
    setSort(state, action) {
      state.totalPosts = state.totalPosts.reverse();
      state.sortOrder = action.payload;
    }
  }
})

export let { setTotalPosts, setCurrentPosts, setSort } = portfolioListStore.actions;

export default portfolioListStore;