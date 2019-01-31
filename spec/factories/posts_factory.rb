FactoryBot.define do
  factory :post do
    title       { FFaker::Book.title }
    raw_content { '#This is an h1 tag' }
    author      { build(:user) }
  end
end
