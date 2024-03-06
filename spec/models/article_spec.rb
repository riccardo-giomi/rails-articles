# frozen_string_literal: true

RSpec.describe Article do
  let(:article) { build(:article) }

  describe '.attributes' do
    specify('title') { expect(article.title).to eq('Title Value') }
    specify('abstract') { expect(article.abstract).to eq('Abstract Value') }
    specify('content') { expect(article.content).to eq('Content Value') }
    specify('image_caption') { expect(article.image_caption).to eq('Image caption Value') }
    specify('author') { expect(article.author).to eq('Author Value') }
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

      # Additional spec for images that are validated as required.
      # it 'is required' do
      #   expect(article).to validate_attached_of(:image)
      # end

      it 'must be a valid image file' do
        expect(article).to validate_content_type_of(:image).allowing(:jpg, :jpeg, :png)
      end

      # Additional spec for images that have a size validation (1MB in this example).
      # it 'must be of the right size (<= 1MB)' do
      #   expect(article).to validate_size_of(:image).less_than_or_equal_to(1.megabyte)
      # end
    end
  end
end
