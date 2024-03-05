# frozen_string_literal: true

RSpec.describe 'articles/index' do
  let(:articles) { create_list(:complete_article, 2) }

  before { assign(:articles, articles) }

  it 'renders a list of articles' do
    render

    articles.each do |article|
      assert_select "#articles div##{dom_id article}" do
        assert_select 'div', text: Regexp.new('Title Value')
        assert_select 'div', text: Regexp.new('Abstract Value')
        assert_select 'div', text: Regexp.new('Content Value')
        assert_select 'div img[alt=?]', 'article_image.jpg'
        assert_select 'div', text: Regexp.new('Image_caption Value')
        assert_select 'div', text: Regexp.new('Author Value')
      end
    end
  end
end
