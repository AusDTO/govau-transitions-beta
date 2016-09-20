import actionTypes from '../constants'

export default function form(state = {}, action) {
  const { type, payload } = action
  switch (type) {
    case actionTypes.POST_COMMIT:
      return payload.form
    default:
      return state
  }
}
