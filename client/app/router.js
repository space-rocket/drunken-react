import React from 'react';
import { Router, Route, browserHistory, IndexRoute } from 'react-router';

// Layouts
import MainLayout from './components/layouts/main-layout';
import SearchLayoutContainer from './components/containers/search/search-layout-container';

// Pages
import Home from './components/pages/home';
import About from './components/pages/about';
import UserListContainer from './components/containers/user/user-list-container';
import UserProfileContainer from './components/containers/user/user-profile-container';
import WidgetListContainer from './components/containers/widget/widget-list-container';
import PortfolioItemListContainer from './components/containers/portfolio-item/portfolio-item-list-container';
import SinglePortfolioItemContainer from './components/containers/portfolio-item/single-portfolio-item-container';

export default (
  <Router history={browserHistory}>
    <Route component={MainLayout}>
      <Route path="/" component={Home} />

        <Route path="about">
          <IndexRoute component={About} />
        </Route>

        <Route path="users">
          <Route component={SearchLayoutContainer}>
            <IndexRoute component={UserListContainer} />
          </Route>
          <Route path=":userId" component={UserProfileContainer} />
        </Route>

        <Route path="widgets">
          <Route component={SearchLayoutContainer}>
            <IndexRoute component={WidgetListContainer} />
          </Route>
        </Route>

        <Route path="portfolio-items">
          <Route component={SearchLayoutContainer}>
            <IndexRoute component={PortfolioItemListContainer} />
          </Route>
          <Route path=":portfolioItemId" component={SinglePortfolioItemContainer} />
        </Route>

    </Route>
  </Router>
);