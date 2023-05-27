import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import reportWebVitals from './reportWebVitals.jsx';
import App from './App.jsx';

const root = ReactDOM.createRoot(document.getElementById('portfolio'))

root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
);

reportWebVitals();