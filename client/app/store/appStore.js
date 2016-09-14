import { compose, createStore, applyMiddleware } from 'redux'
import { routerMiddleware } from 'react-router-redux'
import { browserHistory } from 'react-router'
import thunk from 'redux-thunk'
import rootReducer from '../reducers/index'

const devTools = typeof window !== 'undefined' && window.devToolsExtension && window.devToolsExtension() || (f => f)
const historyMiddleware = routerMiddleware(browserHistory)

export default initialState => {
  const middleware = [ historyMiddleware, thunk ]
  const store = createStore(
    rootReducer,
    initialState,
    compose(
      applyMiddleware(...middleware),
      // TODO condition this to NODE_ENV as well?
      devTools
    )

  )
  return store
}
