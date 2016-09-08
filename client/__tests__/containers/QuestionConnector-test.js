import test from 'ava'
import {
  mapStateToProps,
  mapDispatchToProps
} from '../../app/containers/QuestionConnector'

const question = {
  id: 1,
  prompt: 'Tea or coffee?',
  options: [
    { label: 'Tea', value: 'tea' },
    { label: 'Coffee', value: 'coffee' }
  ]
}

const form = {
  action: '/questions/1/answers',
  csrf_param: 'authenticity_token',
  csrf_token: 'somerandomstring'
}

test('mapStateToProps with rawQuestion', t => {
  t.deepEqual(mapStateToProps({ question, form }), {
    id: 1,
    prompt: 'Tea or coffee?',
    options: [ { label: 'Tea', value: 'tea' }, { label: 'Coffee', value: 'coffee' } ],
    form: {
      action: '/questions/1/answers',
      csrf_param: 'authenticity_token',
      csrf_token: 'somerandomstring'
    }
  })
})

test('mapStateToProps without data', t => {
  t.deepEqual(mapStateToProps({}), {
    id: void 0,
    prompt: void 0,
    options: void 0,
    form: {}
  })
})

test('mapDispatchToProps', t => {
  const model = {}
  t.deepEqual(mapDispatchToProps(model), {})
})
