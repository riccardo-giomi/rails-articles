# frozen_string_literal: true

RSpec.describe ArticlesHelper do
  describe '#article_date_and_author' do
    let(:author) { 'A. U. Thor' }
    let(:created_at) { 1.week.ago }
    let(:article) { build(:article, author:, created_at:) }

    it 'shows a formatted string containing the author' do
      expect(helper.article_date_and_author(article)).to match(/By #{author}/)
    end

    it 'also includes the date of creation as publihed date (localized)' do
      expected = I18n.l(created_at.to_date, format: :template_date)
      expect(helper.article_date_and_author(article)).to match(/#{expected}/)
    end
  end
end
