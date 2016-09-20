class ResultCategoriesController < ApplicationController
  def index
    @result_categories = answer_session.result_categories
  end

  def show
    @result_category = ResultCategory.friendly.find(params[:id]).decorate

    @other_categories = answer_session.result_categories.select do |cat|
      cat != @result_category
    end
  end

  private

  def wizard
    @wizard ||= Wizard.friendly.find params[:wizard_id]
  end

  def answer_session
    @answer_session ||= answer_session_for(wizard)
  end
end
