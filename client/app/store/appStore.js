import { compose, createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import rootReducer from '../reducers/index'

const devTools = typeof window !== 'undefined' && window.devToolsExtension && window.devToolsExtension() || (f => f)

export default initialState => {
  const composedStore = compose(
    applyMiddleware(thunk),
    // TODO condition this to NODE_ENV as well?
    devTools
  )
  const storeCreator = composedStore(createStore)
  const store = storeCreator(rootReducer, initialState)

  return store
}
