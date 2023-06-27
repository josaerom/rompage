import axios from "axios";
import { useEffect, forwardRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { setTotalPosts, setCurrentPosts } from "../../store/portfolioListSlice.js";
import Item from "./Item.jsx";

const List = (props, forwardRef) => {
  let dispatch = useDispatch();
  let { totalPosts } = useSelector((state) => state.portfolioListStore);

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
        .catch(function (error) {
          console.log(error.toJSON());
        });
    }
  }, []);

  return (
    <>
      <section className="portfolio-list" ref={forwardRef}>
        <h2>포트폴리오 목록</h2>
        <div className="pp-wrap">
          <Item />
        </div>
      </section >
    </>
  )
}

export default forwardRef(List);