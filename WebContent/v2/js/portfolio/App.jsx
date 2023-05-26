import PortpolioList from './routes/PortpolioList.jsx'

import { Provider } from 'react-redux';
import store from './store.js';

const App = () => {
    return (
        <Provider store={store}>
            <PortpolioList />
        </Provider>
    )
}

export default App;