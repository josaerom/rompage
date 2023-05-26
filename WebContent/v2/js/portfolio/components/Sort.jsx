export const SortType = {
    DESC : 'DESC',
    ASC : 'ASC',
}
export const SortLabel = {
    [SortType.DESC]: '최신순',
    [SortType.ASC]: '과거순'
}
const Sort = ({onChange}) =>(
    <div className="sort">
        <label className="sort-label" htmlFor="sortList">정렬</label>
        <select id="sortList" onChange={onChange}>
            {Object.values(SortType).map((sortType) => (
                <option key={sortType} value={sortType}>{SortLabel[sortType]}</option>
            ))}
        </select>
    </div>
)

export default Sort;