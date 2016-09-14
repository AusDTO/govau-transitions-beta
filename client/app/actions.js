import actionTypes from './constants'

/**
 * When a user interacts with a question (selects) this action is fired.
 * @param  {string} value Value of the answer selected
 * @return {object}       Action object
 */
const selectAnswer = (value) => {
  return {
    type: actionTypes.SELECT_ANSWER,
    value
  }
}

/**
 * Submission of form to go to next question.
 * @return {object}  Action object
 */
const commit = () => {
  return {
    type: actionTypes.COMMIT
  }
}

export {
  commit,
  selectAnswer
}
