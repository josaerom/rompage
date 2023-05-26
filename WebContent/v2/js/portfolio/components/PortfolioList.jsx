import { Link } from 'react-router-dom';
const PortfolioList = ({data = [], currentPage=1}) => {
    if(data.length <= 0){
        return <div>포트폴리오 리스트가 없어요 :(</div>
    }
    console.log(data);
    return(
        <section className="portfolio-list">
            <h2>포트폴리오 목록</h2>
            <div className="pp-wrap">
                <ul>
                    {data.map(({RNUM, THUMBNAIL_IMG, THUMBNAIL_MEMO}) => {
                        return (
                            <li key={RNUM}>   
                            <Link to={`/portfolio/detail/${RNUM}/${currentPage}`}>
                                <div><img src={`/common/img/portfolio/${THUMBNAIL_IMG}`} alt={THUMBNAIL_MEMO} aria-hidden="true" /></div>
                                <h3>{THUMBNAIL_MEMO}</h3>
                            </Link>                             
                                
                            </li>
                        ) 
                    })}
                </ul>
            </div>            
        </section>
    )
}

export default PortfolioList;