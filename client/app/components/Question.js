import React, { PropTypes, Component } from 'react'
import SingleChoiceQuestion from './SingleChoiceQuestion'
import MultipleChoiceQuestion from './MultipleChoiceQuestion'

class Question extends Component {

  elementMap = {
    'single': SingleChoiceQuestion,
    'multiple': MultipleChoiceQuestion
  }

  constructor(props) {
    super(props)
    this.generateQuestionElement = this.generateQuestionElement.bind(this)
  }

  generateQuestionElement(type = 'single') {
    const { options } = this.props
    return React.createElement(this.elementMap[type], { options })
  }

  render() {
    const { id, prompt, legend, type } = this.props
    return (
      <section className="content-main">
        <div className="heading">
          <a href="#" className="back fa fa-chevron-left">Back</a>
          <h3>{prompt}</h3>
        </div>
        <form className="form"
            method="post"
            action={`/questions/${id}/answers`}>
            <fieldset>
              <legend>{legend}</legend>
              {this.generateQuestionElement(type)}
            </fieldset>
            <button type="submit">Next <i className="fa fa-chevron-right" aria-hidden="true"></i></button>
        </form>
      </section>
    )
  }
}

Question.propTypes = {
  id: PropTypes.number.isRequired,
  prompt: PropTypes.string.isRequired,
  options: PropTypes.array.isRequired,
  legend: PropTypes.string,
  type: PropTypes.string
}

Question.defaultProps = {
  id: 0,
  prompt: '',
  options: []
}

export default Question
