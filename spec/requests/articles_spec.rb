# frozen_string_literal: true

RSpec.describe '/articles' do
  context 'with a valid existing record' do
    let!(:article) { create(:complete_article) }

    describe 'GET /index' do
      it 'renders a successful response' do
        get articles_url
        expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        get article_url(article)
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'renders a successful response' do
        get edit_article_url(article)
        expect(response).to be_successful
      end
    end

    describe 'PATCH /update' do
      context 'with valid update attributes' do
        let(:valid_attributes) { attributes_for(:another_article) }

        it 'updates the requested article' do
          patch article_url(article), params: { article: valid_attributes }
          article.reload
          attributes = article.slice(valid_attributes.keys).symbolize_keys

          expect(attributes).to eq(valid_attributes)
        end

        it 'redirects to the article' do
          patch article_url(article), params: { article: valid_attributes }
          article.reload
          expect(response).to redirect_to(article_url(article))
        end
      end

      context 'with invalid update attributes' do
        let(:invalid_attributes) { attributes_for(:invalid_article) }

        it 'renders a response with 422 status (i.e. to display the "edit" template)' do
          patch article_url(article), params: { article: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested article' do
        expect do
          delete article_url(article)
        end.to change(Article, :count).by(-1)
      end

      it 'redirects to the articles list' do
        delete article_url(article)
        expect(response).to redirect_to(articles_url)
      end
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_article_url
      expect(response).to be_successful
    end
  end

  context 'with a valid new object' do
    let(:valid_attributes) { attributes_for(:complete_article) }

    describe 'POST /create' do
      it 'creates a new Article' do
        expect do
          post articles_url, params: { article: valid_attributes }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post articles_url, params: { article: valid_attributes }
        expect(response).to redirect_to(article_url(Article.last))
      end
    end
  end

  context 'with an invalid new object' do
    let(:invalid_attributes) { attributes_for(:invalid_article) }

    describe 'POST /create' do
      it 'does not create a new Article' do
        expect do
          post articles_url, params: { article: invalid_attributes }
        end.not_to change(Article, :count)
      end

      it 'renders a response with 422 status (i.e. to display the "new" template)' do
        post articles_url, params: { article: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
