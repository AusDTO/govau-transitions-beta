module Pages
  class ResultSectionTile < SitePrism::Section
    element :heading, 'h3'
    element :link, 'h3 a'
    element :next_steps_count, 'p span.number'
    element :description, 'p[2]'
  end

  class Result < SitePrism::Page
    set_url "/transitions{/slug}/results{/id}"

    element :heading, 'h1'
    element :description, '.abstract'

    sections :tiles, ::Pages::ResultSectionTile, 'nav.results-tiles ul li'
    elements :orphan_results, 'ul.secondary-links li'

    def tile_for_category(category_name)
      tiles.find do |tile|
        tile.heading.text == category_name
      end
    end
  end
end
