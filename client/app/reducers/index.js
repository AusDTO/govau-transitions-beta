import { combineReducers } from 'redux'
import question from './question'
import form from './form'

export default combineReducers({
  question,
  routing: routerReducer,
  form: (s = {}) => s,
  context: (s = {}) => s
})
