# frozen_string_literal: true

RSpec.describe 'articles/new' do
  before { assign(:article, Article.new) }

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?][enctype=?]', articles_path, 'post', 'multipart/form-data' do
      assert_select 'input[name=?]', 'article[title]'
      assert_select 'textarea[name=?]', 'article[abstract]'
      assert_select 'textarea[name=?]', 'article[content]'
      assert_select 'input[name=?][type=?]', 'article[image]', 'file'
      assert_select 'input[name=?]', 'article[image_caption]'
      assert_select 'input[name=?]', 'article[author]'
    end
  end
end
