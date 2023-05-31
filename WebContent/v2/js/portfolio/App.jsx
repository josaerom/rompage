import { Provider } from 'react-redux';
import { Route, Routes } from 'react-router-dom';
import PortfolioList from './routes/PortfolioList.jsx'
import PortfolioDetail from './routes/PortfolioDetail.jsx';
import store from './store.js';
import ScrollToTop from './components/common/ScrollToTop.js';

const App = () => {
  
  return (
    <>
      <Provider store={store}>
        <Routes>
          <Route path="/portfolio" element={
            <PortfolioList />
          } />
          <Route path='/portfolio/detail/:portfolioId' element={<PortfolioDetail />} />
        </Routes>
      </Provider>
    </>
  )
}

export default App;