import { combineReducers } from 'redux'
import { routerReducer } from 'react-router-redux'

import question from './question'
import form from './form'

export default combineReducers({
  routing: routerReducer,
  question,
  form,
  context: (s = {}) => s
})
