import { combineReducers } from 'redux'
import currentQuestion from './question'
import form from './form'

export default combineReducers({
  currentQuestion,
  form
})
