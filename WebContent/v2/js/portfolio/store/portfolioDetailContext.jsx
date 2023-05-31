import axios from "axios";
import { useContext, useEffect, useState, createContext } from "react";
import { useParams } from "react-router-dom";

const DetailContext = createContext();

export const DetailProvider = ({ children }) => {
  let { portfolioId } = useParams();
  let [portfolioInfo, setPortfolioInfo] = useState([]);
  let [portfolioDetail, setPortfolioDetail] = useState([]);
  let [portfolioPrev, setPortfolioPrev] = useState([]);
  let [portfolioNext, setPortfolioNext] = useState([]);

  useEffect(() => {
    axios.post('/portfolio/getPortfolioDetail.ajax', null, {
      params: {
        rNum: portfolioId,
      }
    })
      .then((result) => {
        setPortfolioInfo(result.data.info);
        setPortfolioDetail(result.data.detail);
        setPortfolioPrev(result.data.prev);
        setPortfolioNext(result.data.next);
      })
  }, [portfolioId])

  return <DetailContext.Provider value={{portfolioInfo, portfolioDetail, portfolioPrev, portfolioNext}}>{children}</DetailContext.Provider>
}

const useDetailContext = () => {
  return useContext(DetailContext);
}

export default useDetailContext;

