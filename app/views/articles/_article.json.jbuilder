# frozen_string_literal: true

json.extract! article, :id, :title, :abstract, :content, :image, :image_caption, :author, :created_at, :updated_at
json.url article_url(article, format: :json)
json.image url_for(article.image)
