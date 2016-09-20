module SharedSteps
  module WizardSteps
    include Spinach::DSL

    step 'I begin the wizard' do
      @wizard_page.begin_link.click
      @question_page = Pages::Question.new
    end

    step 'I proceed' do
      @question_page.next_button.click
    end

    private

    def expect_prompt(prompt)
      expect(@question_page).to have_prompt
      expect(@question_page.prompt.text).to eq prompt
    end

    def choose_answer(label)
      @question_page.answer_option(label).set true
    end
  end
end
