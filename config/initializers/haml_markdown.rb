module Haml::Filters
  remove_filter("Markdown")

  module Markdown
    include Haml::Filters::Base

    def render(text)
      Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(autolink: true)).render(text)
    end
  end
end