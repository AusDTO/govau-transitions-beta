import Question from '../components/Question'
import { connect } from 'react-redux'

const mapStateToProps = ({ currentQuestion = {} }) => {
  return {
    ...currentQuestion
  }
}

const mapDispatchToProps = () => {
  return {}
}

const LandingConnector = connect(
  mapStateToProps,
  mapDispatchToProps
)(Question)

export default LandingConnector
