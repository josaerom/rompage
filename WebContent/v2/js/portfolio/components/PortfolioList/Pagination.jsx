import { useSelector, useDispatch } from "react-redux";

import { setCurrentPage } from '../../store/paginationSlice.js';
import { setCurrentPosts } from '../../store/portfolioListSlice.js';

const Pagination = () => {
  let { totalPosts, postsPrePage } = useSelector((state) => state.portfolioListStore);
  let { currentPage } = useSelector((state) => state.paginationStore)

  let pageCount = Math.ceil(totalPosts.length / postsPrePage);
  console.log(pageCount);

  let dispatch = useDispatch();

  const hendelCurrentPage = (idx) => {
    dispatch(setCurrentPosts(idx));
    dispatch(setCurrentPage(idx));
  }

  return (
    <>
      {pageCount > 0 &&
        <div className="pagination">
          <button type="button" className="first" onClick={() => {hendelCurrentPage(1)}}><span className="sr-only">처음 페이지로 이동</span></button>
          <button type="button" className="prev" onClick={() => hendelCurrentPage(currentPage - 1)} {...(currentPage === 1 ? { disabled: true } : {})}><span className="sr-only">이전 페이지로 이동</span></button>
          <nav role="navigation" className="navigation">
            <ul>
              {
                Array(pageCount).fill(0).map((item, idx) => {
                  return (
                    <li key={idx} className={currentPage === idx + 1 ? 'active' : ''}>
                      <button type="button" onClick={() => hendelCurrentPage(idx + 1)}>{idx + 1}</button>
                    </li>
                  )
                })
              }
            </ul>
          </nav>
          <button type="button" className="next" onClick={() => hendelCurrentPage(currentPage + 1)} {...(currentPage === pageCount ? { disabled: true } : {})}><span className="sr-only">다음 페이지로 이동</span></button>
          <button type="button" className="last" onClick={() => hendelCurrentPage(pageCount)}><span className="sr-only">마지막 페이지로 이동</span></button>
        </div>
      }
    </>
  )
}

export default Pagination;