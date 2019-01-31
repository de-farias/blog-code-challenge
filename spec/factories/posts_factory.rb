FactoryBot.define do
  factory :post do
    title  { FFaker::Book.title }
    author { build(:user) }
  end
end
