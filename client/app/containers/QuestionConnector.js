import Question from '../components/Question'
import { connect } from 'react-redux'

export const mapStateToProps = ({ question = {}, form = {} }) => {
  const {
    id,
    prompt,
    type,
    options
  } = question

  return {
    id,
    prompt,
    type,
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
