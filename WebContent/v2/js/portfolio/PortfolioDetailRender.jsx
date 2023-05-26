import axios from 'axios';
import React, { createContext, useContext } from "react";
import { useEffect, useState } from "react";
import GoToList from './components/GoToList.jsx';
import Header from "./components/Header.jsx";
import PortfolioDetail from './components/PortfolioDetail.jsx';
import Top from './components/Top.jsx';
import { useParams } from "react-router-dom";

export let ProtfolioDetailContext = createContext();

const PortfolioDetailRender = ()=>{
	const [didMount, setDidMount] = useState(false);
	const [portfolioDetail, setPortfolioDetail] = useState([]);
	const [portfolioInfo, setPortfolioInfo] = useState([]);
	const {rNum, pageNum} = useParams();
	
	useEffect(()=>{
		console.log('setTimeout');
		setTimeout(()=>{
			setDidMount(true);
		}, 200);
	});
	useEffect(()=>{
		//const rNum = document.querySelector('[name=rNum]').value;
		axios.post('/portfolio/getPortfolioDetail.ajax', null, 
		{
			params: { 
				rNum: rNum,
			}
		},
		{
			headers:{ 
				'Content-type': 'application/json', 
				'Accept': 'application/json' 
			} 
		}).then(			
			(response) => {
				console.log('result' + response);
				console.log('result' + response.data.detail);
				setPortfolioDetail(response.data.detail);
				setPortfolioInfo(response.data.info);
			}
		)
		.catch((error) => {
			console.log(error);
		})
		
		
		
	}, []);

	
	return (
		<ProtfolioDetailContext.Provider value={{portfolioDetail, portfolioInfo, pageNum}}>
			<Header title="포트폴리오 상세설명" didMount={didMount} />			
			<div className="content-wrap">
				<PortfolioDetail />
				<GoToList />
			</div>
			<Top />
		</ProtfolioDetailContext.Provider>
	)
}
export default PortfolioDetailRender;