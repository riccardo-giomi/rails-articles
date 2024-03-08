# frozen_string_literal: true

RSpec.describe Article do
  let(:article) { build(:complete_article) }

  describe '.attributes' do
    describe 'title' do
      it 'is the title of the article' do
        expect(article.title).to eq('Title Value')
      end

      it 'is required' do
        article.title = nil
        expect(article).not_to be_valid
      end
    end

    describe('abstract') do
      it 'succintly describes the content of the article' do
        expect(article.abstract).to eq('Abstract Value')
      end

      it 'is required' do
        article.abstract = nil
        expect(article).not_to be_valid
      end
    end

    describe 'content' do
      it 'is the main content of the article' do
        expect(article.content).to eq('Content Value')
      end

      it 'is required' do
        article.content = nil
        expect(article).not_to be_valid
      end
    end

    describe('image_caption') do
      it "explains the article's image" do
        expect(article.image_caption).to eq('Image caption Value')
      end

      it 'is required' do
        article.image_caption = nil
        expect(article).not_to be_valid
      end
    end

    describe 'author' do
      it 'identifies who wrote the article' do
        expect(article.author).to eq('Author Value')
      end

      it 'is required' do
        article.author = nil
        expect(article).not_to be_valid
      end
    end
  end

  describe 'attachments' do
    describe '#image' do
      let(:variants) { described_class.reflect_on_attachment(:image).named_variants.keys }

      # Note that it still responds to #attachments with a single-value array
      it 'is a single-file attachment' do
        expect(article.image).to respond_to(:attachment)
      end

      it 'has a "gallery" variant' do
        expect(variants).to include(:gallery)
      end

      it 'has a "thumb" variant' do
        expect(variants).to include(:thumb)
      end

      it 'is required' do
        expect(article).to validate_attached_of(:image)
      end

      it 'must be a valid image file' do
        expect(article).to validate_content_type_of(:image).allowing(:jpg, :jpeg, :png)
      end

      it 'must be of the right size (<= 1MB)' do
        expect(article).to validate_size_of(:image).less_than_or_equal_to(1.megabyte)
      end
    end
  end
end
