import React from 'react';

// Using "Stateless Functional Components"
export default function(props) {
  return (
    <div className="user-profile">
      <div className="details">
      	<img src={props.image} />
        <p>{props.name}</p>
      </div>
    </div>
  );
}
