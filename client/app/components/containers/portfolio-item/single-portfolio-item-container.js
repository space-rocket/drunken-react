import React from 'react';
import { connect } from 'react-redux';
import SinglePortfolioItem from '../../views/portfolio-item/single-portfolio-item';
import * as portfolioItemApi from '../../../api/portfolio-item-api';

const SinglePortfolioItemContainer = React.createClass({

  componentDidMount: function() {
    let portfolioItemId = this.props.params.portfolioItemId
    portfolioItemApi.getSinglePortfolioItem(portfolioItemId)
  },

  render: function() {
    return (
      <SinglePortfolioItem {...this.props.portfolio} />
    );
  }

});

const mapStateToProps = function(store) {
  return {
    portfolio: store.portfolioItemState.singlePortfolioItem
  };
};

export default connect(mapStateToProps)(SinglePortfolioItemContainer);
