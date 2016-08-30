import React, { PropTypes } from 'react'
import HelloWorldWidget from '../components/HelloWorldWidget'
import { connect } from 'react-redux'

function select (state) {
  // Which part of the Redux global state does our component want to receive as props?
  // Note the use of `$$` to prefix the property name because the value is of type Immutable.js
  return { }
}

// Simple example of a React "smart" component
const HelloWorld = (props) => {
  return (
    <HelloWorldWidget />
  )
}

HelloWorld.propTypes = {
  dispatch: PropTypes.func.isRequired
}

// Don't forget to actually use connect!
// Note that we don't export HelloWorld, but the redux "connected" version of it.
// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(select)(HelloWorld)
