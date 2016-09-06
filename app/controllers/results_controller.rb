class ResultsController < ApplicationController
  def index
    @wizard = Wizard.friendly.find params[:wizard_id]
    @results = answer_session_for(@wizard).results
  end
end
