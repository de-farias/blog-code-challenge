RSpec.feature 'Post#update', type: :feature do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  context 'Updating a post' do
    let(:post) { create(:post, title: 'Enlarge your bank account') }

    scenario 'with valid attributes' do
      visit "/posts/#{post.id}/edit"

      fill_in 'post[title]', with: 'Hot headhunters in your area'

      click_button 'Salvar'

      expect(page).to have_text('Post editado com sucesso')
    end

    scenario 'with an invalid title' do
      visit "/posts/#{post.id}/edit"

      fill_in 'post[title]', with: ''

      click_button 'Salvar'

      expect(page).to have_text('Não foi possível editar o post')
      expect(page).to have_text('Título não pode ficar em branco')
    end

    scenario 'with a taken title' do
      create(:post, title: 'Hot headhunters in your area')

      visit "/posts/#{post.id}/edit"

      fill_in 'post[title]', with: 'Hot headhunters in your area'

      click_button 'Salvar'

      expect(page).to have_text('Não foi possível editar o post')
      expect(page).to have_text('Título já está em uso')
    end

    scenario 'with a blank raw_content' do
      visit "/posts/#{post.id}/edit"

      fill_in 'post[raw_content]', with: ''

      click_button 'Salvar'

      expect(page).to have_text('Não foi possível editar o post')
      expect(page).to have_text('Conteúdo não pode ficar em branco')
    end
  end
end
