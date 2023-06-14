import { Provider } from 'react-redux';
import { Route, Routes } from 'react-router-dom';
import PortfolioList from './routes/PortfolioList.jsx'
import PortfolioDetail from './routes/PortfolioDetail.jsx';
import Career from './routes/Career.jsx';
import store from './store.js';

const App = () => {

  return (
    <>
      <Provider store={store}>
        <Routes>
          <Route path="/portfolio" element={
            <PortfolioList />
          } />
          <Route path='/portfolio/detail/:portfolioId' element={
            <PortfolioDetail />
          } />
          <Route path='/career' element={
            <Career />
          } />
        </Routes>
      </Provider>
    </>
  )
}

export default App;