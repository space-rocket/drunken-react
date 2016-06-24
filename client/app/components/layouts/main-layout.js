import React from 'react';
import { Link } from 'react-router';
import classNames from 'classnames';

// Using "Stateless Functional Components"
export default function(props) {

  var homepageHeaderClass = classNames({
    'homepage-header': false
  });
  if (window.location.pathname == '/') {
    homepageHeaderClass = 'site-header homepage-header';
  } else {
    homepageHeaderClass = 'site-header'
  };
  return (
    <div>
      <header id="header" className={homepageHeaderClass}>
        <div className="container header-container">
          <nav className="navbar navbar-default">
            <div className="container-fluid">
              <ul className="nav navbar-nav navbar-right">
                <li><Link to="/" activeClassName="active">Home</Link></li>
                <li><Link to="/users" activeClassName="active">Users</Link></li>
                <li><Link to="/widgets" activeClassName="active">Widgets</Link></li>
                <li><Link to="/portfolio-items" activeClassName="active">Portfolio</Link></li>
              </ul>
            </div>
          </nav>
        </div>
      </header>
      <main className="container theme-showcase">
       {props.children}
      </main>
    </div>
    );
}
