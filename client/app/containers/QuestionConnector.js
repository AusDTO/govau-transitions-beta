import Question from '../components/Question'
import { connect } from 'react-redux'

export const mapStateToProps = ({ question = {}, form = {} }) => {
  const {
    id,
    prompt,
    options
  } = question

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
