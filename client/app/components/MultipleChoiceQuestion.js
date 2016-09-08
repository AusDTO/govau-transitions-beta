import React, { PropTypes } from 'react'

const MultipleChoiceQuestion = ({ options }) => (
  <div className="multiple-question">
    {options.map(({ label, value }, i) => (
      <span key={value + i}>
        <input type="checkbox" name="answer[options]" id={`answer_${value}`} className="multiple-question__option" value={value} />
        <label htmlFor={`answer_${value}`} className="multiple-question__label">{label}</label>
      </span>
    ))}
  </div>
)

MultipleChoiceQuestion.propTypes = {
  options: PropTypes.arrayOf(PropTypes.shape({
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired
  })).isRequired
}

MultipleChoiceQuestion.defaultProps = {
  options: []
}

export default MultipleChoiceQuestion
