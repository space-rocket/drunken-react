import React from 'react';
import { Link } from 'react-router';

const Home = React.createClass({
  render: function() {
    return (
      <div className="jumbotron">
        <h1>Build Productive, Reliable, Fast Web Apps with Elixir/Phoenix and React.JS</h1>
        <p className="text-center">
            <a className="btn btn-primary btn-lg" href="https://github.com/bigbassroller/drunken-react">Download on Github</a>
        </p>
      </div>
    );
  }
});

export default Home;
