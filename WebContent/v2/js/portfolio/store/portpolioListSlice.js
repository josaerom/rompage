import { createSlice } from "@reduxjs/toolkit";

const portpolioListStore = createSlice({
  name: 'portpolioListStore',
  initialState: {
    totalPosts: [],
    currentPosts: [],
    postsPrePage: 6,
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
    setSort(state, action) {
      console.log(action.payload);
      let sortby = action.payload;
      state.totalPosts = state.totalPosts.sort((a, b) => {
        switch (sortby) {
          case 'DESC':
            if (Number(a.RNUM) < Number(b.RNUM)) return 1;
            if (Number(a.RNUM) > Number(b.RNUM)) return -1;
            return 0;
          case 'ASC':
            if (Number(a.RNUM) > Number(b.RNUM)) return 1;
            if (Number(a.RNUM) < Number(b.RNUM)) return -1;
            return 0;
        }
      })

    }
  }
})

export let { setTotalPosts, setCurrentPosts, setSort } = portpolioListStore.actions;

export default portpolioListStore;