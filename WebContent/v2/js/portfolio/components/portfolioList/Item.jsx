import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import Image from "../common/Image.jsx";

const Item = () => {
  let { currentPosts } = useSelector((state) => state.portfolioListStore)
  return (
    <>
      {!!currentPosts.length ?
        <ul>
          {currentPosts.map(({ RNUM, THUMBNAIL_IMG, THUMBNAIL_MEMO }) => {
            return (
              <li key={RNUM}>
                <Link to={`/portfolio/detail/${RNUM}`}>
                  <div>
                    <Image src={`/common/img/portfolio/${THUMBNAIL_IMG}`} className="lazyload" alt={THUMBNAIL_MEMO} ariaHidden="true" />
                  </div>
                  <h3>{THUMBNAIL_MEMO}</h3>
                </Link>
              </li>
            )
          })}
        </ul>
        : <ul>
          <li><div className="blank_area"></div></li>
          <li><div className="blank_area"></div></li>
          <li><div className="blank_area"></div></li>
        </ul>}
    </>
  )
}
export default Item;