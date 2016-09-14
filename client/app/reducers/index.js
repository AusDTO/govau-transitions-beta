import { combineReducers } from 'redux'
import question from './question'
import { routerReducer } from 'react-router-redux'

export default combineReducers({
  question,
  routing: routerReducer,
  form: (s = {}) => s,
  context: (s = {}) => s
})
