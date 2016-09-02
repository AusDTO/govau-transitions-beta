import test from 'ava'
import {
  mapStateToProps,
  mapDispatchToProps
} from '../../app/containers/QuestionConnector'

const rawQuestion = {
  id: 1,
  wizard_id: 1,
  order_num: 0,
  prompt: 'Tea or coffee?',
  created_at: '2016-08-29T04:54:32.477Z',
  updated_at: '2016-08-29T04:54:32.482Z',
  meta: {
    options: [
      { label: 'Tea', value: 'tea' },
      { label: 'Coffee', value: 'coffee' }
    ]
  }
}

test('mapStateToProps with rawQuestion', t => {
  t.deepEqual(mapStateToProps({ currentQuestion: rawQuestion }), {
    id: 1,
    prompt: 'Tea or coffee?',
    options: [ { label: 'Tea', value: 'tea' }, { label: 'Coffee', value: 'coffee' } ]
  })
})

test('mapStateToProps without data', t => {
  t.deepEqual(mapStateToProps({}), {
    id: 0,
    prompt: '',
    options: []
  })
})

test('mapDispatchToProps', t => {
  const model = {}
  t.deepEqual(mapDispatchToProps(model), {})
})
