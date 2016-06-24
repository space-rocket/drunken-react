import axios from 'axios';
import store from '../store';
import { getWidgetsSuccess, deleteWidgetSuccess } from '../actions/widget-actions';

/**
 * Get widgets
 */

export function getWidgets() {
  return axios.get('http://localhost:4000/api/widgets')
    .then(response => {
      store.dispatch(getWidgetsSuccess(response.data.data));
      return response;
    });
}

/**
 * Search Widgets
 */

export function searchWidgets(query = '') {
  return axios.get('http://localhost:4000/api/widgets?q='+ query)
    .then(response => {
      store.dispatch(getWidgetsSuccess(response.data.data));
      return response;
    });
}

/**
 * Delete a widget
 */

export function deleteWidget(widgetId) {
  return axios.delete('http://localhost:4000/api/widgets/' + widgetId)
    .then(response => {
      store.dispatch(deleteWidgetSuccess(widgetId));
      return response;
    });
}
