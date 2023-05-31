import axios from "axios";
import { forwardRef } from "react";
import { useEffect, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from 'react-router-dom';
import { setTotalPosts, setCurrentPosts } from "../../store/portfolioListSlice.js";
import Image from "../common/Image.jsx";

const List = (props, forwardRef) => {
  let dispatch = useDispatch();
  let { totalPosts, currentPosts } = useSelector((state) => state.portfolioListStore);


  useEffect(() => {
    if (!!!totalPosts.length) {
      axios.post('/portfolio/getPortfolioList.ajax', null,
        {
          params: {
            sort: 'DESC',
          }
        })
        .then((data) => {
          dispatch(setTotalPosts(data.data));
          dispatch(setCurrentPosts(1));
        })
    }
  }, []);


  return (
    <>
      <section className="portfolio-list" ref={forwardRef}>
        <h2>포트폴리오 목록</h2>
        <div className="pp-wrap">
          {!!currentPosts.length ?
            <ul>
              {currentPosts.map(({ RNUM, THUMBNAIL_IMG, THUMBNAIL_MEMO }) => {
                return (
                  <li key={RNUM}>
                    <Link to={`/portfolio/detail/${RNUM}`}>
                      <div>
                        <Image src={`/common/img/portfolio/${THUMBNAIL_IMG}`} alt={THUMBNAIL_MEMO} ariaHidden />
                      </div>
                      <h3>{THUMBNAIL_MEMO}</h3>
                    </Link>

                  </li>
                )
              })}
            </ul>
            : 'no'}
        </div>
      </section >
    </>
  )
}

export default forwardRef(List);