import React from 'react';
import { connect } from 'react-redux';
import PortfolioItemList from '../../views/portfolio-item/portfolio-item-list';
import * as portfolioItemApi from '../../../api/portfolio-item-api';
import store from '../../../store';
import { loadSearchLayout } from '../../../actions/search-layout-actions';

const PortfolioItemListContainer = React.createClass({

  componentDidMount: function() {
    portfolioItemApi.getPortfolioItems();
    store.dispatch(loadSearchLayout('portfolioItems', 'Portfolio Item Results:'));
  },

  render: function() {
    return (
      <PortfolioItemList portfolioItems={this.props.portfolioItems} deletePortfolioItem={portfolioItemApi.deletePortfolioItem} />
    );
  }

});

const mapStateToProps = function(store) {
  return {
    portfolioItems: store.portfolioItemState.portfolioItems
  };
};

export default connect(mapStateToProps)(PortfolioItemListContainer);
