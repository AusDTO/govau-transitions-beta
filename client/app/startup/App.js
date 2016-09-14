import React from 'react'
import ReactOnRails from 'react-on-rails'
import { Provider } from 'react-redux'

import { match, RouterContext } from 'react-router'

import createStore from '../store/appStore'
import routes from '../routes/routes'

import 'assets/stylesheets/main.scss'

if (typeof window !== 'undefined') {
  require('webfontloader').load({
    google: {
      families: [ 'Open+Sans:400italic,600,700,400:latin,latin-ext' ]
    }
  })
}

// See documentation for https://github.com/reactjs/react-redux.
// This is how you get props from the Rails view into the redux store.
// This code here binds your smart component to the redux store.
// railsContext provides contextual information especially useful for server rendering, such as
// knowing the locale. See the React on Rails documentation for more info on the railsContext
const AgedCareWidget = (props, _railsContext) => {
  const store = createStore(Object.assign({}, props, { context: _railsContext }))

  let error
  let redirectLocation
  let routeProps
  const { location } = _railsContext


  match({ routes, location }, (_error, _redirectLocation, _routeProps) => {
    error = _error
    redirectLocation = _redirectLocation
    routeProps = _routeProps
  })

  // This tells react_on_rails to skip server rendering any HTML. Note, client rendering
  // will handle the redirect. What's key is that we don't try to render.
  // Critical to return the Object properties to match this { error, redirectLocation }
  if (error || redirectLocation) {
    return {
      error,
      redirectLocation
    }
  }

  return (
    <Provider store={store}>
      <RouterContext {...routeProps} />
    </Provider>
  )
}

ReactOnRails.register({ AgedCareWidget })
