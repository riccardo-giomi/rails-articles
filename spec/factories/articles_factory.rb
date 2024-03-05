# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Title Value' }
    abstract { 'Abstract Value' }
    content { 'Content Value' }
    image_caption { 'Image caption Value' }
    author { 'Author Value' }

    # Handy for specs with more than one record, specifically those specifying
    # update operations
    factory :another_article do
      title { 'Title Value' }
      abstract { 'Abstract Value' }
      content { 'Content Value' }
      image_caption { 'Image caption Value' }
      author { 'Author Value' }
    end

    # Used to generate "models with valid attributes" in specs, e.g. for
    # requests.
    #
    # in specs, e.g. for requests.
    # It can be expanded later if the model gains special attributes.
    factory :complete_article do
      after(:build) do |object|
        object.image.attach(
          io:           File.open(Rails.root.join('spec/fixtures/files/300x300.jpg').to_s),
          filename:     'article_image.jpg',
          content_type: 'image/jpg'
        )
      end
    end
    # Used to create "model with invalid attributes" in specs (e.g. requests).
    # Add invalid/empty values here for attributes as you define validations for
    # them in the model.
    #
    # Note that if there are required attachments nothing needs to be added here.
    factory :invalid_article do
      title { nil }
    end
  end
end
