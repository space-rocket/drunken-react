import React from 'react';
import { Link } from 'react-router';

const About = React.createClass({

  render: function() {
    return (
      <div className="home-page">
        <h1>About Page</h1>
        <p>
          <Link to="/home" className="btn btn-primary btn-lg" activeClassName="active">Go Back Home</Link>
        </p>
      </div>
    );
  }
});

export default About;
