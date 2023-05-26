const Pagination = ({postsPrePage, totalPosts, handlePage, currentPage}) => {
    const pageNumbers = [];
    console.log(postsPrePage);
    console.log(totalPosts);
    console.log(Math.ceil(totalPosts / postsPrePage));
    const totalPages = Math.ceil(totalPosts / postsPrePage);
    for(let i=1; i<=totalPages; i++){
        pageNumbers.push(i);
    }
    return (
        <div className="pagination">
            <button type="button" className="first" onClick={() => handlePage(1)}><span className="sr-only">처음 페이지로 이동</span></button>
            <button type="button" className="prev" onClick={() => handlePage(currentPage-1)} {...(currentPage === 1 ? {disabled : true} : {})}><span className="sr-only">이전 페이지로 이동</span></button>
            <nav role="navigation" className="navigation">
                <ul>
                    {pageNumbers.map((pageNum)=>(
                        <li key={pageNum} className={currentPage === pageNum? 'active' : ''}>
                            <button type="button" onClick={() => handlePage(pageNum)} {...(currentPage === pageNum? {'aria-current': 'page'} : {})} aria-label={(totalPages)+'페이지 중' + (pageNum) + '페이지'}>{pageNum}</button>
                        </li>
                    ))}
                </ul>
            </nav>
            <button type="button" className="next" onClick={() => handlePage(currentPage+1)} {...(currentPage === totalPages ? {disabled : true} : {})}><span className="sr-only">다음 페이지로 이동</span></button>
            <button type="button" className="last" onClick={() => handlePage(totalPages)}><span className="sr-only">마지막 페이지로 이동</span></button>
        </div>
    )
}

export default Pagination;