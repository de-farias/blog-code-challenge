RSpec.feature 'Post#create', type: :feature do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  context 'Creating a new post' do
    scenario 'with valid attributes' do
      expect(Post.count).to be 0

      visit '/posts/new'

      fill_in_post_attributes title: 'How to stop the war',
                              raw_content: "#Cease making war"

      click_button 'Salvar'

      expect(page).to have_text('Post cadastrado com sucesso')
      expect(Post.count).to be 1
    end

    scenario 'with a blank title' do
      expect(Post.count).to be 0

      visit '/posts/new'

      fill_in_post_attributes title: ''

      click_button 'Salvar'

      expect(Post.count).to be 0
      expect(page).to have_text('Não foi possível cadastrar o post')
      expect(page).to have_text('Título não pode ficar em branco')
    end

    scenario 'with a taken title' do
      create(:post, title: 'How to stop the war')

      expect(Post.count).to be 1

      visit '/posts/new'

      fill_in_post_attributes title: 'How to stop the war'

      click_button 'Salvar'

      expect(Post.count).to be 1
      expect(page).to have_text('Não foi possível cadastrar o post')
      expect(page).to have_text('Título já está em uso')
    end

    scenario 'with a blank raw_content' do
      expect(Post.count).to be 0

      visit '/posts/new'

      fill_in_post_attributes raw_content: ''

      click_button 'Salvar'

      expect(Post.count).to be 0
      expect(page).to have_text('Não foi possível cadastrar o post')
      expect(page).to have_text('Conteúdo não pode ficar em branco')
    end
  end

  def fill_in_post_attributes(options)
    attributes = attributes_for(:post).merge(options)

    fill_in 'post[title]',       with: attributes[:title]
    fill_in 'post[raw_content]', with: attributes[:raw_content]
  end
end
