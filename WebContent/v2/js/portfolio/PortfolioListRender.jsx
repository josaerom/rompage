import axios from 'axios';
import React from "react";
import { withRouter } from 'react-router-dom';
import Header from "./components/Header.jsx";
import Pagination from './components/Pagination.jsx';
import PortfolioList from "./components/PortFolioList.jsx";
import Sort, {SortType} from "./components/Sort.jsx";
import Top from "./components/Top.jsx";


export default class PortfolioListRender extends React.Component{	
	constructor(){
		super();

		this.state = {
			didMount: false,
			error: null,
			isLoaded: false,
			portfolioList : [],
			currentPage: 1,
			postsPrePage: 6,
		};
	}	
	componentDidMount(){
		
		setTimeout(()=>{
			this.setState({
				didMount: true
			})
		}, 200)
		
		this.handleSort();
		
	}
	
	async handleSort(event){
		console.log(event);
		typeof event != 'undefined' && console.log(event.target.value);
		let selectedSortValue = SortType.DESC;
		if(typeof event != 'undefined'){
			this.setState({
				selectedSort :event.target.value,
				currentPage : 1,
			}); 
			selectedSortValue = event.target.value;
		}
		
		const response = await axios.post('/portfolio/getPortfolioList.ajax', null, 
		{
			params: { 
				sort: selectedSortValue,
			}
		},
		{
			headers:{ 
				'Content-type': 'application/json', 
				'Accept': 'application/json' 
			} 
		});
		this.setState({
			isLoaded: true,
			portfolioList: response.data
		})
	}
	
	handlePage(pageNum){
		console.log(pageNum);
		this.setState({
			currentPage : pageNum,
		})
	}
	
	render(){
		const {didMount, error, isLoaded, portfolioList, currentPage, postsPrePage} = this.state;
		
		const indexOfLast = currentPage * postsPrePage;
		const indexOfFirst = indexOfLast - postsPrePage;	
		let currentPosts = portfolioList.slice(indexOfFirst, indexOfLast);
		
		return (
			<>
				<Header title="포트폴리오 목록" didMount={didMount} />
				<div className="content-wrap">
					<div className="sort-box">
						<Sort onChange={(event)=> this.handleSort(event)} />
					</div>
					<PortfolioList data={currentPosts} currentPage={currentPage}/>
					<Pagination postsPrePage={postsPrePage} totalPosts={portfolioList.length} handlePage={(pageNum) => this.handlePage(pageNum)} currentPage={currentPage} />
				</div>
				<Top />
			</>
		)
	}
}