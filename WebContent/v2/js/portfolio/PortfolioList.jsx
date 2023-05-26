import React from "react";
import ReactDOM from "react-dom";
import PortfolioListRender from './PortfolioListRender.jsx';
import PortfolioDetailRender from './PortfolioDetailRender.jsx';
import PortfolioListRenderIE from './PortfolioListRenderIE.jsx';
import { Routes, Link  } from 'react-router-dom';
//import { createBrowserHistory } from 'history'

//const newHistory = createBrowserHistory();
//history={newHistory}

const root = document.createElement('div');
root.id = 'root';

document.body.appendChild(root);

const browse = navigator.userAgent.toLowerCase();
if((navigator.appName == 'Netscape' && browse.indexOf('trident') != -1) || browse.indexOf('mise') != -1){
    ReactDOM.render(<PortfolioListRenderIE />, document.querySelector('#portfolio'));
}else{    
    ReactDOM.render(
            <div> test </div>
    , root
    );
}



