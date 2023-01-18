import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Home from './components/Home/Home';
import './App.css';
import Login from './components/authentication/Login/Login';
import SignUp from './components/authentication/SignUp/SignUp';
import Dashboard from './components/Dashboard/Dashboard';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Switch>
          <Route exact path='/'>
            <Home></Home>
          </Route>
          <Route path='/sign-in'>
            <Login></Login>
          </Route>
          <Route path='/sign-up'>
            <SignUp></SignUp>
          </Route>
          <Route path='/dashboard'>
            <Dashboard></Dashboard>
          </Route>

        </Switch>

      </BrowserRouter>
    </div>
  );
}

export default App;
