
import List from '../components/portfolioList/List.jsx';
import Pagination from '../components/portfolioList/Pagination.jsx'
import Sort from '../components/portfolioList/Sort.jsx';

const PortfolioList = () => {
  return (
    <>
      <Sort />
      <List />
      <Pagination />
    </>
  )
}

export default PortfolioList;