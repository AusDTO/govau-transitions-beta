module Pages
  class ResultSectionTile < SitePrism::Section
    element :heading, 'h3'
    element :link, 'h3 a'
    element :next_steps_count, 'p span.number'
    element :description, 'p[2]'
  end

  class ResultBlock < SitePrism::Section
    element :heading, '.accordion-button span.accordion-content'
    element :body, '.accordion-panel p'
    elements :results, '.accordion-panel ul.step-actions li'

    def result_with_content(content)
      results.find do |result|
        result.text.include? content
      end
    end
  end

  class Result < SitePrism::Page
    set_url "/transitions{/slug}/results{/id}"

    element :heading, 'h1'
    element :description, '.abstract'
    element :group_count, 'div h3 span.number'
    elements :orphan_results, 'ul.secondary-links li'
    elements :ungrouped_results, '.information-list ul li'

    sections :tiles, ::Pages::ResultSectionTile, 'nav.results-tiles ul li'
    sections :blocks, ::Pages::ResultBlock, '.steps-list section'

    def tile_for_category(category_title)
      tiles.find do |tile|
        tile.heading.text == category_title
      end
    end

    def block_for_group(group_title)
      blocks.find do |block|
        block.heading.text == group_title
      end
    end

    def ungrouped_result_containing_text(text)
      ungrouped_results.find do |res|
        res.text.include? text
      end
    end
  end
end
