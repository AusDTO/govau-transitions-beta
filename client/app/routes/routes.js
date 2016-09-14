import React from 'react'
import { Route, IndexRoute } from 'react-router'
import QuestionConnector from '../containers/QuestionConnector'
import Layout from '../layout/Layout'

export default (
  <Route path="/questions" component={Layout}>
    <IndexRoute
      component={QuestionConnector}
    />
    <Route
      path=":id"
      component={QuestionConnector}
    />
  </Route>
)
