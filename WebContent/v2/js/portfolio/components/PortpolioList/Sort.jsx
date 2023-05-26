const Sort = () => {

  const sortType = {
    DESC: 'DESC',
    ASC: 'ASC',
  }
  const sortLabel = {
    [sortType.DESC]: '최신순',
    [sortType.ASC]: '과거순'
  }

  return (
    <div className="sort">
      <label className="sort-label">정렬</label>
      <select id="sortList" >
        {
          Object.values(sortType).map((item) =>  <option key={item} value={item}>{sortLabel[item]}</option> )
        }
      </select>
    </div>
  )
}

export default Sort;