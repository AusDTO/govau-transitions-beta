class TransitionsController < ApplicationController
  before_action :parse_answers_path, only: :show

  def index
    @wizards = Wizard.all
  end

  def show
    @wizard = Wizard.friendly.find params[:id]

    @question = @wizard.questions.reject {|question|
      @answers.has_key? question.id.to_s
    }.first

    #TODO also apply conditions
  end

  private

  def parse_answers_path
    @answers = params[:answers_path]&.split('/')&.each_slice(2)&.to_h || {}
  end
end
