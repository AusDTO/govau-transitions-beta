import test from 'ava'
import sinon from 'sinon'
import {
  mapStateToProps,
  mapDispatchToProps
} from '../../app/containers/QuestionConnector'

const question = {
  id: 1,
  prompt: 'Tea or coffee?',
  type: 'SingleChoiceQuestion',
  options: [
    { label: 'Tea', value: 'tea' },
    { label: 'Coffee', value: 'coffee' }
  ]
}

const form = {
  action: '/questions/1/answers'
}

test('mapStateToProps with rawQuestion', t => {
  t.deepEqual(mapStateToProps({ question, form }), {
    id: 1,
    prompt: 'Tea or coffee?',
    type: 'SingleChoiceQuestion',
    options: [ { label: 'Tea', value: 'tea' }, { label: 'Coffee', value: 'coffee' } ],
    form: {
      action: '/questions/1/answers'
    }
  })
})

test('mapStateToProps without data', t => {
  t.deepEqual(mapStateToProps({}), {
    id: void 0,
    prompt: void 0,
    type: void 0,
    options: void 0,
    form: {}
  })
})

test('mapDispatchToProps', t => {
  const dispatchProps = mapDispatchToProps({})
  t.true(dispatchProps.hasOwnProperty('onSubmit'))
  t.true(dispatchProps.hasOwnProperty('onChange'))
})

test('onSubmit called', t => {
  const dispatch = sinon.spy()
  const dispatchProps = mapDispatchToProps(dispatch)
  dispatchProps.onSubmit()
  t.true(dispatch.calledOnce)
})

test('onChange called', t => {
  const dispatch = sinon.spy()
  const dispatchProps = mapDispatchToProps(dispatch)
  dispatchProps.onChange()
  t.true(dispatch.calledOnce)
})
