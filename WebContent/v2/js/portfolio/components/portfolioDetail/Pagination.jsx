import { Link } from "react-router-dom";
import useDetailContext from "../../store/portfolioDetailContext.jsx";

const Pagination = () => {
  let { portfolioPrev, portfolioNext } = useDetailContext();
  console.log(portfolioPrev);
  console.log(portfolioNext);
  return (
    <>
      {!!portfolioPrev.THUMBNAIL_MEMO &&
        <Link to={`/portfolio/detail/${portfolioPrev.RNUM}`}>
          <div> {portfolioPrev.THUMBNAIL_MEMO} </div>
        </Link>
      }
      {!!portfolioNext.THUMBNAIL_MEMO &&
        <Link to={`/portfolio/detail/${portfolioNext.RNUM}`}>
          <div> {portfolioNext.THUMBNAIL_MEMO} </div>
        </Link>
      }
    </>
  )
}

export default Pagination;