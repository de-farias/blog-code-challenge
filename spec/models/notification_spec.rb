RSpec.describe Notification, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:target) }

  describe '#opened?' do
    it "when the target hasn't been seen" do
      subject = build(:post_created_notification)
      expect(subject.opened?).to be false
    end

    it 'when the target has been acknowledged' do
      subject = build(:post_created_notification, :acknowledged)
      expect(subject.opened?).to be false
    end

    it 'when the target has been actually seen' do
      subject = build(:post_created_notification, :opened)
      expect(subject.opened?).to be true
    end
  end
end
