import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Intro from './Intro';
import NoMatch from './NoMatch';
import Match from './Match';
import Play from './Play';

const Routes = () => {
  return (
    <Router>
      <Switch>
        <Route exact path='/' component={Intro} />
        <Route path='/match' component={Match} />
        <Route path='/play' component={Play} />
        <Route component={NoMatch} />
      </Switch>
    </Router>
  );
};
 
export default Routes;
