RSpec.describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
