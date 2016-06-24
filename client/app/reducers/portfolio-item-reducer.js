import * as types from '../actions/action-types';
import _ from 'lodash';

const initialState = {
  portfolioItems: []
};

const portfolioItemReducer = function(state = initialState, action) {

  switch(action.type) {

    case types.GET_PORTFOLIO_ITEMS_SUCCESS:
      return Object.assign({}, state, { portfolioItems: action.portfolioItems });

    case types.DELETE_PORTFOLIO_ITEM_SUCCESS:

      // Use lodash to create a new portfolioItem array without the portfolioItem we want to remove
      const newPortfolioItems = _.filter(state.portfolioItems, portfolioItem => portfolioItem.id != action.portfolioItemId);
      return Object.assign({}, state, { portfolioItems: newPortfolioItems })

    case types.SINGLE_PORTFOLIO_ITEM_SUCCESS:
      return Object.assign({}, state, { singlePortfolioItem: action.singlePortfolioItem });

  }

  return state;

}

export default portfolioItemReducer;
