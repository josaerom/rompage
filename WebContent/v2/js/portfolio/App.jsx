
import { Provider } from 'react-redux';
import { Route, Routes } from 'react-router-dom';
import PortfolioList from './routes/PortfolioList.jsx'
import PortfolioDetail from './routes/PortfolioDetail.jsx';
import store from './store.js';

const App = () => {
  return (
    <>
      <Routes>
        <Route path="/portfolio" element={
          <Provider store={store}>
            <PortfolioList />
          </Provider>
        } />
        <Route path='/portfolio/detail' element={<PortfolioDetail />} />
      </Routes>
    </>
  )
}

export default App;