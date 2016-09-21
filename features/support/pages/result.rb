module Pages
  class ResultSectionTile < SitePrism::Section
    element :title, 'h3'
    element :link, 'h3 a'
    element :next_steps_count, 'p span.number'
    element :description, 'p[2]'
  end

  class Result < SitePrism::Page
    set_url "/transitions{/slug}/results{/id}"

    element :title, 'h1'

    sections :tiles, ::Pages::ResultSectionTile, 'nav.results-tiles'
    elements :orphan_results, 'ul.secondary-links li'

    def tile_for_category(category_name)
      tiles.select do |tile|
        tile.title.text == category_name
      end
    end
  end
end
