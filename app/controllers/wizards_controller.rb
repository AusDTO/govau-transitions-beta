class WizardsController < ApplicationController
  def index
    @wizards = Wizard.all
  end

  def show
    @wizard = Wizard.friendly.find params[:id]
    @first_question = @wizard.questions.ordered.first
  end
end
