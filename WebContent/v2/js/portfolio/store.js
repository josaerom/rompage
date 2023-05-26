import { configureStore } from "@reduxjs/toolkit";
import paginationStore from "./store/paginationSlice.js";
import portpolioListStore from "./store/portpolioListSlice.js";

export default configureStore({
  reducer: {
    paginationStore : paginationStore.reducer,
    portpolioListStore : portpolioListStore.reducer,
  }
})