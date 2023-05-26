import { useContext } from 'react';
import {ProtfolioDetailContext} from '../PortfolioDetailRender.jsx';

const PortfolioDetail = ()=>{
    const {portfolioDetail = [], portfolioInfo ={}} = useContext(ProtfolioDetailContext);
    
    return(
        <section className="portfolio-detail">
            <h2 className="page-title">포트폴리오 상세</h2>
            <div className="pp-wrap">
                <div className="title-wrap">
                    <h3 className="title">{portfolioInfo.THUMBNAIL_MEMO}</h3>
                </div>
                <div className="body-wrap">
                    <div>
                        <dl>
                            <dt>발주처</dt>
                            <dd>{portfolioInfo.ORDER_ORG}</dd>
                            <dt>기간</dt>
                            <dd>{portfolioInfo.SDATE} ~ {portfolioInfo.EDATE}</dd>
                            <dt>참여인원</dt>
                            <dd>{portfolioInfo.PERSONNEL}</dd>
                            <dt>참여도</dt>
                            <dd>{portfolioInfo.PERCENT}</dd>
                            <dt>사용기술 및 언어</dt>
                            <dd>{portfolioInfo.TECHNIC}</dd>
                        </dl>
                        <p className="detail-desc" dangerouslySetInnerHTML={{__html: portfolioInfo.CONTENT }}></p>
                    </div>
                    <div>
                    {portfolioDetail.map(({RNUM, IMG, MEMO}) => {
                        return (
                            <div key={RNUM}>
                                <div><img src={`/common/img/portfolio/${IMG}`} alt={IMG} /></div>
                                <p dangerouslySetInnerHTML={{__html:MEMO}}></p>
                            </div>
                        )
                    })}
                    </div>
                </div>
            </div>         
        </section>
    )
}

export default PortfolioDetail;