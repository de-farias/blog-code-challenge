class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates_presence_of :title,
                        :raw_content
  validates_uniqueness_of :title, case_sensitive: false

  before_save :set_slug
  before_save :set_html_content

  private

  def set_slug
    return if title.blank?

    self.slug = title.slugify
  end

  def set_html_content
    return if raw_content.blank?

    self.html_content = renderer.render(raw_content)
  end

  def renderer
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      escape_html: true,
      prettify: true
    )
  end
end
