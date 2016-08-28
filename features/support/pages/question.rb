module Pages
  class Question < SitePrism::Page
    set_url "/questions{/id}"

    element :prompt, 'h2#prompt'
    element :next_button, '//*/nav/input[@value="Next"]'

    #TODO smarten this up as you add more question types
    elements :answers, '.answer_options span label'

    def answer_option(option)
      answers.find { |answer|
        answer.text == option
      }.find '/input[@type="radio"]'
    end
  end
end
