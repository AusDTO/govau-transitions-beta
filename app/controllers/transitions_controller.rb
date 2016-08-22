class TransitionsController < ApplicationController
  before_action :set_wizard, only: [:show, :answer]

  def index
    @wizards = Wizard.all
  end

  def show
    @question = @wizard.questions.ordered.reject {|question|
      answers.has_key? question.id.to_s
    }.select {|question|
      question.visible_given_answers? answers
    }.first
  end

  def answer
    new_path_fragment = "#{params[:question][:id]}/#{params[:question][:options]}"
    answers_path = "#{params[:answers_path]}/#{new_path_fragment}"
    answers_path.sub! /^\//, ''

    redirect_to transition_flow_path id: @wizard.slug, answers_path: answers_path
  end

  private

  def answer_for(question)
    answers[question.id.to_s]
  end

  def answers
    @answers ||= params[:answers_path]&.split('/')&.each_slice(2)&.to_h || {}
  end

  def set_wizard
    @wizard = Wizard.friendly.find params[:id]
  end
end
