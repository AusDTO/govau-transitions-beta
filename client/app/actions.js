import 'whatwg-fetch'
import { push } from 'react-router-redux'
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

const getSelectedFormValues = (elements) => {
  return Array.prototype.filter.call(elements, e => e.checked).map(e => e.value)
}

/**
 * Submission of form to go to next question.
 * @param {object} form The HTML element object for the form
 * @return {object}  Action object
 */
const commit = (form) => {
  const values = getSelectedFormValues(form.elements)
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
        answers: { options: values }
      })
    }).then(r => r.json())
      .then(json => {
        dispatch(receiveQuestion(json))
        return dispatch(push(`/questions/${json.question.id}`))
      })
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
