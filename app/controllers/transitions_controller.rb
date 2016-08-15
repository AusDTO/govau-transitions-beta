class TransitionsController < ApplicationController
  def index
    @wizards = Wizard.all
  end

  def show
    @wizard = Wizard.friendly.find params[:id]

    @question = @wizard.questions.reject {|question|
      answers.has_key? question.id.to_s
    }.select {|question|
      question.conditions.all do |condition|
        condition.check? answer_for condition.source
      end
    }
  end

  private

  def answer_for(question)
    answers[question.id.to_s]
  end

  def answers
    @answers ||= params[:answers_path]&.split('/')&.each_slice(2)&.to_h || {}
  end
end
