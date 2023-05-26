import axios from 'axios';
import React from "react";
import {SortType, SortLabel} from "./components/Sort.jsx";

export default class PortfolioListRenderIE extends React.Component{
    constructor(){
		super();

		this.state = {
			didMount: false,
			error: null,
			isLoaded: false,
			portfolioList : [],
			currentPage: 1,
			postsPrePage: 9,
            buttonVisible: false,
		};
	}	
	componentDidMount(){
		
		setTimeout(()=>{
			this.setState({
				didMount: true
			})
		}, 200)
		
		this.handleSort();

        window.addEventListener('scroll', () => this.handleScroll());
		/*fetch('/portfolio/getPortfolioList.ajax')
		.then(res => res.json())
		.then(			
			(result) => {
				console.log('result' + result);
				this.setState({
					isLoaded: true,
					portfolioList: result
				})
			},
			(error) => {
				console.log(error);
				this.setState({
					isLoaded,
					error,
					isLoaded,
					portfolioList: []
				})
			}
		)*/
	}
	
	handleSort(event){
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
		
		axios.post('/portfolio/getPortfolioList.ajax', null, 
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
		}).then(			
			(response) => {
				console.log('result' + response);
				console.log('result' + response.data);
				this.setState({
					isLoaded: true,
					portfolioList: response.data
				})
			}
		)
		.catch((error) => {
			console.log(error);
			this.setState({
				isLoaded: false,
				error,
				portfolioList: []
			})
		})
	}
	
	handlePage(pageNum){
		console.log(pageNum);
		this.setState({
			currentPage : pageNum,
		})
	}
    handleScroll(){
        console.log(document.documentElement.scrollTop );
        document.documentElement.scrollTop > 700 ? this.setState({buttonVisible :true}) : this.setState({buttonVisible:false});
    }
    handleGoToTop() {
        window.scrollTo({
            top : 0,
            behavior : 'smooth',
        });
        this.setState({
            buttonVisible:false
        });
    }
    
    render(){
        const {didMount, portfolioList, currentPage, postsPrePage, buttonVisible} = this.state;

        const indexOfLast = currentPage * postsPrePage;
		const indexOfFirst = indexOfLast - postsPrePage;	
		let currentPosts = portfolioList.slice(indexOfFirst, indexOfLast);
        
        const Header = (
            <section className={"top-banner"+ (didMount ? ' active' : '')} >
                <div className="top-banner-bg">
                    <div className="inner-wrap">
                        <div className={"title-motion "+(didMount ? ' active' : '')} aria-hidden="true">
                            <span>P</span><span>O</span><span>R</span><span>T</span><span>F</span><span>O</span><span>L</span><span>I</span><span>O</span>
                        </div>
                        <h1 className="sr-only">포트폴리오 목록</h1>
                    </div>
                </div>
            </section>
        )

        const Sort = (
            <div className="sort">
                <label htmlFor="sortList">정렬</label>
                <select id="sortList" onChange={(event)=> this.handleSort(event)}>
                    {Object.values(SortType).map((sortType) => (
                        <option key={sortType} value={sortType}>{SortLabel[sortType]}</option>
                    ))}
                </select>
            </div>
        )

        const PortfolioList = 
            currentPosts.length <= 0 ? (
                <div>포트폴리오 리스트가 없어요 :(</div>
            ) : (
                <section className="portfolio-list">
                    <h2>포트폴리오 목록</h2>
                    <div className="pp-wrap">
                        <ul>
                            {currentPosts.map(({RNUM, THUMBNAIL_IMG, THUMBNAIL_MEMO}) => {
                                return (
                                    <li key={RNUM}>
                                        <a href="/detail">
                                            <div><img src={`/common/img/portfolio/${THUMBNAIL_IMG}`} alt={THUMBNAIL_MEMO} aria-hidden="true" /></div>
                                            <h3>{THUMBNAIL_MEMO}</h3>
                                        </a>
                                    </li>
                                ) 
                            })}
                        </ul>
                    </div>            
                </section>
            );

        const pageNumbers = [];
        const totalPages = Math.ceil(portfolioList.length / postsPrePage);
        for(let i=1; i<=totalPages; i++){
            pageNumbers.push(i);
        }
        const Pagination = (
            <div className="pagination">
                <nav>
                    <ul>
                        {pageNumbers.map((pageNum)=>(
                            <li key={pageNum} className={currentPage === pageNum? 'active' : ''}>
                                <button type="button" onClick={() => this.handlePage(pageNum)} aria-label={(totalPages)+'페이지 중' + (pageNum) + '페이지'}>{pageNum}</button>
                            </li>
                        ))}
                    </ul>
                </nav>
            </div>
        );

        const Top = (
            <div className={"scroll-wrap" + (buttonVisible ? ' active' : '')}>
                <div className="top-btn"><button type="button" aria-label="제일 위로 이동" onClick={() => this.handleGoToTop()}>TOP</button></div>
            </div>
        );
        
        return (
            <>
                {Header}
                <div className="content-wrap">
					<div className="sort-box">
                        {Sort}
					</div>				
                    {PortfolioList}
                    {Pagination}	
				</div>
                {Top}
            </>
        )
    }
}