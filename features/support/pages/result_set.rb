module Pages
  class ResultSection < SitePrism::Section
    element :title, 'h3'
    element :body, 'p'
  end

  class ResultSet < SitePrism::Page
    set_url "/transitions{/slug}/results"

    sections :results, ::Pages::ResultSection, '.result'

    def result_body_contents
      results.collect do |result|
        result.body.text
      end
    end
  end
end
