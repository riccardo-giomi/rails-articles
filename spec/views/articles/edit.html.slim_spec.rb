# frozen_string_literal: true

RSpec.describe 'articles/edit' do
  let(:article) { create(:complete_article) }

  before { assign(:article, article) }

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?][enctype=?]', article_path(article), 'post', 'multipart/form-data' do
      assert_select 'input[name=?]', 'article[title]'
      assert_select 'textarea[name=?]', 'article[abstract]'
      assert_select 'textarea[name=?]', 'article[content]'
      # Single file attachment "image"
      # To replace the file
      assert_select 'input[name=?][type=?]', 'article[image]', 'file'

      assert_select 'input[name=?]', 'article[image_caption]'
      assert_select 'input[name=?]', 'article[author]'
    end
  end
end
