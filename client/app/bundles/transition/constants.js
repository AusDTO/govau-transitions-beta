import mirror from 'mirror-creator'

const actionTypes = mirror([
  'MOVE_NEXT',
  'MOVE_BACK',
  'MOVE_TO',
  'ON_SELECT',
  'RESULT_CHECK'
])

export default actionTypes
