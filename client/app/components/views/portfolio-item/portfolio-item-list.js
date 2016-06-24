import React from 'react';
import { Link } from 'react-router';

// Using "Stateless Functional Components"
export default function(props) {
  var divImage = {
    backgroundImage : "url('http://localhost:4000/images/portfolio-placeholder1@1x.png')"
  }
  return (
    <div>
      <main id="portfolio" className="container portfolio-main-container">
        <div className="row flex100vh">
          {props.portfolioItems.map(portfolioItem => {

            return (
              <div key={portfolioItem.id} className="portfolio-item">
                <div className="portfolio-item-cover" style={divImage}> 
                </div>            
                <Link className="portfolio-item-detail"  to={'/portfolio-items/' + portfolioItem.id}>
                  <span>
                    <h3>{portfolioItem.name}</h3>
                    <h4>Hello</h4>          
                  </span>
                </Link>
                <div className="controls">
                  <button onClick={props.deletePortfolioItem.bind(null, portfolioItem.id)} className="delete">Delete</button>
                </div>
              </div>
            );

          })}
        </div>
      </main>
    </div>
  );
}
