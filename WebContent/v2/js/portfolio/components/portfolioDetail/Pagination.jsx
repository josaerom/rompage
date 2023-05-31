import { Link } from "react-router-dom";
import useDetailContext from "../../store/portfolioDetailContext.jsx";

const Pagination = () => {
  let { portfolioPrev, portfolioNext } = useDetailContext();
  return (
    <>
      <div className="pagination-nav-wrap">
        <dl>
          {!!portfolioPrev.THUMBNAIL_MEMO &&
            <>
              <dt>다음 포트폴리오</dt>
              <dd><Link onClick={()=>{window.scrollTo(0, 0)}} to={`/portfolio/detail/${portfolioPrev.RNUM}`}>
                {portfolioPrev.THUMBNAIL_MEMO}
              </Link></dd>
            </>
          }
          {!!portfolioNext.THUMBNAIL_MEMO &&
            <>
              <dt>이전 포트폴리오</dt>
              <dd>
                <Link onClick={()=>{window.scrollTo(0, 0)}} to={`/portfolio/detail/${portfolioNext.RNUM}`}>
                  {portfolioNext.THUMBNAIL_MEMO}
                </Link>
              </dd>
            </>
          }
        </dl>
      </div>
      <div className="pagination-list-wrap">
        <Link to="/portfolio" className="list-button">목록</Link>
      </div>
    </>
  )
}

export default Pagination;