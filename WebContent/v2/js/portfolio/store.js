import { configureStore } from "@reduxjs/toolkit";
import paginationStore from "./store/paginationSlice.js";
import portfolioListStore from "./store/portfolioListSlice.js";

export default configureStore({
  reducer: {
    paginationStore : paginationStore.reducer,
    portfolioListStore : portfolioListStore.reducer,
  }
})