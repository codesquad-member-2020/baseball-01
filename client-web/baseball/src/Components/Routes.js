import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Intro from '../Components/Intro';
import NoMatch from './NoMatch';
import MatchUp from './MatchUp';
import Play from './Play';

const Routes = () => {
  return (
    <Router>
      <Switch>
        <Route exact path='/' component={Intro} />
        <Route path='/match' component={MatchUp} />
        <Route path='/play' component={Play} />
        <Route component={NoMatch} />
      </Switch>
    </Router>
  );
};
 
export default Routes;
