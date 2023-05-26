import { configureStore } from "@reduxjs/toolkit";
import currentPage from "./store/paginationSlice.js";
import list from "./store/portpolioListSlice.js";

export default configureStore({
  reducer: {
    currentPage : currentPage.reducer,
    list : list.reducer,
  }
})