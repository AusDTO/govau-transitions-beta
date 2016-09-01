import { combineReducers } from 'redux'
import landing from './landing'
import currentQuestion from './question'

export default combineReducers({
  landing,
  currentQuestion
})
