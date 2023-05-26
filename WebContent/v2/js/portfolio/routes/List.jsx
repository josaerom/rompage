import axios from "axios";
import { useEffect, useState } from "react";
import { Link } from 'react-router-dom';

const List = () => {
  let [list, setList] = useState([]);

  useEffect(() => {
    let list = axios.post('/portfolio/getPortfolioList.ajax', null,
      {
        params: {
          sort: 'DESC',
        }
      })
      .then((data) => {
        setList(data.data);
      })
  }, []);

  return (
    <>
      <section className="portfolio-list">
        <h2>포트폴리오 목록 test</h2>
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