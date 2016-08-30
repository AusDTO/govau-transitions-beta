import React from 'react'
import LandingWidget from '../components/LandingWidget'
import { connect } from 'react-redux'

const mapStateToProps = (state) => {
  return {}
}

const mapDispatchToProps = (dispatch) => {
  return {}
}

const Landing = connect(
  mapStateToProps,
  mapDispatchToProps
)(LandingWidget)

export default Landing
