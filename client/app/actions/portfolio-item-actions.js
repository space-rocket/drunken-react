import * as types from '../actions/action-types';

export function getPortfolioItemsSuccess(portfolioItems) {
  return {
    type: types.GET_PORTFOLIO_ITEMS_SUCCESS,
    portfolioItems
  };
}

export function deletePortfolioItemSuccess(portfolioItemId) {
  return {
    type: types.DELETE_PORTFOLIO_ITEM_SUCCESS,
    portfolioItemId
  };
}

export function singlePortfolioItemSuccess(singlePortfolioItem) {
  return {
    type: types.SINGLE_PORTFOLIO_ITEM_SUCCESS,
    singlePortfolioItem
  };
}
