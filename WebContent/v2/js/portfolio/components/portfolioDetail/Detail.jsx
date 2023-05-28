
import { useNavigate } from "react-router-dom";

import useDetailContext from "../../store/portfolioDetailContext.jsx";
import Pagination from "../../components/portfolioDetail/Pagination.jsx";

const Detail = () => {
  let { portfolioInfo, portfolioDetail } = useDetailContext();
  console.log(portfolioInfo);
  console.log(portfolioDetail);

  let navigation = useNavigate();
  return (
    <>
      <section className="content-wrap">
        <h2 className="content-title">PORTFOLIO DETAIL</h2>
        <h3 className="pf-title">{portfolioInfo.THUMBNAIL_MEMO}</h3>
        <div className="head-wrap">
          <div className="thumbnail-wrap">
            <img src={`/common/img/portfolio/${portfolioInfo.THUMBNAIL_IMG}`} />
          </div>
          <div className="info-wrap">
            <dl className="info">
              {
                portfolioInfo.ORDER_ORG &&
                <>
                  <dt>발주처</dt>
                  <dd>{portfolioInfo.ORDER_ORG}</dd>
                </>
              }
              {
                portfolioInfo.SDATE &&
                <>
                  <dt>기간</dt>
                  <dd>{portfolioInfo.SDATE} ~ {portfolioInfo.EDATE}</dd>
                </>
              }
              {
                portfolioInfo.PERSONNEL &&
                <>
                  <dt>참여인원</dt>
                  <dd>{portfolioInfo.PERSONNEL}</dd>
                </>
              }
              {
                portfolioInfo.PERCENT &&
                <>
                  <dt>참여도</dt>
                  <dd>{portfolioInfo.PERCENT}</dd>
                </>
              }
              {
                portfolioInfo.TECHNIC &&
                <>
                  <dt>사용기술 및 언어</dt>
                  <dd>{portfolioInfo.TECHNIC}</dd>
                </>
              }
            </dl>
            <p className="detail-desc" dangerouslySetInnerHTML={{ __html: portfolioInfo.CONTENT }}></p>
          </div>
        </div>
        <div className="body-wrap">
          {portfolioDetail.map(({ RNUM, IMG, MEMO }) => {
            return (
              <div className="section" key={RNUM}>
                <img src={`/common/img/portfolio/${IMG}`} alt={IMG} />
                <p dangerouslySetInnerHTML={{ __html: MEMO }}></p>
              </div>
            )
          })}
        </div>
        <Pagination />
      </section>
    </>
  )
}

export default Detail;