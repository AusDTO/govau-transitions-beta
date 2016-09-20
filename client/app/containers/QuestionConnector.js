import Question from '../components/Question'
import { connect } from 'react-redux'
import { selectAnswer, commit } from '../actions'

export const mapStateToProps = ({ question = {}, form = {} }) => {
  const { id, prompt, type, options } = question

  return {
    id,
    prompt,
    type,
    options,
    form
  }
}

export const mapDispatchToProps = (dispatch) => {
  return {
    onChange(value) {
      dispatch(selectAnswer(value))
    },
    onSubmit(form) {
      dispatch(commit(form))
    }
  }
}

const QuestionConnector = connect(
  mapStateToProps,
  mapDispatchToProps
)(Question)

export default QuestionConnector
