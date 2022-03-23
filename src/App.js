import './App.css';
import {Route,Switch} from 'react-router-dom'
import Home from './component/Home';
import Navbar from './component/Navbar';
import Shop from './component/Shop';
import Login from './component/Login';
import Footer from './component/Footer';
import Logout from './component/Logout';
import Description from './component/Description';
function App() {
  return (
    <>
      <Navbar />
      <Switch>
        <Route path='/' exact component={Home } />
        <Route path='/shop' exact component={Shop} />
        <Route path='/login' component={Login} />
        <Route path='/logout' component={Logout} />
        <Route path='/description/:id' component={Description} />
      </Switch>
      <Footer />       
    </>
  );
}

export default App;
