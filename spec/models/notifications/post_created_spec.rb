RSpec.describe Notifications::PostCreated, type: :model do
  describe '#event' do
    let(:notification) { build(:post_created_notification, target: post) }
    let(:post) { create(:post, title: 'Post batuta') }

    before(:each) { notification.save }

    it 'is expected to be a Hash' do
      expect(notification.event).to be_a(Hash)
    end

    it '#event[:type]' do
      expect(notification.event[:type]).to eq 'post_created'
    end

    it '#event[:text]' do
      expect(notification.event[:text]).to eq 'Novo post publicado: Post batuta'
    end

    it '#event[:url]' do
      expect(notification.event[:url]).to eq "/posts/#{post.id}"
    end
  end
end
