
import List from '../components/PortfolioList/List.jsx';
import Pagination from '../components/PortfolioList/Pagination.jsx'
import Sort from '../components/PortfolioList/Sort.jsx';

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