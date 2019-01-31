module StringExtensions
  def remove_accents
    I18n.transliterate(self)
  end

  def slugify
    downcase.remove_accents.strip.tr(' ', '-').gsub(/[^\w-]/, '')
  end
end

String.send :include, StringExtensions
