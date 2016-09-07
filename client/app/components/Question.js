import React, { PropTypes, Component } from 'react'
import SingleChoiceQuestion from './SingleChoiceQuestion'

class Question extends Component {

  elementMap = {
    'single': SingleChoiceQuestion
  }

  generateQuestionElement(type = 'single') {
    const { options } = this.props
    return React.createElement(this.elementMap[type], { options })
  }

  render() {
    const { prompt, legend, type, form = {} } = this.props
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
              <input type="hidden" name={form.csrf_param} value={form.csrf_token} />
              {this.generateQuestionElement.call(this, type)}
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
    action: PropTypes.string.isRequired,
    csrf_token: PropTypes.string.isRequired,
    csrf_param: PropTypes.string.isRequired
  }).isRequired
}

Question.defaultProps = {
  id: 0,
  prompt: '',
  options: []
}

export default Question
