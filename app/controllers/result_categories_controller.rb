class ResultCategoriesController < ApplicationController
  def index
    @result_categories = answer_session.result_categories
    @orphaned_results = answer_session.results.select do |result|
      result.orphan?
    end
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
