import { useContext } from "react";
import { Link } from "react-router-dom";
import { ProtfolioDetailContext } from '../PortfolioDetailRender.jsx';

const GoToList = () => {
    const {pageNum} = useContext(ProtfolioDetailContext);
    return (
        
        <div className="pagination-list-wrap">
            <Link to={`/portfolio/${pageNum}`} className="list-button" aria-label="포트폴리오 목록으로 이동">
                List
            </Link>
		</div>
    )
}

export default GoToList;