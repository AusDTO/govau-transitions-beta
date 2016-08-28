class ResultsController < ApplicationController
  def index
    @wizard = Wizard.friendly.find params[:wizard_id]
    @results = @wizard.results_for current_user.answers
  end
end
