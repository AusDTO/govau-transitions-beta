import actionTypes from '../constants'

export default function question(state = {}, action) {
  const { type, payload } = action
  switch (type) {
    case actionTypes.POST_COMMIT:
      return payload.question
    default:
      return state
  }
}
