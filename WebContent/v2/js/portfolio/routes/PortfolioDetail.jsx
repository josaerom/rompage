import { useEffect, useState } from 'react';
import Header from '../components/portfolioList/Header.jsx';
import Detail from "../components/portfolioDetail/Detail.jsx";


import { DetailProvider } from "../store/portfolioDetailContext.jsx";

const PortfolioDetail = () => {
  let [didMount, setDidMount] = useState(false);

  useEffect(() => {
    setDidMount(true);
    return () => {
      setDidMount(false);
    }
  }, [])

  return (
    <>
      <div id="portfolio-detail">
        <Header title="포트폴리오" didMount={didMount} />
        <DetailProvider>
          <Detail />
        </DetailProvider>
      </div>
    </>
  )
}

export default PortfolioDetail;