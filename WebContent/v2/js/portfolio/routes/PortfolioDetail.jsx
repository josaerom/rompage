import Detail from "../components/portfolioDetail/Detail.jsx";
import Pagination from "../components/portfolioDetail/Pagination.jsx";

import { DetailProvider } from "../store/portfolioDetailContext.jsx";

const PortfolioDetail = () => {
  return (
    <>
      <DetailProvider>
        <Detail />
        <Pagination />
      </DetailProvider>
    </>
  )
}

export default PortfolioDetail;