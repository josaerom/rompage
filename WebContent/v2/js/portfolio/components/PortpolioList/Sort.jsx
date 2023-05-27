import { useDispatch } from "react-redux"

import { setSort, setCurrentPosts } from '../../store/portpolioListSlice.js';
import { setCurrentPage } from '../../store/paginationSlice.js'

const Sort = () => {

  let dispatch = useDispatch();

  const sortType = {
    DESC: 'DESC',
    ASC: 'ASC',
  }
  const sortLabel = {
    [sortType.DESC]: '최신순',
    [sortType.ASC]: '과거순'
  }

  const sortby = (e) => {
    console.log(e.target.value);
    dispatch(setSort(e.target.value))
    dispatch(setCurrentPosts(1));
    dispatch(setCurrentPage(1));
  }

  return (
    <div className="sort">
      <label className="sort-label">정렬</label>
      <select id="sortList" onChange={(e) => sortby(e)}>
        {
          Object.values(sortType).map((item) => <option key={item} value={item}>{sortLabel[item]}</option>)
        }
      </select>
    </div>
  )
}

export default Sort;