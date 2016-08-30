import { compose, createStore, applyMiddleware, combineReducers } from 'redux'
import thunk from 'redux-thunk'
import reducers from '../reducers'

const devTools = typeof window !== 'undefined' && window.devToolsExtension && window.devToolsExtension() || (f => f)

export default props => {
  // Redux expects to initialize the store using an Object, not an Immutable.Map
  const initialState = props
  console.log(reducers)
  const reducer = combineReducers(reducers)
  const composedStore = compose(
    applyMiddleware(thunk),
    // TODO condition this to NODE_ENV as well?
    devTools
  )
  const storeCreator = composedStore(createStore)
  const store = storeCreator(reducer, initialState)

  return store
}
