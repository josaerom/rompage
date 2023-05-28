import { useEffect, useState } from 'react';
import Header from '../components/portfolioList/Header.jsx';
import List from '../components/portfolioList/List.jsx';
import Pagination from '../components/portfolioList/Pagination.jsx'
import Sort from '../components/portfolioList/Sort.jsx';

const PortfolioList = () => {
  let [didMount, setDidMount] = useState(false);

  useEffect(() => {
    setDidMount(true);
    return () => {
      setDidMount(false);
    }
  }, [])

  return (
    <>
      <Header title="포트폴리오" didMount={didMount} />
      <div className="content-wrap">
        <Sort />
        <List />
        <Pagination />
      </div>
    </>
  )
}

export default PortfolioList;