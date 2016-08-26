module Pages
  class Wizard < SitePrism::Page
    set_url "/transitions{/slug}"

    element :begin_link, '//a[text()="Begin"]'
  end
end
