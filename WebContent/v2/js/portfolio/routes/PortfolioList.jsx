import { useEffect, useState, useRef } from 'react';
import Header from '../components/common/Header.jsx';
import List from '../components/portfolioList/List.jsx';
import Pagination from '../components/portfolioList/Pagination.jsx'
import Sort from '../components/portfolioList/Sort.jsx';

const PortfolioList = () => {
  const ref = useRef()

  let [didMount, setDidMount] = useState(false);

  useEffect(() => {
    setDidMount(true);
    window.scrollTo(0, 0);
    return () => {
      setDidMount(false);
    }
  }, [])

  return (
    <>
      <Header title="포트폴리오" didMount={didMount} />
      <div className="content-wrap">
        <Sort />
        <List ref={ref} />
        <Pagination goToList={ref} />
      </div>
    </>
  )
}

export default PortfolioList;