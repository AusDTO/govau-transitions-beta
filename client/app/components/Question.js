import React, { PropTypes, Component } from 'react'
import SingleChoiceQuestion from './SingleChoiceQuestion'
import MultipleChoiceQuestion from './MultipleChoiceQuestion'

class Question extends Component {

  /**
   * List of available question components
   * @type {Object}
   */
  elementMap = {
    SingleChoiceQuestion,
    MultipleChoiceQuestion
  }

  /**
   * Based on the prop type, Generate a composite component with options prop
   * Defaults to SingleChoiceQuestion if a valid component isnt found
   * @returns {ReactElement}  The composite component
   */
  generateQuestionElement() {
    const { options, type } = this.props
    // Default to SingleChoiceQuestion is an invalid type is passed
    const element = this.elementMap[type] || SingleChoiceQuestion
    return React.createElement(element, { options })
  }

  render() {
    const { prompt, legend, form } = this.props
    return (
      <section>
        <div className="heading">
          <a href="#" className="back fa fa-chevron-left">Back</a>
          <h3>{prompt}</h3>
        </div>
        <form className="form"
            method="post"
            action={form.action}>
            <fieldset>
              <legend>{legend}</legend>
              {this.generateQuestionElement.call(this)}
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
  type: PropTypes.string,
  form: PropTypes.shape({
    action: PropTypes.string.isRequired
  }).isRequired
}

Question.defaultProps = {
  id: 0,
  prompt: '',
  options: [],
  form: {
    action: ''
  }
}

export default Question
