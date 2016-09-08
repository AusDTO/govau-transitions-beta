import Question from '../components/Question'
import { connect } from 'react-redux'

export const mapStateToProps = ({ currentQuestion = {}, form = {} }) => {
  const {
    id = 0,
    prompt = '',
    meta: {
      options = []
    } = {}
  } = currentQuestion

  return {
    id,
    prompt,
    options,
    form
  }
}

export const mapDispatchToProps = () => {
  return {}
}

const QuestionConnector = connect(
  mapStateToProps,
  mapDispatchToProps
)(Question)

export default QuestionConnector
