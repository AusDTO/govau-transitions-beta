module Pages
  class Question < SitePrism::Page
    set_url "/questions{/id}"

    element :prompt, 'legend'
    element :next_button, 'button[type=submit]'

    #TODO smarten this up as you add more question types
    elements :answers, 'fieldset span'

    def answer_option(option)
      answers.find { |answer|
        answer.text == option
      }.find '/input[@type="radio"]'
    end
  end
end
