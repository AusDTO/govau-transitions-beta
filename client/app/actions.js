import actionTypes from './constants'
import 'whatwg-fetch'

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
  return (dispatch, getState) => {
    const { form } = getState()
    dispatch(preCommit())
    return fetch(`${form.action}.json`, {
      method: 'post',
      credentials: 'same-origin',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        answers: {
          options: [
            'two'
          ]
        }
      })
    }).then(r => r.json())
      .then(json => dispatch(receiveQuestion(json)))
  }
}

const preCommit = () => {
  return {
    type: actionTypes.PRE_COMMIT
  }
}

const receiveQuestion = (payload) => {
  return {
    type: actionTypes.POST_COMMIT,
    payload
  }
}

export {
  commit,
  selectAnswer
}
