import { createSlice } from "@reduxjs/toolkit";

let currentPage = createSlice({
    name : 'currentPage',
    initialState : 0
})

export default currentPage;