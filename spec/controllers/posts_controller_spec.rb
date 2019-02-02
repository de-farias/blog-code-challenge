RSpec.describe PostsController, type: :controller do
  let(:blog_post) { create(:post) }

  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: blog_post.id }

      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'when things go well' do
      let(:post_params) { attributes_for(:post) }

      it 'redirects to the newly created post' do
        post :create, params: { post: post_params }
        expect(response).to redirect_to(post_path(Post.last))
      end

      it 'enqueues notification jobs' do
        create(:user)
        ActiveJob::Base.queue_adapter = :test

        expect {
          post :create, params: { post: post_params }
        }.to enqueue_job(NotificationsJob)
      end
    end

    context 'when things go wrong' do
      let(:post_params) { attributes_for(:post).merge(title: '') }

      it 'rerenders the new template' do
        post :create, params: { post: post_params }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: blog_post.id }

      expect(response).to render_template('edit')
    end
  end

  describe 'PUT #update' do
    context 'when things go well' do
      let(:post_params) { attributes_for(:post) }

      it 'redirects to the updated post' do
        put :update, params: {
          id: blog_post.id,
          post: post_params
        }
        expect(response).to redirect_to(post_path(blog_post))
      end
    end

    context 'when things go wrong' do
      let(:post_params) { attributes_for(:post).merge(title: '') }

      it 'rerenders the edit template' do
        put :update, params: {
          id: blog_post.id,
          post: post_params
        }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      delete :destroy, params: { id: blog_post.id }
      expect(response).to redirect_to posts_path
    end
  end
end
