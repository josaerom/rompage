import { createSlice } from "@reduxjs/toolkit";

const portfolioListStore = createSlice({
  name: 'portfolioListStore',
  initialState: {
    totalPosts: [],
    currentPosts: [],
    postsPrePage: 6,
  },
  reducers: {
    restTotalPosts(state) {
      state.totalPosts = [];
    },
    setTotalPosts(state, action) {
      state.totalPosts = action.payload
    },
    setCurrentPosts(state, action) {
      let currentPage = action.payload;
      const indexOfLast = currentPage * state.postsPrePage;
      const indexOfFirst = indexOfLast - state.postsPrePage;

      state.currentPosts = state.totalPosts.slice(indexOfFirst, indexOfLast);
    },
    setSort(state) {
      state.totalPosts = state.totalPosts.reverse();
    }
  }
})

export let { restTotalPosts, setTotalPosts, setCurrentPosts, setSort } = portfolioListStore.actions;

export default portfolioListStore;