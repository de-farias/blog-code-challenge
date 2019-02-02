FactoryBot.define do
  factory :post_created_notification, class: 'Notifications::PostCreated' do
    target          { create(:post) }
    user            { build(:user) }
    acknowledged_at { nil }
    opened_at       { nil }

    trait :acknowledged do
      acknowledged_at { DateTime.now }
    end

    trait :opened do
      acknowledged_at { 1.second.ago }
      opened_at { DateTime.now }
    end
  end
end
