import { combineReducers } from 'redux';

// Reducers
import userReducer from './user-reducer';
import widgetReducer from './widget-reducer';
import portfolioItemReducer from './portfolio-item-reducer';
import searchLayoutReducer from './search-layout-reducer';

// Combine Reducers
var reducers = combineReducers({
    userState: userReducer,
    widgetState: widgetReducer,
    portfolioItemState: portfolioItemReducer,
    searchLayoutState: searchLayoutReducer
});

export default reducers;
