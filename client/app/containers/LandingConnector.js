import React from 'react'
import Landing from '../components/Landing'
import { connect } from 'react-redux'

const mapStateToProps = ({ landing }) => {
  return landing
}

const mapDispatchToProps = (dispatch) => {
  return {}
}

const LandingConnector = connect(
  mapStateToProps,
  mapDispatchToProps
)(Landing)

export default LandingConnector