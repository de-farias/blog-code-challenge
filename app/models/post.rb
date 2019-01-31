class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates_uniqueness_of :title, case_sensitive: false

  before_save :set_slug

  private

  def set_slug
    return if title.blank?

    self.slug = title.slugify
  end
end
