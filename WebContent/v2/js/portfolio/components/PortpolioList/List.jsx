import axios from "axios";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from 'react-router-dom';
import { setList } from "../../store/portpolioListSlice.js";

const List = () => {
  let dispatch =  useDispatch();
  let  {list} = useSelector((state)=>state)
  let { currentPage } = useSelector((state) => state);

  const postsPrePage = 6;
  
  console.log(list)
  useEffect(() => {
    let list = axios.post('/portfolio/getPortfolioList.ajax', null,
      {
        params: {
          sort: 'DESC',
        }
      })
      .then((data) => {
        dispatch(setList(data.data));
        console.log(list)
      })

      return () => {
        list = [];
      }
  }, []);

  useEffect(()=>{
    const indexOfLast = currentPage * postsPrePage;
		const indexOfFirst = indexOfLast - postsPrePage;	
		list = list.slice(indexOfFirst, indexOfLast);
  }, [currentPage])

  return (
    <>
      <section className="portfolio-list">
        <h2>포트폴리오 목록</h2>
        <div className="pp-wrap">
        {!!list.length ?
          <ul>
            {list.map(({ RNUM, THUMBNAIL_IMG, THUMBNAIL_MEMO }) => {
              return (
                <li key={RNUM}>
                  <Link to={`/portfolio/detail/${RNUM}`}>
                    <div><img src={`/common/img/portfolio/${THUMBNAIL_IMG}`} alt={THUMBNAIL_MEMO} aria-hidden="true" /></div>
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

export default List;