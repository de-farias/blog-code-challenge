RSpec.describe Post, type: :model do
  let(:subject) { build(:post) }

  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }

  it 'automatically set the slug after the title' do
    post = build(:post, title: 'As águas de Março')
    post.save

    expect(post.slug).to eq 'as-aguas-de-marco'
  end
end
