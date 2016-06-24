import axios from 'axios';
import store from '../store';
import { getPortfolioItemsSuccess, deletePortfolioItemSuccess, singlePortfolioItemSuccess } from '../actions/portfolio-item-actions';

/**
 * Get widgets
 */

export function getPortfolioItems() {
  return axios.get('http://localhost:4000/api/portfolio_posts')
    .then(response => {
      store.dispatch(getPortfolioItemsSuccess(response.data.data));
      return response;
    });
}

/**
 * Search Portfolio Items
 */

export function searchPortfolioItems(query = '') {
  return axios.get('http://localhost:4000/api/portfolio_posts?q='+ query)
    .then(response => {
      store.dispatch(getPortfolioItemsSuccess(response.data.data));
      return response;
    });
}

/**
 * Delete a Portfolio Item
 */

export function deletePortfolioItem(portfolioItemID) {
  return axios.delete('http://localhost:4000/api/portfolio_posts/' + portfolioItemID)
    .then(response => {
      store.dispatch(deletePortfolioItemSuccess(portfolioItemID));
      return response;
    });
}

/**
 * Get a Portfolio Item
 * portfolio.id
 * portfolio.name
 */

export function getSinglePortfolioItem(portfolioItemID) {

  return axios.get('http://localhost:4000/api/portfolio_posts/' + portfolioItemID)
    .then(response => {
      let portfolio = response.data.data;
      store.dispatch(singlePortfolioItemSuccess(portfolio));
      return;
    });
}
