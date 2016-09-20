import React, { PropTypes, Component } from 'react'
import { goBack } from 'react-router-redux'

class Layout extends Component {

  onBackButtonEvent(e) {
    e.preventDefault()
    goBack()
  }

  componentDidMount() {
    window.onpopstate = this.onBackButtonEvent
  }

  render() {
    const { children } = this.props
    return (
      <div>{children}</div>
    )
  }
}

Layout.propTypes = {
  children: PropTypes.object.isRequired
}

export default Layout
