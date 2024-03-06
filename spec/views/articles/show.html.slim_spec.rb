# frozen_string_literal: true

RSpec.describe 'articles/show' do
  before { assign :article, create(:complete_article) }

  it 'renders attributes' do
    render
    expect(rendered).to match(/Title Value/) # #title
    expect(rendered).to match(/Abstract Value/) # #abstract
    expect(rendered).to match(/article_image.jpg/) # #image
    expect(rendered).to match(/Image caption Value/) # #image_caption
    expect(rendered).to match(/Author Value/) # #author
  end
end
