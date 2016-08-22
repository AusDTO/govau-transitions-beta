module Pages
  class Wizard < SitePrism::Page
    set_url "/transitions{/slug}"

    element :prompt, 'h2#prompt'
    element :question_field, 'question[options]'
  end
end
